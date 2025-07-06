# Домашнее задание к занятию "ELK" - `Zubkov Danil`

### Задание 1
Установите и запустите Elasticsearch, после чего поменяйте параметр cluster_name на случайный.<br>
Приведите скриншот команды 'curl -X GET 'localhost:9200/_cluster/health?pretty', сделанной на сервере с установленным Elasticsearch. Где будет виден нестандартный cluster_name.

### Решение 1

Параметр cluster_name изменил в файле elasticsearch.yml на "Elasticsearch-Zubkov_Danil_Netology_2025"

![Elastic_terminal](https://github.com/DoctorZub/netology_homeworks/blob/main/img/elk_terminal.png)

---

### Задание 2
Установите и запустите Kibana.

Приведите скриншот интерфейса Kibana на странице http://<ip вашего сервера>:5601/app/dev_tools#/console, где будет выполнен запрос GET /_cluster/health?pretty.

### Решение 2

Я разворачивал стек ELK в Docker.<br>
Файл [docker-compose](https://github.com/DoctorZub/netology_homeworks/blob/main/ELK/docker-compose.yml) для данного задания.

![Kibana](https://github.com/DoctorZub/netology_homeworks/blob/main/img/elk_kibana.png)

---

### Задание 3
Установите и запустите Logstash и Nginx. С помощью Logstash отправьте access-лог Nginx в Elasticsearch.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx.

### Решение 3

Для выполнения этого задания настроил конфиг Nginx таким образом, чтобы логи писались в файл access.log в директорию, где лежит [docker-compose](https://github.com/DoctorZub/netology_homeworks/blob/main/ELK/docker-compose-nginx.yml) и [pipeline](https://github.com/DoctorZub/netology_homeworks/blob/main/ELK/configs/logstash/pipelines/logs_nginx.conf) для logstash.

Этот файл с логами прокидывается в контейнер logstash, logstash читает его и пересылает данные в elasticsearch.<br>
Для проверки подключился к серверу Nginx с разных браузеров, результаты обработки логов можно наблюдать в Kibana.

![Nginx_kibana](https://github.com/DoctorZub/netology_homeworks/blob/main/img/elk_ngnix_logs.png)

---

### Задание 4
Установите и запустите Filebeat. Переключите поставку логов Nginx с Logstash на Filebeat.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx, которые были отправлены через Filebeat.

### Решение 4

[Docker-compose](https://github.com/DoctorZub/netology_homeworks/blob/main/ELK/docker-compose_fb.yml)
[Pipeline_for_logstash](https://github.com/DoctorZub/netology_homeworks/blob/main/ELK/configs/logstash/pipelines/beat_nginx.conf)
[filebeat.yml](https://github.com/DoctorZub/netology_homeworks/blob/main/ELK/configs/filebeat/filebeat.yml)

![Nginx_kibana_fb](https://github.com/DoctorZub/netology_homeworks/blob/main/img/elk_ngnix_logs_fb.png)
![Nginx_kibana_fb_close](https://github.com/DoctorZub/netology_homeworks/blob/main/img/elk_ngnix_logs_fb_close.png)
