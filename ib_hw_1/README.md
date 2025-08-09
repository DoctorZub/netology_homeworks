# Домашнее задание к занятию "Уязвимости и атаки на информационные системы" - `Zubkov Danil`

### Задание 1

Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя nmap.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

Ответьте на следующие вопросы:

- Какие сетевые службы в ней разрешены?
- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)

### Решение 1
Были скачаны и установлены 2 виртуальные машины - Kali Linux и Metasploitable 2.<br>
Машины подключены к одной локальной сети 10.0.0.0/8.<br>
IP Kali Linux - 10.0.0.10<br>
IP Metasploitable - 10.0.0.30<br>
![Kali](https://github.com/DoctorZub/netology_homeworks/blob/main/img/kali_ip.png)
![Meta](https://github.com/DoctorZub/netology_homeworks/blob/main/img/meta_ip.png)

С помощью команды nmap было проведено сканирование портов и сетевых служб на Metasploitable.

![Kali_nmap](https://github.com/DoctorZub/netology_homeworks/blob/main/img/kali_nmap.png)

На ресурсе https://www.exploit-db.com/ были найдены следующие уязвимости для отсканированных сетевых служб:
- Для Open SSH - https://www.exploit-db.com/exploits/45233, https://www.exploit-db.com/exploits/40963
- Для ProFTPD https://www.exploit-db.com/exploits/15449
- Для PostgreSQL https://www.exploit-db.com/exploits/32849

---

### Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

Ответьте на следующие вопросы:

- Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
- Как отвечает сервер?

### Решение 2

#### **Сканирование в режиме SYN**

![Kali_syn](https://github.com/DoctorZub/netology_homeworks/blob/main/img/kali_syn.png)

Рассмотрим в Wireshark отправлененые и полученные пакеты для открытого и закрытого портов.<br>
Для открытого порта 22:

![Syn-22](https://github.com/DoctorZub/netology_homeworks/blob/main/img/syn_22.png)

Для закрытого порта 19:

![Syn-19](https://github.com/DoctorZub/netology_homeworks/blob/main/img/syn_19.png)

<ins>В режиме SYN nmap оправляет на порты сканируемого хоста TCP запросы с флагом SYN. Если в ответ nmap получает TCP ответ с флагами SYN, ACK, то делается вывод о том что порт открыт и отправляется TCP пакет с флагом RST для закрытия соединения. Если же ответом приходит TCP пакет с флагом RST, то nmap делает вывод о том, что данный порт закрыт.</ins>

---

#### **Сканирование в режиме FIN**

![Kali_fin](https://github.com/DoctorZub/netology_homeworks/blob/main/img/kali_fin.png)

Рассмотрим в Wireshark отправлененые и полученные пакеты для открытого и закрытого портов.<br>
Для открытого порта 22:

![FIN-22](https://github.com/DoctorZub/netology_homeworks/blob/main/img/fin_22.png)

Для закрытого порта 19:

![FIN-19](https://github.com/DoctorZub/netology_homeworks/blob/main/img/fin_19.png)

<ins>В режиме FIN nmap оправляет на порты сканируемого хоста TCP запросы с флагом FIN. Если в ответ nmap не получает TCP-пакеты, то делается вывод о том что порт открыт. Если же ответом приходит TCP пакет с флагами RST, ACK то nmap делает вывод о том, что данный порт закрыт.</ins>

---

#### **Сканирование в режиме Xmas**

![Kali_Xmas](https://github.com/DoctorZub/netology_homeworks/blob/main/img/kali_X.png)

Рассмотрим в Wireshark отправлененые и полученные пакеты для открытого и закрытого портов.<br>
Для открытого порта 22:

![X-22](https://github.com/DoctorZub/netology_homeworks/blob/main/img/X_22.png)

Для закрытого порта 19:

![X-19](https://github.com/DoctorZub/netology_homeworks/blob/main/img/X_19.png)

<ins> Логика работы nmap в данном режиме сканирования похожа на режим сканирования FIN - nmap оправляет на порты сканируемого хоста TCP запросы с флагами FIN, PSH, URG. Если в ответ nmap не получает TCP-пакеты, то делается вывод о том что порт открыт. Если же ответом приходит TCP пакет с флагами RST, ACK то nmap делает вывод о том, что данный порт закрыт.</ins>

---

#### **Сканирование в режиме UDP**

![Kali_UDP](https://github.com/DoctorZub/netology_homeworks/blob/main/img/kali_UDP.png)

Рассмотрим в Wireshark отправлененые и полученные пакеты для открытого и закрытого портов.<br>
Для открытого порта 53 (DNS):

![UDP-53](https://github.com/DoctorZub/netology_homeworks/blob/main/img/udp_53.png)

Для открытого порта 111 (TFTP):

![UDP-111](https://github.com/DoctorZub/netology_homeworks/blob/main/img/udp_111.png)

Для закрытого порта 22:

![UDP-22](https://github.com/DoctorZub/netology_homeworks/blob/main/img/udp_22.png)

<ins> Отметим, что данный режим сканирования является очень медленным, потому что nmap отправляет на порты сканируемого хоста множество UDP запросов популярных прикладных протоколов работающих на UDP. Если в ответ на какой нибудь из UDP запросов приходит ответ, то делается вывод об открытости порта. В противном случае - о том, что порт закрыт.</ins>

