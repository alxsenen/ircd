#################################################
###   Begin All BogusTrivia Script Settings   ###
###                                           ###
###  You MUST Set your Trivia Channel below!  ###
###  All other settings can be left default.  ###
#################################################


################ !! NEW BogusLimits Settings !! ################
# limit the number of points any one player can get in one day ?? #
# set this to "0" to turn off player limiting #
# or set this to the max number of points a player can get per day #
set t2(limit) "0"

# limit will always match players by nick, and ignore them if over limit
# limit can also match players by user name and/or host name
# 0 = limit matches players by nick only (they may continue to play with a different nick)
# 1 = match players by host name (this may limit everyone playing from the same ip address)
# 2 = match players by user name (not sure how well this may work, players can change this:)
# 3 = match by username@hostname (safest, keep from limiting 2 players from the same address)
set t2(l-match) "0"

# set the text to use when someone reaches the point limit for the day #
# set this empty to not say anything # %n = nick # %l = point limit #
set t2(l-stxt) "You have reached the daily point limit of %l."

# set the reminder text to use when someone answers correct but is already limited #
# set this empty to not say anything # %n = nick # %l = point limit #
set t2(l-rtxt) "Sorry, you have already reached the point limit for today."

# set the max times to remind someone that they have reached the daily limit #
# set this to "0" to not do reminders #
# 1 - 9 = max number of reminders before silent ignore of player #
set t2(l-rnum) "1"


############## !! NEW Advanced Custom Points Rounding Settings !! ##############

# by default, bogus chooses the best points rounding plan, based on your points settings. #
# or you can try to force your preferred points rounding settings below (valid settings: 0-9) #
# 0 = custom rounding off (default): use the default smart points rounding settings #
# 1 = custom on: turn off all points rounding for this this item #
# 2 = custom on: round all randomly chosen initial points values to the nearest 10 #
# 3 = custom on: round all randomly chosen initial points values to the nearest 100 #
# 4 = custom on: round all randomly chosen initial points values to the nearest 1000 #
set t2(roundques) "0"    ;# use custom points rounding for regular questions ?? #
set t2(roundbonus) "0"   ;# use custom points rounding for bonus questions ?? #
set t2(roundkaos) "0"    ;# use custom points rounding for kaos answers ?? #
set t2(roundkbon) "0"    ;# use custom points rounding for kaos bonus amounts ?? #


########  Script Settings & Options  ########

set t2(chan) "#trivia"   ;# channel to run bogustrivia in  <- !! YOU MUST SET THIS !! #

set t2(mflag) "m|m"   ;# flags for /msg commands  (.add .mix) #

set t2(on) "!iniciar"      ;# public trigger to turn game on #
set t2(off) "!apagar"        ;# public trigger, game off  ("" = same as on trigger) #
set t2(oflag) "-|-"   ;# flags to turn the game on ("" = everyone) #
set t2(sflag) "-|-"      ;# flags to turn game off    ("" = same as on flags) #
                      ;# separate off flags requires using separate on & off triggers #

set t2(lpoint) "500"     ;# low end of points range  (1 or more) #
set t2(hpoint) "1000"    ;# high end of points range (same or above lpoint) #

set t2(qtime) "15"    ;# play time between hints (6 to 60 seconds) #
set t2(ptime) "6"    ;# play time between questions (6 to 60 seconds) #

set t2(dobonus) "10"      ;# how often to do a bonus (by question count) (0=off) #

set t2(minbonus) ""  ;# min points for bonus (empty (or 0)=uses hpoint setting as before) #  <- NEW SETTING #
set t2(maxbonus) "2500"  ;# max points for bonus (above minbonus (or hpoint) #

set t2(kaos) "10"     ;# how often to do a kaos (by question count) (0=off) (1=do only kaos) #
set t2(ktime) "20"    ;# time between hints on kaos (6 to 90 seconds) #

