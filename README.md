# irc.segured.org
All configurations for this irc server.

hostnamectl set-hostname irc
adduser ircd
apt update
apt upgrade -y

-- Agrego el user ircd a sudo
-- Edito ~/.bashrc y agrego las lines:
	export LC_CTYPE=es_ES.UTF-8
	export LC_ALL=es_ES.UTF-8
--
su ircd
sudo apt install curl wget apt-transport-https dirmngr git build-essential gcc make g++ libssl-dev gettext-lint cmake libmysql++-dev
mkdir core; cd core
--
# Clonamos los repositorios de UnrealIRCd, Anope IRC Services e IRCd(Configuraciones se los servicios y servidor)
git clone https://github.com/unrealircd/unrealircd.git; git clone https://github.com/anope/anope.git; git clone https://github.com/alxsenen/ircd.git
--
# Instalamos UnrealIRCd
cd unrealircd
./Config # presionamos [enter] en todas las opciones
make; make install
cd ~/unrealircd; mv conf conf-orig; ln -s ~/core/ircd/uconf; mv uconf conf
--
--
# Instalamos Anope IRC Services
cd anope
./Config # presionamos [enter] en todas las opciones
./extras # para habilitar los módulos [ m_mysql.cpp | m_sql_log.cpp | m_ssl_openssl.cpp | stats ]
make; make install
cd ~/services; mv conf conf-orig; ln -s ~/core/ircd/uconf; mv sconf conf
--
# Otras configuraciones de git
git config --global user.email "alxsenen@gmail.com"
git config --global user.name "Alex"
# Luego de clonar el repo le pasamos esta linea para guardar las credenciales:
	git config credential.helper store
--
