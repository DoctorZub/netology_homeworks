# Домашнее задание к занятию "Отказоустойчивость в облаке" - `Zubkov Danil`

### Задание 1
[Ссылка на конфигурацию Terraform](https://github.com/DoctorZub/netology_homeworks/tree/main/Otkaz_v_oblake/cloud)

Статус балансировщика и целевой группы:

![Балансировщик и группа](https://github.com/DoctorZub/netology_homeworks/blob/main/img/Balancer.png)

На обе виртуальные машины был установлен сервер Nginx и настроена страница index.html, чтобы машины можно было отличать между собой.
**Подлючимся на публичный адрес балансировщика через браузер:**

![Балансировщик через браузер](https://github.com/DoctorZub/netology_homeworks/blob/main/img/balancer_nginx_1.png)

При первом подлючении балансировщик направил наш трафик на vm1. При обновлении страницы нас не перебрасывает на vm0, видимо это изза уже установленной сессии с vm1.


**Подлючимся к балансировщику через curl:**

![Балансировщик через curl](https://github.com/DoctorZub/netology_homeworks/blob/main/img/balancer_nginx.png)

Можем наблюдать что балансировщик работает и при каждом забросе наш трафик перенаправляется на разные vm.

---


