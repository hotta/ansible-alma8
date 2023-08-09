answer of the Wizard page on [http://rpms.remirepo.net/wizard/](http://rpms.remirepo.net/wizard/)

CentOS 8 provides PHP version 7.4, 8.0 in its official repository

Command to enabled the CRB repository:
    dnf config-manager --set-enabled powertools

Command to install the EPEL repository configuration package:
    dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

Command to install the Remi repository configuration package:
    dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm


You want a single version which means replacing base packages from the distribution

Packages have the same name than the base repository, ie php-*

Some common dependencies are available in remi-safe repository, which is enabled by default

You have to enable the module stream for 8.2:
    dnf module reset php
    dnf module install php:remi-8.2

Command to upgrade (the repository only provides PHP):
    dnf update

Command to install additional packages:
    dnf install php-xxx

Command to install testing packages:
    dnf --enablerepo=remi-modular-test install php-xxx

Command to check the installed version and available extensions:
    php --version
    php --modules