set t2(klpoint) "500"   ;# low end of points per kaos answer range  (1 or more) #
set t2(khpoint) "1000"  ;# high end of points per kaos answer range (same or above klpoint) #

# change the default . command prefix to something else #
#  "." = leave all . prefixes as is (default) #
#  "!" = change all . prefixes to ! (or any other character) #
#  ""  = no command prefix (remove the . prefix) #
set t2(p-cmdpre) "."    ;# public command prefix #
set t2(m-cmdpre) "."    ;# private message command prefix #

# change the default character to use as the placeholder in hints (any single character) #
set t2(hintchar) "*"

# on-join channel greeting #
# send on-join greeting how ??  (0 = off: no channel greeting) #
# 1 = private msg  | 2 = user notice  | 3 = public  | 4 = channel notice #
#  SEE BELOW:  Advanced Channel Greet Settings #
set t2(greet) "3"

# auto-voice top trivia players ??  (0 = off: no top player auto-voice) #
# 1 = on channel join  | 2 = on correct answer  | 3 = on both #
#  SEE BELOW:  Advanced Channel Auto-Voice Settings #
set t2(voice) "3"

# extended public game commands  (examples: .mystats .topday .topweek20) #
# enable new bogustrivia public commands ?? (1 or more = yes | 0 = no or off) #
# 1 or more = number of seconds to wait before answering another public command #
#  SEE BELOW:  Advanced Public Commands Settings #
set t2(pubcmd) "10"

# color themes #
# 1 =bogus default           # 2 =blue white black yellow #
# 3 =bright green red yellow # 4 =purple grey             #
# 5 =brown grey              # 6 =black orange            #
# 7 =blue green yellow       # 8 =grey brown black orange #
# 0 = No colors              #
set t2(color) "7"

# stat lines for active day week month and ever show top 10 or 20 or 30 users ?? #
set t2(today) "20"      ;# 1 = 10  | 2 = 20  | 3 = 30 #

# stat lines for yesterday, lastweek, & lastmonth show top 10, 20 or 30 users ?? #
set t2(yesterda) "1"   ;# 1 = 10  | 2 = 20 |  3 = 30 #

# stat lines for logs older than yesterday etc. # ex. 2 Weeks Ago Top 10 #
set t2(history) "0"    ;# 0 = off  | 1 = 10 |  2 = 20 #

# stat lines like:  Top Player of: - Sunday: nick points - Monday: nick.... #
set t2(otherhist) "0"  ;# 0 = off  | 1 = on #

set t2(shonum) "1"     ;# show the question number ?? (1=yes | 0=no) #
set t2(shothe) "1"     ;# show leading 'the' in first hint ?? (1=yes | 0=no) #
set t2(descend) "1"    ;# points go down with each hint ?? (1=yes | 0=no) #

# show or hide answers to questions or kaos ?? #
set t2(givansr) "1"    ;# show answer to regular questions ?? (1=yes | 0=no) #
set t2(givkaos) "1"    ;# show answers to kaos questions ??   (1=yes | 0=no) #

set t2(randad) "4"     ;# how often to show random ad (by question count) (0=off) #

# random ad lines.  one ad per line.  as many as you want (no limit) #
##  Random Lines Below  ##
set t2(rndlin) {


Comandos Públicos: !iniciar - !apagar - !pista - !mispuntos - !info - !reglas - !topdia - !topsemana - !topmes - !top10 - !hora - !puntos elnick
Los jugadores del top semanal recibirán voice.


}  ;##  END Random Ad Lines ! ##  END USER SETTINGS ##  END USER SETTINGS ##


############################################################################
#### !! END SETTINGS !! #### !! END SETTINGS !! #### !! END SETTINGS !! ####
############################################################################

##########  Advanced Settings  ( no need to edit these )  ##########

# play flags #  flags required to play the game ("" = everyone) #
set t2(pflag) ""

# max character limit per question line (usually 512 minus the message header info) #
# Note:  leave this at default, unless you are having long questions missing or truncated. #
#        you may be able to set this larger if your botnick and channel name are very short. #
#        if you're still noticing missing/truncated question lines, lower this setting some. #
set t2(maxchar) "410"

