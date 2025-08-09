# Домашнее задание к занятию "Защита хоста" - `Zubkov Danil`

### Задание 1

1. Установите eCryptfs.
2. Добавьте пользователя cryptouser.
3. Зашифруйте домашний каталог пользователя с помощью eCryptfs.

В качестве ответа пришлите снимки экрана домашнего каталога пользователя с исходными и зашифрованными данными.

### Решение 1
С помощью команды
```
sudo adduser --encrypt-home cryptouser
```
был создан новый пользователь с зашифрованным домашним каталогом.<br>
Проверка шифрования:
![eCrypt](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cryptouser.png)

---

### Задание 2

1. Установите поддержку LUKS.
2. Создайте небольшой раздел, например, 100 Мб.
3. Зашифруйте созданный раздел с помощью LUKS.
В качестве ответа пришлите снимки экрана с поэтапным выполнением задания.

### Решение 2
<ins>Скриншоты установленного LUKS и раздела 100Мб, который будет шифроваться.</ins>

![Luks_1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cryptsetup.png)
![Luks_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/crypt_disk.png)

<ins>Скриншоты процесса шифрования раздела:</ins>

![Luks_1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/LUKS_1.png)
![Luks_2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/LUKS_2.png)
