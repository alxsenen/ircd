<a href="http://webchat.segured.org"><img src="https://zulipchat.com/static/images/integrations/logos/irc.svg" align="center" width="25%" height="auto" title="irc.segured.org" alt="irc.segured.org"></a>

<!-- [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com) -->

# irc.segured.org & https://webchat.segured.org

## Table of Contents

- [Basic](#basic)
- [Clone](#clone)
- [Setup](#setup)
- [Start](#start)
- [Webchat](#webchat)
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
$ git config --global user.email "user@mail.com"
$ git config --global user.name "Name"
```
> This line is for store git credential after clone repositorie (Optional)

```shell
$ git config credential.helper store
```

### MySQL

> Stopping MySQL Server

```shel
/etc/init.d/mysql stop
```
> Setting up MySQL root password

```shel
/etc/init.d/mysql stop

$ mysqld_safe --skip-grant-tables &
$ mysql -uroot
$ use mysql;
$ update user set authentication_string=PASSWORD("mynewpassword") where User='root';
$ flush privileges;
$ quit
```

> Starting MySQL Server normally

```shell
$ sudo /etc/init.d/mysql stop
$ sudo /etc/init.d/mysql start
```

> Setting up MySQL database for Anope IRC Services

```shell
$ CREATE DATABASE db_ircd;
$ CREATE USER 'db_ircd'@'localhost' IDENTIFIED BY 'db_ircd';
$ GRANT ALL PRIVILEGES ON * . * TO 'db_ircd'@'localhost';
$ FLUSH PRIVILEGES;
```

> Setting up iptables rules allowing access by 443 port

```shell
iptables -t nat -I PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 6667
iptables-save
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

> Starting UnrealIRCd Server

```shell
$ cd ~/unrealircd; ./unrealircd start
```

> Starting Anope IRC Services

```shell
$ cd ~/services; ./services
```

## Webchat

> Setting up nginx webserver

```shell
$ echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bashrc; source ~/.bashrc 
$ apt update; apt upgrade -y
$ apt install nginx nginx-full
$ nano /etc/nginx/sites-available/default # Cambiamos la variable server_name _; por server_name webchat.segured.org;
$ nginx -t # Comprobamos la configuración del nginx
$ services nginx restart
```

> Setting up nginx webserver by https

```shell
$ apt install python-certbot-nginx
$ certbot --nginx -d webchat.segured.org
$ /etc/init.d/nginx reload
```
> Setting up webchat by TheLounge

```shell
$ apt install nodejs
$ cd /opt; wget https://github.com/thelounge/thelounge/releases/download/v4.0.0/thelounge_4.0.0-1_all.deb
$ apt install ./thelounge_4.0.0-1_all.deb
$ adduser ircd
$ su ircd
$ cp -r /etc/letsencrypt/archive/webchat.segured.org/ /etc/thelounge/
$ mv webchat.segured.org/ ssl
$ 
```

> Starting Anope IRC Services

```shell
$ cd ~/services; ./services
```

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="http://fvcproductions.com" target="_blank">irc.segured.org</a>.

