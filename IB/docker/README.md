# Домашнее задание к занятию «Контейнеризация (Docker)»

### Задание 1
В качестве результата работы вам необходимо предоставить отчёт, включающий следующие скриншоты с вашими текстовыми комментариями:

- скриншот вывода результатов команды ifconfig (на Kali Linux) или ip a (на Ubuntu);
- скриншот вывода результатов команды sudo docker pull bash;
- скриншот вывода результатов команды sudo docker run -it bash;
- скриншот вывода результатов команды sudo docker stop names;
- скриншот вывода результатов команды sudo docker rm names;
- скриншот вывода результатов команды sudo docker rmi repository;
- скриншот вывода результатов команды sudo docker ps -a;
- скриншот вывода результатов команды sudo docker image ls.

### Решение 1

У меня виртуалка на Ubuntu, используется:  
- один bridge интерфейс в LAN с хостовой машиной
- интерфейс для LAN между виртуальными машинами
- виртуальные интерфейсы, созданные Docker
![ipa](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d_ipa.jpg)


Успешно скачал image bash
![pullbash](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d_pullbash.jpg)   


Успешно запустился контейнер на основе image bash в интерактивном режиме, т.е. мы сразу попал внутрь контейнера
![runbash](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d_runbash.jpg)  


В другом окне терминала проверил какие контейнеры у меня есть в системе, оказалось 2 штуки - только запущенный bash и остановленный контейнер zaproxy  
После остановки и удаления контейнера bash по имени контейнера, видно что остался только zaproxy
![stoprm](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d_stoprm.jpg)  


После удаления образа bash, в системе не осталось ни образа ни контейнера
![rmi](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d_deleteimage.jpg)  
  



### Задание 2  

После исправления кода ошибка с переполнением ушла, т.к. была использована функция fgets(), которая обрезает вводимую пользователем информацию до нужного размера.  

![c_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/c_2.jpg)  

Но использование в коде функции system() куда в явном виде передается вводимая пользователем информация, отрывает возможности для использования уязвимости Code Injection.  
Если мы в переменную хост передадим любую команду через знак ";", то наша программа ее выполнит. Таким образом злоумышленник может получить доступ к файлам и даже к терминалу хоста, где запущен код.



