#!/bin/bash
#Run Script as root or sudo
#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "Run Script as root or sudo" 2>&1
  exit 1
else
yum groupinstall -y "Development tools"
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel openldap-devel git-core

# switch to home directory
cd ~/
wget http://python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz
tar xf Python-2.7.6.tar.xz

cd Python-2.7.6

# configure and install python2.7
./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
make && make altinstall

# install pip
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
python2.7 ez_setup.py
easy_install-2.7 pip

pip2.7 install docopt
pip2.7 install zabbix_api
pip2.7 install python-ldap

fi