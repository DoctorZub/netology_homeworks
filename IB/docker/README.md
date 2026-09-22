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


Успешно запустился контейнер на основе image bash в интерактивном режиме, т.е. мы сразу попали внутрь контейнера
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
В качестве результата работы вам необходимо предоставить отчёт, включающий следующие скриншоты с вашими текстовыми комментариями:

- скриншот вывода содержимого файла скрипта cat my_bash_1.sh (необходимо указывать назначенное вами имя скрипта);
- скриншот вывода содержимого файла Dockerfile cat Dockerfile;
- скриншот результатов сборки образа sudo docker build -t image_bash_1 . (необходимо указывать назначенное вами имя образа);
- скриншот результатов запуска контейнера sudo docker run –rm image_bash_1 (необходимо указывать назначенное вами имя образа);
- скриншот результатов запуска скрипта в основной системе ./my_bash_1.sh (необходимо указывать назначенное вами имя скрипта).


### Решение 3

Скрипт zubkov.sh и Dockerfile  
![Dock_sh](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d3_shDock.jpg)  


Собираем образ (zub_bash) с помощью Dockerfile и запускаем контейнер на основе нашего собранного образа. Перед сборкой немного изменил Dockerfile указав явные пути до скрипта внутри контейнера. Видим, что образ успешно собрался и контейнер запущенный на основе этого образа обработал наш скрипт и вывел его результат в консоль. Можем понять что это результат работы скрипта из контейнера, т.к. ОС указана Alpine Linux именно та, которая используется в контейнере bash.
![biuld_run](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d3_build_run.jpg)  


Выполнив данный скрипт в системе, увидим что он выдаст информацию о хостовой машине. У нас это Ubuntu.
![system](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d3_sh_system.jpg)  


### Задание 4
В качестве результата работы вам необходимо предоставить отчёт, включающий следующие скриншоты с вашими текстовыми комментариями:

- скриншот вывода содержимого подготовленного вами файла index.html, содержащий ваше Ф.И.О.;
- скриншот вывода содержимого подготовленного вами файла docker-compose.yml;
- скриншот результатов запуска подготовленной вами связки контейнеров;
- скриншот первоначальной титульной страницы Nginx при подключении браузером к контейнеру;
- скриншот запуска связки контейнеров после замены файла index.html в контейнере, содержащий ваше Ф.И.О.;
- скриншот вашего варианта титульной страницы Nginx при подключении браузером к контейнеру, содержащий ваше Ф.И.О.;
- скриншот вывода результатов команды остановки связки контейнеров.

### Решение 4

Файл index.html с моей фамилией  
![index](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_index.jpg)  


Содержимое файла docker-compose.yml. В curl подставлен один из адресов моей хостовой машины  
![compose](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_compose.jpg)  


Запускаем compose, видим что контейнеры успешно создаются, curl проходит и отображает стартовую страницу nginx.  
![run1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_run.jpg)  


Проброс портов работает, на порту 8899 хостовой машины можно увидеть стартовую страницу nginx в браузере.  
![web](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_web.jpg)  


Останавливаем контейнеры и копируем наш файл index.html вовнутрь контейнера nginx.  
![copy](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_copy.jpg)


Заново запускаем compose, видим что контейнеры запускаются и curl успешно "достукивается" до nginx и отображает нашу скопированную страницу index.html.  
![after](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_aftercopy.jpg)  


Также наблюдаем ее в браузере.  
![web2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_web2.jpg)  


Выполняем docker compose down и убеждаемся, что контейнера автоматически удалились.
![down](https://github.com/DoctorZub/netology_homeworks/blob/main/img/IB/d4_down.jpg)  





