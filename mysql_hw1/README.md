# Домашнее задание к занятию "Работа с данными (DDL/DML)" - `Zubkov Danil`

### Задание 1

Установил и запустил у себя в системе docker-контейнер с сервером MySQL. Произвел подключение к созданной БД через ПО DBeaver.
Создал учетную запись sys_temp:

![Sys_temp_1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/mysql_users.png)

Затем выдал пользователю sys_temp все права:

![Sys_temp_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/mysql_grants.png)

Подлючился к БД под новой созданной учетной записью sys_temp:

![Sys_temp_3](https://github.com/DoctorZub/netology_homeworks/blob/main/img/mysql_sys_temp.png)

После этого успешно загрузил dump БД sakila в свой сервер MySQL: 

![Sakila](https://github.com/DoctorZub/netology_homeworks/blob/main/img/mysql_sakila.png)

---

### Задание 2
Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц.

[Файл Excel](https://github.com/DoctorZub/netology_homeworks/blob/main/mysql_hw1/sakila.xlsx)

Скриншот:

![Sakila_table](https://github.com/DoctorZub/netology_homeworks/blob/main/img/mysql_sakila.png)
