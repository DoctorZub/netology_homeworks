# Домашнее задание к занятию "Disaster recovey and Keepalive" - `Zubkov Danil`

### Задание 1

[Ссылка на pkt-файл]()

Настройка Router1 и Router2 (в своих CLI они называются Router0 и Router1 соответственно):
![R0](https://github.com/DoctorZub/netology_homeworks/blob/main/img/conf_Router0.png)
![R1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/conf_Router1.png) 

Также на Router1 был изменен приоритет и добавлен preempt:
![R0_priority](https://github.com/DoctorZub/netology_homeworks/blob/main/img/conf_priority_router0.png)

После выполнения всех настроек данная схема работает таким образом, что все пакеты от клиента к веб-серверу и обратно проходят через Router1. 
Но если оборвать одну из линий связи Router1, то схема отрабатывает (перестраивается) и все пакеты начинают проходить через Router2.
![R0_priority](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cisco_final_scheme.png)

---

### Задание 2

Код bash-скрипта для проверки доступности 80 порта на localhost и существования index.html для nginx сервера:

```
#!/bin/bash
FILENAME=/var/www/nginx/index.html
NC=$( nc -zv 127.0.0.1 80 2>&1 )

check() {
if [[ $NC == *succee* && -f $FILENAME ]]; then
        return 0
else
        return 55
fi
}

check

```

Pipeline успешно отработал, проверяем создание docker image:

![Pipeline output](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Pipeline_output.png)
![Image from pipeline](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Pipe_Go_image.png)


---

### Задание 3

На второй машине с IP 192.168.0.192 на порту 8081 развернул Nexus, создал raw-hosted репозиторий.
Код pipeline'a Jenkins для сбоки бинарного файла go-кода и загрузки данного файла в репозиторий Nexus:

```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git branch: 'main', url: 'https://github.com/DoctorZub/for-Jenkins'}
  }
  stage('Build') {
   steps {
    sh 'CGO_ENABLED=0 GOOS=linux /usr/local/go/bin/go build -a -installsuffix nocgo -o app .'
   }
  }
  stage('Upload') {
   steps {
       sh 'curl -u admin:admin http://192.168.0.192:8081/repository/first_raw_repo/ --upload-file app -v'
   }
  }
 }
}
```
![Pipeline output](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Out_my_pipe2.png)
![Image from pipeline](https://github.com/DoctorZub/netology_homeworks/blob/main/img/repo.png)