# anti-theft #  random letter fill of spaces in questions ?? #
# turning this on will cause long questions to be over the server max char limit of 512 #
set t2(randfil) "0"   ;# anti-theft on ?? (1=yes | 0=no) #

# over max disables antitheft #
# if a question is over the max character limit, and anti-theft is on, #
# temporarily disable anti-theft to try to stay under the character limit ?? #
# 0 = no: never disable anti-theft if it's on #
# 1 = yes: disable anti-theft for very long questions #
set t2(maxanti) "0"

# what should bogustrivia do if a question is over the max character limit ?? #
# 1 = cut the question to what will fit on one question line #
# 2 = send the remaining question text on a 2nd line #
set t2(maxhow) "2"

# user question #  public command to show current question again #
# 0 = off: disable user question command #
# 1 = on: cut long questions to what will fit on one question line #
# 2 = on: split long questions into 2 question lines #
# Note: command can be used only once per question & only after the 2nd hint #
set t2(usrqes) "2"

set t2(upubq) "!repetir"     ;# public trigger to see user question ( default: q ) #
set t2(pqflag) ""  ;# flags required to use question command ("" = everyone) #

# user hint #  public command to show next hint #
set t2(hint) "!pista"      ;# public trigger to see user hint ( default: ~ ) #
set t2(hflag) ""   ;# flags required to use hint command ("" = everyone) #

# slow-times or idle-stop #  after this many questions with no one playing the game: #
# the times between hints & questions increase to these settings, #
# or idle-stop the bogustrivia game. #
set t2(sqcnt) "150"     ;# use slow-times or idle-stop after this many questions not played #
set t2(qslow) "0"    ;# slow time between hints (6 to 90 seconds) (0 = idle-stop the game) #
set t2(pslow) "25"    ;# slow time between questions (6 to 90 seconds) #
# Note: if set to less than play-times & more than 0, slow-times will be same as play #

# resting-times or idle-stop #  after this many questions with no one playing the game: #
# the times between hints & questions increase to these settings, #
# or idle-stop the bogustrivia game. #
set t2(rqcnt) "15"   ;# use resting-times or idle-stop after this many not played #
set t2(rest) "30"    ;# resting time between hints/questions (6 to 120) (0 = idle-stop the game) #
# Note: if set to less than slow-times & more than 0, rest-times will be same as slow #

# on-join auto-start #
# automaticly start bogustrivia when someone joins the channel ??  (0 = no) #
# Note:  for this to function, Idle-stop Must Be Turned ON!  #
# Note:  using the public off command overrides auto-start!  #
#        use the public on command to reactivate auto-start. #
# Note:  auto-start only triggers if bogus was idle-stopped. #
# 1 = silently start game  |  2 = say public  |  3 = say channel notice #
#  SEE BELOW:  Advanced On-Join Auto-Start Settings #
set t2(autostart) "2"

# strip color codes from players answers # requires eggdrop 1.6.17+ #
# allow BogusTrivia to accept answers typed in color ? #
# this will have the bot remove color codes to look for an answer match #
set t2(stripcolor) "1"   ;# (1=yes | 0=no) #

# strip extra spaces from players answers #
# allow BogusTrivia to accept answers typed with extra spaces ?? #
# this will have the bot remove any leading or trailing spaces and change any #
# double spaces to a single space to look for an answer match #
set t2(stripspace) "0"   ;# (1=yes | 0=no) #

# use advanced player matching system to find someone's existing stats ?? #
# 0 = no: find existing player stats by nick only #
# 1 = yes: use original advanced player matching system  (leaves stats open to player abuse!) #
#     uses nick or handle or user@host to find someone's existing stats #
set t2(match) "0"

# restart game on trivia bot rejoin channel ?? #
set t2(restart) "0"   ;# (1=yes | 0=no) #

