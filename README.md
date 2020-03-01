<a href="http://fvcproductions.com"><img src="https://avatars1.githubusercontent.com/u/4284691?v=3&s=200" title="FVCproductions" alt="FVCproductions"></a>

<!-- [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com) -->

# irc.segured.org Configurations

## Table of Contents

- [Basic](#basic)
- [Clone](#clone)
- [Setup](#setup)
- [Team](#team)
- [FAQ](#faq)
- [Support](#support)
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
git config --global user.email "alxsenen@gmail.com"
git config --global user.name "Alex"
```
> Luego de clonar el repo le pasamos esta linea para guardar las credenciales:

```shell
git config credential.helper store
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
/*

## Contributing

> To get started...

### Step 1

- **Option 1**
    - 🍴 Fork this repo!

- **Option 2**
    - 👯 Clone this repo to your local machine using `https://github.com/joanaz/HireDot2.git`

### Step 2

- **HACK AWAY!** 🔨🔨🔨

### Step 3

- 🔃 Create a new pull request using <a href="https://github.com/joanaz/HireDot2/compare/" target="_blank">`https://github.com/joanaz/HireDot2/compare/`</a>.

---

## Team

> Or Contributors/People

| <a href="http://fvcproductions.com" target="_blank">**FVCproductions**</a> | <a href="http://fvcproductions.com" target="_blank">**FVCproductions**</a> | <a href="http://fvcproductions.com" target="_blank">**FVCproductions**</a> |
| :---: |:---:| :---:|
| [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com)    | [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com) | [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com)  |
| <a href="http://github.com/fvcproductions" target="_blank">`github.com/fvcproductions`</a> | <a href="http://github.com/fvcproductions" target="_blank">`github.com/fvcproductions`</a> | <a href="http://github.com/fvcproductions" target="_blank">`github.com/fvcproductions`</a> |

- You can just grab their GitHub profile image URL
- You should probably resize their picture using `?s=200` at the end of the image URL.

---

## FAQ

- **How do I do *specifically* so and so?**
    - No problem! Just do this.

---

## Support

Reach out to me at one of the following places!

- Website at <a href="http://fvcproductions.com" target="_blank">`fvcproductions.com`</a>
- Twitter at <a href="http://twitter.com/fvcproductions" target="_blank">`@fvcproductions`</a>
- Insert more social links here.

---

## Donations (Optional)

- You could include a <a href="https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.png" target="_blank">Gratipay</a> link as well.

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.png)](https://gratipay.com/fvcproductions/)


---

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="http://fvcproductions.com" target="_blank">FVCproductions</a>.

