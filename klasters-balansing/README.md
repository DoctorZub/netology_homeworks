# Домашнее задание к занятию "Кластеризация и балансировка нагрузки" - `Zubkov Danil`

### Задание 1

На локальной машине были запущены 2 простых Python сервера:
Server 1 - localhost:1234
Server 2 - localhost:9876

Config HAProxy для балансировки нагрузки между этими 2-мя серверами на 4 уровне выглядит следующим образом:
[haproxy.conf](https://github.com/DoctorZub/netology_homeworks/blob/main/klasters-balansing/haproxy_configs/haproxy_1.conf)

Демонстрация работы:

![Демонстрация работы HAProxy](https://github.com/DoctorZub/netology_homeworks/blob/main/img/haproxy_working.png)

![HAProxy stats](https://github.com/DoctorZub/netology_homeworks/blob/main/img/haproxy_stats.png)

---

### Задание 2

На локальной машине были запущены 3 простых Python сервера:
Server 1 - localhost:1234
Server 2 - localhost:9876
Server 3 - localhost:3333


Config HAProxy для балансировки нагрузки между этими 3-мя серверами на 7 уровне по алгоритму Weighted Round Robin (где перый сервер имеет вес - 2, второй - 3, третий - 4)
выглядит следующим образом:
[haproxy.conf](https://github.com/DoctorZub/netology_homeworks/blob/main/klasters-balansing/haproxy_configs/haproxy_2.conf)

HAproxy настроен так, что он балансирует только тот http-трафик, который адресован домену example.local
Демонстрация работы:

![Демонстрация работы HAProxy](https://github.com/DoctorZub/netology_homeworks/blob/main/img/haproxy_local.png)

![Без указания домена](https://github.com/DoctorZub/netology_homeworks/blob/main/img/haproxy_without.png)

![Stats](https://github.com/DoctorZub/netology_homeworks/blob/main/img/haproxy_stats2.png)

---
