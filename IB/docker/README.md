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
В качестве результата работы вам необходимо предоставить отчёт, включающий следующие скриншоты с вашими текстовыми комментариями:

- скриншот вывода результатов команды sudo docker run –rm -it bash;
- скриншот вывода результатов команды whoami и cat /etc/*release* (в контейнере);
- скриншот вывода результатов команды ls -la / (в контейнере);
- скриншот вывода результатов команды whoami и cat /etc/*release* (в основной системе);
- скриншот вывода результатов команды ls -la / (в основной системе). 


### Решение 2

После запуска контейнера bash в интерактивном режиме и выполнении команд whoami и cat /etc/os-release видно, что  
внутрь контейнера мы вошли под пользователем **root**, а также контейнер собран на ОС **Alpine Linux**
![cont](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d2_runcont.jpg)  


Выполнив внутри контейнера команду ls -la увидим файловую структуру внутри контейнера
![lscont](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d2_lscont.jpg)


Если выйти из контейнера и выполнить те же команды, можно увидеть что вывод будет отличаться. Данные команды теперь показывают всю информацию о нашей хостовой машине, т.к. мы не находимся ни в одном контейнере. Также разный вывод команд доказывает, что контейнер является изолированной средой, "никак не связанной" с хостовой системой.
![system](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d2_system.jpg)  


### Задание 3

