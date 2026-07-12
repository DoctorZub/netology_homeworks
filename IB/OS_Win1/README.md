# Домашнее задание к занятию "Работа в сети интернет: BGP, DNS`

### Задание 1
В этом задании вам предстоит поработать с сетевыми протоколами BGP и DNS в программе Cisco Packet Tracer. Вам нужно будет создать заданную сетевую топологию и настроить оборудование. На маршрутизаторах требуется настроить протокол BGP для обмена маршрутами, обеспечить связность между сервером и клиентским компьютером. На сервере предстоит включить и настроить DNS-сервис и HTTP-сервис. Затем нужно проверить работу DNS, обратившись к серверу по имени с клиентского компьютера. Результатом выполнения станет файл топологии и скриншот, подтверждающий работу BGP.

### Решение 1

Файл pkt - [bgp.pkt](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/bgp.pkt)  

Обмен по протоколу BGP между маршрутизаторами  
![bgp](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/bgp.png)  

На сервере настроил HTTP сервис и DNS сервис. В DNS добавил A-запись с именем zubkov, IP самого DNS сервера 192.168.0.1  

![dns_a](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/bgp_dns_a.png)  


Проверка с ПК:  
1. Пинг до сервера 192.168.0.1 проходит
2. Обращение по доменному имени zubkov без проблем резолвится в IP 192.168.0.1
3. Есть возможность подключиться к серверу через браузер, что говорит о том, что HTTP сервис работает
 
![ping](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/bgp_dns_from_pc.png)  
![web](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/bgp_http.png)  




