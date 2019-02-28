#!/usr/bin/expect

set timeout -1
spawn /tmp/apiportal_install.sh
expect {
    "Please, be informed that additional dependencies like PHP and APACHE may be installed and you need to have internet access. Confirm? \\\[y/n\\\]?" { send "y\n"; exp_continue; }
    "Use MySQL encryption mode? \\\[y/n\\\]?" { send "n\n"; exp_continue; }
    "Enter MySQL Database name:" { send "portal\n"; exp_continue; }
    "Enter MySQL host:" { send "172.17.0.1\n"; exp_continue; }
    "Enter MySQL port\\\[press ENTER for default\\\]:" { send "3306\n"; exp_continue; }
    "Enter MySQL user name:" { send "root\n"; exp_continue; }
    "Enter MySQL password:" { send "axway\n"; exp_continue; }

}
