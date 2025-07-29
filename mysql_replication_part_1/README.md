# Домашнее задание к занятию "Репликация и масштабирование. Часть 1" - `Zubkov Danil`

### Задание 1
На лекции рассматривались режимы репликации master-slave, master-master, опишите их различия.

### Решение 1
**Master-slave:**<br>
При данном типе репликации master-нода выступает "главной" нодой, на которую пользователи могу записывать данные, а также читать данные с нее. На slave-ноде располагается полная копия БД c master-ноды, но при этом со slave-ноды пользователи могут только считывать данные. Записать данные на slave-ноду и синхронизировать их на master-ноде в данном типе репликации не получится.

**Master-master:**<br>
Данный тип репликации отличается от предыдущего тем, что в данном случае обе ноды равноправны. Они обладают одинаковыми возможностями, на них можно писать и считывать с них данные. При этом данные будут копироваться с одной ноды на другую, и будут синхронизироваться полностью идентичные копии БД на каждой ноде.

---

### Задание 2
Выполните конфигурацию master-slave репликации, примером можно пользоваться из лекции.

### Решение 2
Итак буду поднимать и master, и slave ноды в docker-контейнерах с помощью [docker-compose.yml](https://github.com/DoctorZub/netology_homeworks/blob/main/mysql_replication_part_1/docker-compose.yml)<br>
При создании контейнеров в них прокидываются конфиги БД и скрипты, которые будут выполнены сразу после создания.<br>
**Для master:**<br> 
В [master.sql](https://github.com/DoctorZub/netology_homeworks/blob/main/mysql_replication_part_1/master/master.sql) описан SQL скрипт по созданию пользователя, под которым slave-нода будет обращаться к master-ноде.<br>
**Для slave:**<br>
В конфиге [my.cnf](https://github.com/DoctorZub/netology_homeworks/blob/main/mysql_replication_part_1/slave/my.cnf) важным моментом является поле read_only=1 для правильной работы master-slave репликации.<br>
В [slave.sql](https://github.com/DoctorZub/netology_homeworks/blob/main/mysql_replication_part_1/slave/slave.sql) описан SQL скрипт, в котором для slave-ноды указывается master, а также параметры пользователя, под которым slave-нода будет обращаться к master-ноде.<br>
<br>
Запускаем контейнеры:

![Docker_containers](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_docker.png)

Подключаемся к БД с помощью программы DBeaver:

![DBeaver](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_databases.png)

Проверим, что на master-ноде создался пользователь repl_Zubkov:

![User](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_master_users.png)

Проверим состояние slave-ноды с помощью команды SHOW REPLICA SATUS:

![Replica_status](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_replica.png)

С помощью графической оболочки создам на master-ноде БД test. Можно наблюдать, что такая же БД появилась и на slave-ноде:

![Test_db](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_testdb.png)

Созданиим в этой БД на master-ноде таблицу master_test:

![Master_table](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_test_table.png)

Можем наблюдать, что такая же таблица создалась и на slave-ноде:

![Master_table_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_test_table2.png)

Чтобы не проводить наши тесты под root'ом, создадим на slave-ноде пользователя slave_user и выдадим ему правда на SELECT и CREATE. Переподключимся в БД под пользователем slave_user:

![Slave_user](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_newuser.png)

После попытки создать чтонибудь на slave-ноде мы видим ошибку о том, что это невозможно так как наша нода работает в режиме read_only, т.е. так как мы ее и настраивали:

![Read_only](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repl_read_only.png)
