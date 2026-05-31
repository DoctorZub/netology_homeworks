# Домашнее задание к занятию "Протоколы транспортного уровня: TCP, UDP" - `Zubkov Danil`

### Задание 1
В этом задании вам необходимо:

Развернуть две виртуальные машины (Ubuntu и Kali) и настроить между ними сеть.
Установить и настроить на Ubuntu веб-сервер (nginx), SSH-сервер и FTP-сервер.
С помощью Wireshark перехватить и проанализировать TCP/UDP сессии.
Настроить межсетевой экран, разрешив доступ только к портам 80 и 22.
Продемонстрировать работу экрана, предоставив:
Вывод команды sudo ufw status verbose
Скриншоты перехваченных сетевых сессий
Скриншоты блокировки трафика
Результаты оформите в виде отчёта со скриншотами и пришлите ссылку на облачное хранилище.

### Решение 1

Использовал свои 2 старые виртуальные машины, на которых сеть 192.168.0.0/24 была уже занята, поэтому подключил дополнительные сетевые адаптеры и назначил IP-адреса:<br>
*Ubuntu - 192.168.2.1*  
*Kali - 192.168.2.52*  

![ip_ubuntu](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_ubuntu.jpg)

![ip_kali](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_kali.jpg)  

На машине с Ubuntu изначально выключен Firewall  
![ufw_deact](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_ufw_inact.jpg)  


Проверка работы сервисов и отрытости портов на Ubuntu с Kali:
![services](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_services.jpg)
![curl](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_curl.jpg)  

Видно, что сервисы на портах 80 и 22 работают.  
Почему то просто команда *curl* на 69 порт не срабатывала. Поэтому доступность tftp сервера проверял либо командой *tftp*, либо запросами к серверу через тот же *curl*  

С помощью Wireshark удалось отследить пакеты транспортного уровня, которые отправляются при данных соединениях.  
Для tcp-порта 80:  
![80](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_80.jpg)  
Можно увидеть первые 3 пакета с флагами SYN, SYN ACK, ACK - это как раз установка tcp соединения - 3-х стороннее рукопожатие.  
Ниже можно увидеть пакеты с флагом FIN, что говорит нам о том, что это пакеты, закрывающие TCP соединение. 

Для tcp-порта 22:
![22](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_22.jpg)
Можно также увидеть пакеты с 3-х стороннего tcp рукопожатия, после которого уже отправляется пакет с прикладным протоколом SSH.

Для udp-порта 69:
![69](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_69.jpg)
Wireshark отловил пакеты прикладного протокола TFTP, если посмотреть внутрь пакета на его структуру, то можно увидеть, что в качестве транспортного протокола для данного пакета выступает протокол UDP.  


После этого на машине Ubuntu с сервисами был включен протокол и повторно проверена доступность портов из вне.  
![after_ufw](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/tcp_after_ufw.jpg)

Из анализа Wireshark видно, что ни одна TCP/UDP сессия не может установиться после включения Firewall.
