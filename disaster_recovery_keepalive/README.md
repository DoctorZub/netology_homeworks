# Домашнее задание к занятию "Disaster recovey and Keepalive" - `Zubkov Danil`

### Задание 1

[Ссылка на pkt-файл](https://github.com/DoctorZub/netology_homeworks/blob/main/hsrp_advanced_zubkov.pkt)

Настройка Router1 и Router2 (в своих CLI они называются Router0 и Router1 соответственно):

![R0](https://github.com/DoctorZub/netology_homeworks/blob/main/img/conf_Router0.png)
![R1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/conf_Router1.png) 

Также на Router1 был изменен приоритет и добавлен preempt:

![R0_priority](https://github.com/DoctorZub/netology_homeworks/blob/main/img/conf_priority_router0.png)

После выполнения всех настроек данная схема работает таким образом, что все пакеты от клиента к веб-серверу и обратно проходят через Router1. 
Но если оборвать одну из линий связи Router1, то схема отрабатывает (перестраивается) и все пакеты начинают проходить через Router2.
![R0_priority](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cisco_final_scheme.png)

---

### Задание 2

Код bash-скрипта для проверки доступности 80 порта на localhost и существования index.html для nginx сервера:

```
#!/bin/bash
FILENAME=/var/www/nginx/index.html
NC=$( nc -zv 127.0.0.1 80 2>&1 )

check() {
if [[ $NC == *succee* && -f $FILENAME ]]; then
        return 0
else
        return 55
fi
}

check

```

Конфигурационные файлы keepalived для двух VM's:

Для VM1

```
vrrp_script check_web {
  script       "/etc/nginx/bash_keep.sh"
  interval 3
}

vrrp_instance VI_1 {
        state MASTER
        interface enp0s3
        virtual_router_id 111
        priority 255
        advert_int 1

        virtual_ipaddress {
              192.168.0.111/24
        }

        track_script {
                check_web
        }

}
```

Для VM2

```
vrrp_script check_web {
  script       "/etc/nginx/bash_keep.sh"
  interval 3
}

vrrp_instance VI_1 {
        state BACKUP
        interface enp0s3
        virtual_router_id 111
        priority 255
        advert_int 1

        virtual_ipaddress {
              192.168.0.111/24
        }

        track_script {
                check_web
        }

}

```

Далее на скриншотах представлены приветственные страницы сервера Nginx для VM1 IP 192.168.0.108(MASTER) и VM2 IP 192.168.0.192(BACKUP). 
А также результат обращения к адресу 192.168.0.111 - мы увидим страницу с VM1, т.к. всё в работе и плавающий адрес будет присвоен MASTER VM.

![VM1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/VM1.png)
![VM2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/VM2.png)
![111](https://github.com/DoctorZub/netology_homeworks/blob/main/img/111.png)

Далее удалим файл index.html для сервера Nginx VM1 и сможем увидить как адрес 192.168.0.111 присвоится VM2

![VM1_without_index](https://github.com/DoctorZub/netology_homeworks/blob/main/img/VM1_without_index.png)
![111](https://github.com/DoctorZub/netology_homeworks/blob/main/img/111_VM2.png)

---
