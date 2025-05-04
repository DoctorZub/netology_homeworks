# Домашнее задание к занятию "Zabbix_part_2" - `Zubkov Danil`

### Задание 1

Шаблон с названием Zadanie_1:

![Template](https://github.com/DoctorZub/netology_homeworks/blob/main/img/template.png) 
 
---

### Задание 2-3

Прикрепленный шаблон Zadanie_1 к двум хостам(zubkovda-1 и zubkovda-2)
![Hosts with template](https://github.com/DoctorZub/netology_homeworks/blob/main/img/hosts_with_templates.png)

---

### Задание 4

Кастомный дашборд:
![Dashboard](https://github.com/DoctorZub/netology_homeworks/blob/main/img/dashboard.png)

---

### Задание 5

Была создана map со связью между двумя хостами, и настроен триггер на отключение одного хоста, при этом связь меняет цвет на красный:
![Map](https://github.com/DoctorZub/netology_homeworks/blob/main/img/map.png)

---

### Задание 6

На машине, на которой установлен и Zabbix Server и Zabbix Agent, для агента был создан UserParameter, выполняющий bash-скрипт:
```
#!/bin/bash
a=$1
if [[ $a -eq 1 ]]; then
        echo 'Zubkov DA'
elif  [[ $a -eq 2 ]]; then
        echo $(date)
fi
```
Результат обращения к UserParameter'y:
![Bash_script](https://github.com/DoctorZub/netology_homeworks/blob/main/img/bash_script.png)

---


### Задание 7

Был создан еще один UserParameter, выполняющий следующий код на Python:
```python                                                                                   
import sys
import os
import re
from datetime import datetime

if (sys.argv[1] == '-ping'):
        result = os.popen("ping -c 1 " + sys.argv[2]).read()
        result=re.findall(r"time=(.*) ms", result)
        print(result[0])
elif (sys.argv[1] == '-simple_print'):
        print(sys.argv[2])
elif (sys.argv[1] == '1'):
        print("Zubkov DA")
elif (sys.argv[1] == '2'):
        print(datetime.now())
else:
        print(f"unknown input: {sys.argv[1]}")

```
Результат обращения к UserParameter'y:
![Py_script](https://github.com/DoctorZub/netology_homeworks/blob/main/img/py_script.png)

---


### Задание 8

Настройки и результат работы автообнаружения хостов в сети 192.168.0.0/24:
![Discovery action](https://github.com/DoctorZub/netology_homeworks/blob/main/img/dsc_actions.png)
![Discovery](https://github.com/DoctorZub/netology_homeworks/blob/main/img/disc.png)
![Discovety hosts](https://github.com/DoctorZub/netology_homeworks/blob/main/img/disc_hosts.png)
