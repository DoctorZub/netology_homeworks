# Домашнее задание к занятию "Zabbix_part_1" - `Zubkov Danil`

### Задание 1

Веб интерфейс Zabbix сервера на Apache2:

![Zabbix_web](https://github.com/DoctorZub/netology_homeworks/blob/main/img/zabbix_web_gui.png) 

Набор команд для загрузки Zabbix сервера на хост с OS Ubuntu, PostgreSQL, Apache2:
*(все команды выполняются под sudo)*

```
apt install postgresql

wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_6.0+ubuntu24.04_all.deb
dpkg -i zabbix-release_latest_6.0+ubuntu24.04_all.deb
apt update

apt install zabbix-server-pgsql zabbix-frontend-php php8.3-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent

sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix

zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix 

Вписываем в файл /etc/zabbix/zabbix_server.conf пароль от базы данных
DBPassword=password  

systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2
 
```

### Задание 2
Подключено 2 агента, один на Zabbix сервере, второй на другой машине с ОС Debian
![Hosts](https://github.com/DoctorZub/netology_homeworks/blob/main/img/zabbix_hosts.png)

Log file agent on Zabbix server
![server_log](https://github.com/DoctorZub/netology_homeworks/blob/main/img/log_agent_server.png)

Log file agent on Debian VM
![server_log](https://github.com/DoctorZub/netology_homeworks/blob/main/img/log_agent_debian.png)

Раздел Monitoring -> Latest Data, видно что данные поступают от обоих агентов
![Latest_data](https://github.com/DoctorZub/netology_homeworks/blob/main/img/monitoring_data.png)

---
