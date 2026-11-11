# Домашнее задание к занятию "WAF"

### Задание 1
Поставил на Ubuntu сервер Apache  
Машинка с Ubuntu виртуальная, сетевой интерфейс bridge поэтому спокойно подключаемся к ней с хостовой машины по IP  

Проверяем что Apache работает
![waf_1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/waf_1.jpg)  

Пробуем выполнить SQL-инъекцию и видим, что веб-сервер никак не сопротивляется
![waf_3](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/waf_3.jpg)  


После настройки WAF ModeSecurity SQL-инъекция блокируется  
![waf_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/waf_2.jpg) 