# database backup # (0=off | 1=keep 1 backup) # or keep 'x' backups (0 - 9)#
set t2(bakupu) "2"   ;# backup the user file ?? #
set t2(bakuph) "2"   ;# backup the history file ?? #

# backup user file how often # 1 = once a day at midnight # 2 = twice, at noon & midnight #
set t2(bakhow) "1"

##########   Advanced Stats Settings   ##########
# weekly stats #  new week starts on monday morning ??  (1 = monday) #
# 2=tuesday | 3=wednesday | 4=thursday | 5=friday | 6=saturday | 7=sunday #
set t2(newweek) "7"

# show/hide these timed player stats to the channel ??  (1=show | 0=hide) #
set t2(ever) "1"     ;# show top10 ever stats lines ??  #
set t2(tda) "1"      ;# show today ??      #
set t2(twe) "1"      ;# show this week ??  #
set t2(tmo) "1"      ;# show this month ?? #

set t2(lda) "1"      ;# show yesterday ??  #
set t2(lwe) "1"      ;# show last week ??  #
set t2(lmo) "1"      ;# show last month ?? #

# user file maint # affects the ever stats & the size of the user file #
set t2(usrmax) "1000"  ;# max number of users in the user file.  (200 or more) #
set t2(oldusr) "365"  ;# remove all users not seen in this many days ?? (0=no) #

##########   Advanced KAOS Settings   ##########
# bogus can do kaos hints in 2 ways,  long hints or a shorter ver. (try it:) #
# (0 - 3)  # default: "1"  =short first hint & full hints 2 and 3 #
# 0=all long hints  | 1=short hint1  | 2=short hint2  | 3=short hint3 also #
set t2(kstyle) "1"

# stop doing kaos questions if no one has been playing ?? (if slow or resting) #
set t2(krest) "1"   ;# 0=no krest  | 1=no kaos after rest  | 2=none after slow #

# kaos bonus #  award a bonus to all kaos players if they get all the answers ?? #
# Note:  kaos bonus will only be awarded if more than one player is answering! #
set t2(kbonus) "9"      ;# 0=off  | 1+ =min number of answers to be a bonus (0 - 9) #
set t2(kbonlo) "100"   ;# low end of kaos bonus points range  (1 or more) #
set t2(kbonhi) "350"  ;# high end of kaos bonus points range (same or above kbonlo) #

##########  Advanced On-Join Auto-Start Settings  ##########
# set exempt user flags for on-join auto-start #
# ex. o         :same as o|o  :exempt all global & channel ops #
# ex. -|mn      :exempt only channel masters & owners #
# ex. f|*       :exempt global friends and everyone with any channel flags #
# ex. -         :same as -|-  :exempt no one  (exempt players off) #
# ex. bmn|bfmn  :good setting to quiet the on-join auto-start some #
set t2(a-xflag) "b"

# set exempt nicks for on-join auto-start #
# ex. {bart}            :do not auto-start for bart on channel join #
# ex. {bart ted ted^}   :do not auto-start for bart ted or ted^ on channel join #
set t2(a-xnick) {}

# number of seconds to delay the game start  (valid settings = 5 or more) #
set t2(a-delay) "10"

# don't start for same nick for how many minutes ??  (valid settings = 1 or more) #
set t2(a-same) "10"

# SEE BELOW:  Custom On-Join Auto-Start Colors #

##########  Advanced Channel Greet Settings  ##########
# set exempt user flags for on-join greeting #
# ex. b         :same as b|b  :exempt all global & channel bots #
# ex. -|mn      :exempt only channel masters & owners #
# ex. f|*       :exempt global friends and everyone with any channel flags #
# ex. -         :same as -|-  :exempt no one  (exempt users off) #
# ex. bmn|bfmn  :good setting to quiet the on-join greeting some #
set t2(g-xflag) "b"

# set exempt nicks for on-join greeting #
# ex. {bart}            :do not greet bart #
# ex. {bart ted ted^}   :do not greet bart ted or ted^ #
set t2(g-xnick) {}

