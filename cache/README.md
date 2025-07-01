# Домашнее задание к занятию "Кеширование Redis/memcached" - `Zubkov Danil`

### Задание 1
Приведите примеры проблем, которые может решить кеширование.

### Решение 1
Кеширование повышает производительность ПО, БД, оборудования и т.п.
Реализуется это за счет:
- Увеличения скорости ответа;
- Экономии ресурсов;
- Сглаживания бустов трафика.
---
### Задание 2
Установите и запустите memcached.

### Решение 2

![memcached](https://github.com/DoctorZub/netology_homeworks/blob/main/img/memcached_daemon.png)

---

### Задание 3
Запишите в memcached несколько ключей с любыми именами и значениями, для которых выставлен TTL 5.

### Решение 3

![memcached_keys](https://github.com/DoctorZub/netology_homeworks/blob/main/img/cache_keys.png)

---

### Задание 4
Запишите в Redis несколько ключей с любыми именами и значениями.
Через redis-cli достаньте все записанные ключи и значения из базы, приведите скриншот этой операции.

### Решение 4

![redis_names](https://github.com/DoctorZub/netology_homeworks/blob/main/img/redis_names.png)

---

### Задание 5*
Запишите в Redis ключ key5 со значением типа "int" равным числу 5. Увеличьте его на 5, чтобы в итоге в значении лежало число 10.

Приведите скриншот, где будут проделаны все операции и будет видно, что значение key5 стало равно 10.

### Решение 5

![redis_10](https://github.com/DoctorZub/netology_homeworks/blob/main/img/redis_10.png)
