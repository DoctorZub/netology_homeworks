# Домашнее задание к занятию "Что такое DevOps? CI/CD" - `Zubkov Danil`

### Задание 1

Настройки Jenkins Freestyle project для тестирования и сборки в docker image go-кода:

![Jenkins setting](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Jenkins_setting.png)
![Jenkins output](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Output_Jenkins.png) 

Проверяем фактическое создание docker image:
![Go image](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Go_image.png)

---

### Задание 2

Код pipeline'a для тестирования и сборки docker image из go-кода:

```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git branch: 'main', url: 'https://github.com/DoctorZub/for-Jenkins'}
  }
  stage('Test') {
   steps {
    sh '/usr/local/go/bin/go test .'
   }
  }
  stage('Build') {
   steps {
    sh 'docker build . -t go-test-pipe:v$BUILD_NUMBER'
   }
  }
 }
}
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
