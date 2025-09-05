# Zabbix 7.4

```
$ ansible-playbook jobs/zabbix.yml
```

- Visit http://IP-Address/zabbix/
- Change default language if you need. > Next step
- Make the pre-requisites are all ok. > Next step
- Password: zabbix (group_vars/all:ZABBIX_DB_PASS) > Next step
- Zabbix server name: Zabbix server for example 
- Change Default the time zone if needed > Next step
- Pre-installation summary > Next step
- Install > Finish
- Login to ZABBIX: Admin / zabbix
