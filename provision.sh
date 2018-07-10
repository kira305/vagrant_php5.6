LANG="ja_JP.utf8"
# vagrant add box list
# vagrant box add centos67 https://github.com/CommanderK5/packer-centos-template/releases/download/0.6.7/vagrant-centos-6.7.box
# vagrant box add centos72 https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.2/vagrant-centos-7.2.box
# vagrant update hostupdate
# vagrant plugin install vagrant-hostupdate

sudo yum update
# httpd install
#sudo yum install -y httpd
#sudo chkconfig httpd on

# httpd.conf copy
sudo cp /etc/httpd/conf/httpd.conf "/etc/httpd/conf/httpd.conf.bak.`date +%Y%m%d`"
sudo cp /vagrant/startup/httpd.conf /etc/httpd/conf/

# Mysql install
sudo wget -q http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum -y install mysql-server

# PHP, Lib install
sudo yum -y install epel-release
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum -y install --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt
sudo yum -y install --enablerepo=remi,remi-php56 php-mysql php-mysqlnd php-intl
sudo yum install sendmail sendmail-cf m4
# php.ini copy
sudo cp /etc/php.ini "/etc/php.ini.bak.`date +%Y%m%d`"
sudo cp /vagrant/startup/php.ini /etc/

# domain conf
sudo cp /vagrant/startup/virtual_jpvn.conf /etc/httpd/conf.d/

# start httpd
sudo service httpd start

# start mysql
sudo service mysqld start

# Create DB-Name & User
mysql -u root -e "CREATE DATABASE eccube_vn_hyperion_job DEFAULT CHARACTER SET utf8;"

# Import DB dump
mysql -u root eccube_vn_hyperion_job < /vagrant/startup/vn.hyperion-job.20180618.sql

# date UTC to JST
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