# don't re-greet same nick for how many minutes ?? (valid settings = 1 or more) #
set t2(g-same) "10"

#  Greeting Text Strings  (text to say when someone joins the channel) #

# if on-join greet is on,  bogus will greet known players with their game stats. #
# bogustrivia can also say this text to everyone that joins the channel. #
# set this empty to not greet unknown users & just say stats for known players. #
# variable substitution codes:  %c=channel  %n=nick  %b=botnick #
#                            :  %1=themecolor1  %2=themecolor2  #
set t2(g-say) {

%1 Bienvenido/a a %c%2 %n 

} ;#  END On-Join Greeting Line(s) ! #

# in a channel join flood,  bogus can greet them all with one greeting message. #
# individual player stats aren't done in a channel join flood. #
# set this empty to not do any greeting during a join flood. #
# variable substitution codes:   same as above except...     #
#   %n = a list of all nicks involved in the join flood.     #
set t2(g-fludsay) {

%2 [%n] %1 Bienvenido/a a %c 

} ;#  END Join Flood Greeting Line(s) ! #

# SEE BELOW:  Custom On-Join Greet Colors #

##########  Advanced Channel Auto-Voice Settings  ##########
# auto-voice top 3 players ??  (0 = don't auto-voice top 3 players) #
# 1 = voice top3 this week  | 2 = voice top3 this month  | 3 = voice both #
set t2(v-top3) "0"

# auto-voice top 10 players ??  (0 = don't auto-voice top 10 players) #
# 1 = voice top10 this week  | 2 = voice top10 this month  | 3 = voice both #
set t2(v-top10) "3"

# minimum points to get auto-voiced ??  (0 = no minimum points) #
set t2(v-min) "0"

# tell the player why they were voiced ??  (0 = say nothing about the +v) #
# 1 = private msg  | 2 = user notice  | 3 = public  | 4 = channel notice #
set t2(v-how) "3"

# auto-voice players that already have +o ??  (0 = never voice players with +o) #
# 1 = on channel join  | 2 = on correct answer  | 3 = on both #
set t2(v-op) "3"

# maximum number of nicks to voice per mode command ??  (valid settings = 1 to 9) #
set t2(v-max) "3"

#  Advanced on-join auto-voice settings #

# set exempt user flags for on-join auto-voice #
# ex. o         :same as o|o  :exempt all global & channel ops #
# ex. -|mn      :exempt only channel masters & owners #
# ex. f|*       :exempt global friends and everyone with any channel flags #
# ex. -         :same as -|-  :exempt no one  (exempt players off) #
# ex. bmn|bfmn  :good setting to quiet the on-join auto-voice some #
set t2(v-xflag) "b"

# set exempt nicks for on-join auto-voice #
# ex. {bart}            :do not auto-voice bart on channel join #
# ex. {bart ted ted^}   :do not auto-voice bart ted or ted^ on channel join #
set t2(v-xnick) {}

# don't say was voiced same nick for how many minutes ??  (valid settings = 1 or more) #
set t2(v-same) "10"

# when to voice multiple players in same mode command ??  (valid settings = 1 or 2) #
# 1 = multi-voice all the time  | 2 = multi-voice only under join flood conditions #
set t2(v-mhow) "2"

# when to say 'voiced multiple players' in single public reply ?? #
# 1 = single public reply all the time  | 2 = only under join flood conditions #
set t2(v-msg) "2"

# SEE BELOW:  Custom Say Voiced Colors #

##########  On-Join Flood Settings  ##########
# maximum number of joins to reply to before triggering a join flood ??  (2 to 9) #
# note:  each say 'voiced player(s)' = 1 reply  &  greeting a player = 1 reply #
set t2(jflud) "5"

# number of seconds to monitor for the above number of replies ??  (10 to 60) #
set t2(jftime) "20"

# how often to send a reply from the on-join reply queue (1 to 9 seconds) #
set t2(jqtime) "4"

