"use strict";

const Chan = require("../../models/chan");
const Msg = require("../../models/msg");
const LinkPrefetch = require("./link");
const cleanIrcMessage = require("../../../client/js/helpers/ircmessageparser/cleanIrcMessage");
const Helper = require("../../helper");
const nickRegExp = /(?:\x03[0-9]{1,2}(?:,[0-9]{1,2})?)?([\w[\]\\`^{|}-]+)/g;

module.exports = function(irc, network) {
	const client = this;

	irc.on("notice", function(data) {
		// Some servers send notices without any nickname
		if (!data.nick) {
			data.from_server = true;
			data.nick = network.host;
		}

		data.type = Msg.Type.NOTICE;
		handleMessage(data);
	});

	irc.on("action", function(data) {
		data.type = Msg.Type.ACTION;
		handleMessage(data);
	});

	irc.on("privmsg", function(data) {
		data.type = Msg.Type.MESSAGE;
		handleMessage(data);
	});

	irc.on("wallops", function(data) {
		data.from_server = true;
		data.type = Msg.Type.NOTICE;
		handleMessage(data);
	});

	function handleMessage(data) {
		let chan;
		let from;
		let highlight = false;
		let showInActive = false;
		const self = data.nick === irc.user.nick;

		// Check if the sender is in our ignore list
		const shouldIgnore =
			!self &&
			network.ignoreList.some(function(entry) {
				return Helper.compareHostmask(entry, data);
			});

		// Server messages go to server window, no questions asked
		if (data.from_server) {
			chan = network.channels[0];
			from = chan.getUser(data.nick);
		} else {
			if (shouldIgnore) {
				return;
			}

			let target = data.target;

			// If the message is targeted at us, use sender as target instead
			if (target.toLowerCase() === irc.user.nick.toLowerCase()) {
				target = data.nick;
			}

			chan = network.getChannel(target);

			if (typeof chan === "undefined") {
				// Send notices that are not targeted at us into the server window
				if (data.type === Msg.Type.NOTICE) {
					showInActive = true;
					chan = network.channels[0];
				} else {
					chan = client.createChannel({
						type: Chan.Type.QUERY,
						name: target,
					});

					client.emit("join", {
						network: network.uuid,
						chan: chan.getFilteredClone(true),
						index: network.addChannel(chan),
					});
					client.save();
					chan.loadMessages(client, network);
				}
			}

			from = chan.getUser(data.nick);

			// Query messages (unless self) always highlight
			if (chan.type === Chan.Type.QUERY) {
				highlight = !self;
			} else if (chan.type === Chan.Type.CHANNEL) {
				from.lastMessage = data.time || Date.now();
			}
		}

		// msg is constructed down here because `from` is being copied in the constructor
		const msg = new Msg({
			type: data.type,
			time: data.time,
			text: data.message,
			self: self,
			from: from,
			highlight: highlight,
			users: [],
		});

		if (showInActive) {
			msg.showInActive = true;
		}

		// Self messages in channels are never highlighted
		// Non-self messages are highlighted as soon as the nick is detected
		if (!msg.highlight && !msg.self) {
			msg.highlight = network.highlightRegex.test(data.message);

			// If we still don't have a highlight, test against custom highlights if there's any
			if (!msg.highlight && client.highlightRegex) {
				msg.highlight = client.highlightRegex.test(data.message);
			}
		}

		let match;

		while ((match = nickRegExp.exec(data.message))) {
			if (chan.findUser(match[1])) {
				msg.users.push(match[1]);
			}
		}

		// No prefetch URLs unless are simple MESSAGE or ACTION types
		if ([Msg.Type.MESSAGE, Msg.Type.ACTION].includes(data.type)) {
			LinkPrefetch(client, chan, msg);
		}

		chan.pushMessage(client, msg, !msg.self);

		// Do not send notifications for messages older than 15 minutes (znc buffer for example)
		if (msg.highlight && (!data.time || data.time > Date.now() - 900000)) {
			let title = chan.name;
			let body = cleanIrcMessage(data.message);

			if (msg.type === Msg.Type.ACTION) {
				// For actions, do not include colon in the message
				body = `${data.nick} ${body}`;
			} else if (chan.type !== Chan.Type.QUERY) {
				// In channels, prepend sender nickname to the message
				body = `${data.nick}: ${body}`;
			}

			// If a channel is active on any client, highlight won't increment and notification will say (0 mention)
			if (chan.highlight > 0) {
				title += ` (${chan.highlight} ${
					chan.type === Chan.Type.QUERY ? "new message" : "mention"
				}${chan.highlight > 1 ? "s" : ""})`;
			}

			if (chan.highlight > 1) {
				body += `\n\n… and ${chan.highlight - 1} other message${
					chan.highlight > 2 ? "s" : ""
				}`;
			}

			client.manager.webPush.push(
				client,
				{
					type: "notification",
					chanId: chan.id,
					timestamp: data.time || Date.now(),
					title: title,
					body: body,
				},
				true
			);
		}
	}
};
