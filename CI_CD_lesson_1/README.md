# Домашнее задание к занятию "Git" - `Zubkov Danil`

### Задание 1

Настройки Jenkins Freestyle project для тестирования и сборки в docker image go-кода:

![Jenkins setting](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Jenkins_setting.png)

---

### Задание 2

Ссылка на коммит с .gitignore:

https://github.com/DoctorZub/hw_test/commit/cd9757ea5a58da9f8e50334e6d5df043674f79e3

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

---

### Задание 3

Ссылка на граф коммитов, где показан merge ветки dev в ветку main:

https://github.com/DoctorZub/hw_test/network
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