##########  Advanced Public Commands Settings  ##########

#  General game commands #

set t2(p-gflag) ""   ;# flags to use advanced general game commands (""=everyone) #

# public trigger(s) to use for each general game command #
# ex. ".mystats"           :reply to the public trigger  .mystats #
# ex. ".mystats .myrank"   :reply to  .mystats  or  .myrank #
# ex. ""                   :disable this public command #

# see your current bogustrivia stats #
set t2(p-mystat) "!mispuntos"

# see other players current bogustrivia stats ?? (example: .stats nick ) #
set t2(p-opstat) "!puntos"

# see the bogustrivia game information ??  (please leave this :) #
set t2(p-info) "!info"

# see the bogustrivia version and credits ??  (please leave this :) #
set t2(p-owner) ".verswswdedqw"

# if BogusHTML is loaded and running, see the web address of the stats pages ?? #
set t2(p-page) ".webstats .www"                 ;# public trigger(s) #
set t2(p-pwww) "http://athlon.ispeeds.net/~bogus/"   ;# web address of the stats pages #


# user defined public triggers and replies ################################
# you can add as many triggers and replies as you want below.             #
# public triggers added this way use the general game commands flags.     #
# the basic format for each is as follows:                                #
# :TRIGS: .trigger .alt-trigger      (each word is added as a trigger)    #
# skip a line and type the desired reply, use as many lines as needed,    #
# each line will be sent separatly as the triggered reply.                #
# Skip a line, Type :TRIGS: & the Trigger(s) for the next Public Command, #
# skip a line and type the desired return, as many commands as needed.    #
#                                                                         #
# you can also make your own custom private message triggers & replies.   #
# this will make private message triggers with private message replies.   #
# message triggers added this way use the flags for /msg commands (mflag) #
# the basic format for each is as follows:                                #
# :TRIGS: .msg-trigger .alt-msg-trig :PRVMSG:                             #
# skip a line and type the desired reply.   (follow the examples below)   #
#                                                                         #
# you can also change the access flags used for each public/message cmd.  #
# the basic format for this is as follows:                                #
# :TRIGS: .trigger .alt-trigger :FLAGS: o|o     (for a public trigger) or #
# :TRIGS: .msg-trigger :FLAGS: o|o :PRVMSG:     (for a message trigger)   #
#                                                                         #
# user defined public reply info #                                        #
# variable substitution codes:   %c=channel   %n=nick   %b=botnick        #
#            :  %1=themecolor1   %2=themecolor2      %3=themecolor3       #
#            :  %s=script name   %v=script version   %a=script author     #
#            :  %o=script release date               %w=webstats address  #
#            :  %l=current local game/server time    %i=game/server date  #
#            :  %m=the command used to trigger this reply                 #
#            :  %u=date the userfile was created (when game/stats began)  #
#            :  %t=total number of players in the userfile                #
#            :  %q=number of regular questions in the database            #
#            :  %k=number of kaos questions in the database               #
#            :  %z=total number of questions (regular + kaos)             #
#                                                                         #
# Note: want to format the date/time variables (%o %l %i %u) differently? #
#       see the "Format Date/Time" section in the Commands.txt file       #
#                                                                         ######
# variable substitution codes & setting for "active players" information:      #
#      :  %g=active players (the number of nicks that played in last 'x' days) #
#      :  %d=number of days (replaced by the value of 'x' above)               #
#         example:  We've had %g active players in the last %d days.           #
set t2(p-activ) "7"  ;# set the number of days to use for "active players" #####

