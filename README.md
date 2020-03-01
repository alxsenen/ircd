<a href="http://webchat.segured.org"><img src="https://zulipchat.com/static/images/integrations/logos/irc.svg" align="center" width="25%" height="auto" title="irc.segured.org" alt="irc.segured.org"></a>

<!-- [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com) -->

# irc.segured.org

## Table of Contents

- [Basic](#basic)
- [Clone](#clone)
- [Setup](#setup)
- [Start](#start)
- [License](#license)

---

### Basic

```shell
$ hostnamectl set-hostname irc
$ adduser ircd
$ apt update; apt upgrade -y
$ apt install curl wget apt-transport-https dirmngr git build-essential gcc make g++ libssl-dev gettext-lint cmake libmysql++-dev
$ echo "ircd	ALL=(ALL:ALL) ALL" >> /etc/sudoers
$ su - ircd
$ echo "export LC_CTYPE=es_ES.UTF-8" >> ~/.bashrc 
$ echo "export LC_ALL=es_ES.UTF-8" >> ~/.bashrc
```

### Clone

> Clone the required repositories

```shell
$ mkdir core; cd core
$ git clone https://github.com/unrealircd/unrealircd.git
$ git clone https://github.com/anope/anope.git
$ git clone https://github.com/alxsenen/ircd.git
```

> Extra git configurations

```shell
$ git config --global user.email "alxsenen@gmail.com"
$ git config --global user.name "Alex"
```
> This line is for store git credential after clone repositorie (Optional)

```shell
$ git config credential.helper store
```
### Setup

> Setting up UnrealIRCd and compile

```shell
$ cd ~/core/unrealircd
$ ./Config # presionamos [enter] en todas las opciones
$ make; make install
$ cd ~/unrealircd; mv conf conf-orig; ln -s ~/core/ircd/uconf; mv uconf conf
```

> Setting up Anope IRC Services

```shell
$ cd ~/core/anope
$ ./Config # presionamos [enter] en todas las opciones
$ ./extras # para habilitar los módulos [ m_mysql.cpp | m_sql_log.cpp | m_ssl_openssl.cpp | stats ]
$ make; make install
$ cd ~/services; mv conf conf-orig; ln -s ~/core/ircd/uconf; mv sconf conf
```

---

## Start

> Start up UnrealIRCd Server

```shell
$ cd ~/unrealircd; ./unrealircd start
```

> Start up Anope IRC Services

```shell
$ cd ~/services; ./services
```

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="http://fvcproductions.com" target="_blank">segured.org</a>.

