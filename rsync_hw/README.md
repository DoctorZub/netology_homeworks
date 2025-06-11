# Домашнее задание к занятию "Резервное копирование" - `Zubkov Danil`

### Задание 1

Команда rsync, которая будет создавать зеркальную копию домашней директории пользователя в директорию /tmp/backup, исключающая из синхронизации все директории, начинающиеся с точки, и подсчитывающая хэш-суммы для всех файлов - выглядит следующим образом:

![Rsync_1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/rsync_1.png)
![Rsync_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/rsync_2.png)

Можно проверить работу команды - убедимся, что в домашней директории пользователя имеются скрытые файлы:

![Hidden](https://github.com/DoctorZub/netology_homeworks/blob/main/img/skrit.png)

А в созданной резервной копии такие файлы отсутствуют:

![Not_hidden](https://github.com/DoctorZub/netology_homeworks/blob/main/img/net_skrit.png)

---

### Задание 2

Скрипт, который будет создавать зеркальную резервную копию домашней директории пользователя и писать сообщения в системный лог - [rsync.sh](https://github.com/DoctorZub/netology_homeworks/blob/main/rsync_hw/rsync.sh)

Настройка cron производилась с помощью команды *sudo crontab -e*, чтобы запланированные задачи выполнялись от имени root'a и имелся доступ к системному логу. Файл с задачами cron - [crontab](https://github.com/DoctorZub/netology_homeworks/blob/main/rsync_hw/crontab)
Задача в данном файле запускается каждый день в 19:37 и вызывает скрипт rsync.sh

Демонстрация работы:

Созданная резервная копия по адресу /tmp/backup в 19:37:

![Созданная копия](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cron_script.png)

Сообщение в системном логе:

![Лог](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cron_log.png)

---