# user defined public triggers and replies begins below (set empty to disable this) #
set t2(p-other) {

:TRIGS: !comandos .comandos

%1 Comandos Disponibles: !iniciar - !apagar - !repetir - !pista - !mispuntos - !info - !reglas - !topdia - !topsemana - !topmes - !top10 - !hora - !puntos elnick 

:TRIGS: !reglas :FLAGS: -

%2 Bienvenido a %c. Por favor siga las reglas del canal y disfrute del juego.
%2 Sea cortés con otros jugadores.
%2 Abstenerse de lenguaje vulgar cuando sea posible.
%2 No abusar de los comandos del Trivial.
%2 Evita el flood.
%2 Si tienes problemas, por favor envía un mensaje a un Administrador del canal.

:TRIGS: !hora

%1 Hora del Juego/Servidor: %f%c%i. 

} ;#  END user defined public trigger reply text ! (do not remove this line!) #

#####################################################


#  Top players commands #

set t2(p-tflag) ""   ;# flags to use top players commands (""=everyone) #

# public trigger(s) to use for each top player command #
# ex. ".topday"          :reply to the public trigger  .topday #
# ex. ".topday .today"   :reply to  .topday  or  .today #
# ex. ""                 :disable this public command #

# see top players today #
set t2(p-top-d) "!topdia"  ;# see top 1 - 10 players today #
set t2(p-t20-d) "!topdia20 .topdia20"       ;# see top 11 - 20 players today #

# trigger to use for top players today above 20  (%% = number above 20) #
# example:  using .topday30 in channel will show players ranked 21 - 30 #
set t2(p-tmor-d) ".topday%% .today%%"
set t2(p-tmax-d) "30"    ;# maximum number of daily top players to show #

# see top players this week #
set t2(p-top-w) "!topsemana"
set t2(p-t20-w) ".topsemana20 !topsemana20"

set t2(p-tmor-w) ".topweek%% .thisweek%%"
set t2(p-tmax-w) "30"    ;# maximum number of weekly top players to show #

# see top players this month #
set t2(p-top-m) "!topmes .topmes"
set t2(p-t20-m) "!topmes20 .topmes20"

set t2(p-tmor-m) ".topmonth%% .thismonth%%"
set t2(p-tmax-m) "30"    ;# maximum number of monthly top players to show #

# see top players ever #
set t2(p-top-e) "!top10"
set t2(p-t20-e) "!top20"

set t2(p-tmor-e) ".topever%% .ever%%"
set t2(p-tmax-e) "30"    ;# maximum number of top ever players to show #

# SEE BELOW:  Custom Public Commands Colors #

########  Custom Colors Setup:  (( standard mirc color codes ))  ########
# turn on custom colors setup ??  (0=no | 1=yes) #
# ( turning this on overrides color themes setting above! ) #
set t2(custclr) "0"

# Color settings for items below can be set in 3 ways: #
# 1) one number:  like "06" : for text in purple #
# 2) two numbers: like "04,12" : for red text, blue background (1st# = text, 2nd# = background) #
# 3) no numbers:  like "" : no color code for this item.. text will be user default colors. #
#------------------------------------------------------------------------------------#
# 00=white 01=black 02=dkblue 03=green 04=red 05=brown 06=purple 07=orange 08=yellow #
# 09=lightgreen 10=darkgreen 11=bluegreen 12=blue 13=pink 14=darkgrey 15=lightgrey   #
#------------------------------------------------------------------------------------#

# colors for the question text #
# ( should have a background color ) #
set tscl(qt) "05,15"
# colors for all timed hints #
set tscl(hint) "05,15"
set tscl(hint2) "07,15"

# this line:  Question Value : 8200 Points #
# and:  30 secs & 2650 Points Remaining #
set tscl(pnt1) "07"
set tscl(pnt2) "05"
# this line: BONUS Question Value : 15000 Points #
set tscl(bonus) "07"
set tscl(bon2) "05"

# this line: Times up!  The answer was ->  The Who  <- #
# and: YES, SpiKe^^ got the answer -> styx <- in 13.855 seconds.... #
# and: SpiKe^^ has won 4 in a row! Total Points TODAY: 185925.... #
set tscl(tu1) "05"
set tscl(tu2) "07"

# colors for user requested hints  ( public ~ reply ) #
set tscl(hnt1) "05,15"
set tscl(hnt2) "05,15"
# colors for the random ads #
set tscl(randad) "00,01"

########  Custom KAOS Colors  ########
# kaos uses same colors as normal questions ?? #
# (1=yes | 0=use custom kaos colors below) #
set tscl(ksame) "1"

# colors for all kaos hints #
set tscl(khnt) "05,15"
set tscl(khnt2) "05,15"

# this line:  Question Value : 70200 Points #
# and:  Each Answer : 7800 Points #
set tscl(kpnt1) "07"
set tscl(kpnt2) "05"

# this line: Times up!  No one got  [bulls] [bears] [cubs]
set tscl(ktu) "07"
set tscl(ktu2) "05"
set tscl(kng) "07"
# this line: Correctly Answered: 5 of 8  Total Awarded: 39000 Points to 2 Players
set tscl(kstat) "05"
set tscl(ksta2) "07"

# this line: ....Everyone gets a 500 Point Bonus !!
set tscl(kbon) "05"
set tscl(kbon2) "07"

########  Custom Stats Colors  (for all timed stats lines)  ########
# colors for all timed daily stats #
set tscl(d10) "05,15"
set tscl(d11) "01,15"
set tscl(d12) "05,15"
# all stats use the daily stats colors from above ?? #
# (1=yes | 0=use individual stats setup below) #
set tscl(same) "1"

# colors for all timed weekly stats #
set tscl(w10) "00,10"
set tscl(w11) "08,10"
set tscl(w12) "00,10"
# colors for all timed monthly stats #
set tscl(m10) "00,10"
set tscl(m11) "08,10"
set tscl(m12) "00,10"
# colors for all timed lifetime stats #
set tscl(e10) "00,10"
set tscl(e11) "08,10"
set tscl(e12) "00,10"

########  Custom On-Join Greet Colors  ########
set tscl(gr1) "00,01"    ;# code:  %1  in greeting text settings above #
set tscl(gr2) "00,01"    ;# code:  %2  in greeting text settings above #
set tscl(gstat) "05,15"
set tscl(gsta2) "01,15"
set tscl(gsta3) "05,15"

########  Custom Say Voiced Colors  ########
set tscl(vo1) "00,01"
set tscl(vo2) "00,01"
set tscl(vo3) "05,15"
set tscl(vo4) "01,15"

########  Custom On-Join Auto-Start Colors  ########
set tscl(as1) ""
set tscl(as2) ""

########  Custom Public Commands Colors  ########

# colors for the public .mystats & .stats <nick> reply #
set tscl(pmy1) "05,15"
set tscl(pmy2) "01,15"
set tscl(pmy3) "05,15"

# colors for the public .info reply #
set tscl(pinf1) "00,01"
set tscl(pinf2) "00,01"
set tscl(pinf3) "00,01"

# colors for the public .webstats reply #
set tscl(ppg1) "00,01"
set tscl(ppg2) "00,01"
set tscl(ppg3) "00,01"

# colors for the user defined public reply #
set tscl(poth1) "00,01"
set tscl(poth2) "00,01"
set tscl(poth3) "00,01"

# colors for the public .owner reply #
set tscl(pown) "00,01"

# colors for all user requested daily stats #
set tscl(ptd1) "05,15"
set tscl(ptd2) "01,15"
set tscl(ptd3) "05,15"
# colors for all user requested weekly stats #
set tscl(ptw1) "05,15"
set tscl(ptw2) "01,15"
set tscl(ptw3) "05,15"
# colors for all user requested monthly stats #
set tscl(ptm1) "05,15"
set tscl(ptm2) "01,15"
set tscl(ptm3) "05,15"
# colors for all user requested lifetime stats #
set tscl(pte1) "05,15"
set tscl(pte2) "01,15"
set tscl(pte3) "05,15"



############################################################################
##### !!  END Advanced Settings  !! #### !!  END Advanced Settings  !! #####
############################################################################
########   !!  END OF SETTINGS FILE  !!  END OF SETTINGS FILE  !!   ########
############################################################################

