# Домашнее задание к занятию "SQL. Часть 2" - `Zubkov Danil`

### Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:<br>
- фамилия и имя сотрудника из этого магазина:
```
SELECT s.last_name, s.first_name
FROM staff s
JOIN store st ON st.manager_staff_id = s.staff_id
JOIN customer c ON c.store_id = st.store_id
GROUP BY st.store_id, s.last_name, s.first_name
HAVING COUNT(c.customer_id) > 300;
```
![SQL1-1](https://github.com/DoctorZub/netology_homeworks/blob/main/img/SQL-1-1.png)

- город нахождения магазина:
```
SELECT ct.city
FROM address ad
JOIN city ct ON ad.city_id = ct.city_id
JOIN store st ON st.address_id = ad.address_id
JOIN customer c ON c.store_id = st.store_id
GROUP BY st.store_id, ct.city
HAVING COUNT(c.customer_id) > 300;
```
![SQL1-2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/SQL-1-2.png)

- количество пользователей, закреплённых в этом магазине:
```
SELECT store_id, COUNT(store_id)
FROM customer
GROUP BY store_id
HAVING COUNT(store_id) > 300;
```
![SQL1-3](https://github.com/DoctorZub/netology_homeworks/blob/main/img/SQL-1-3.png)

---

### Задание 2
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.
```
SELECT COUNT(film_id) AS film_count
FROM film
WHERE length > (SELECT AVG(length) FROM film);
```
![SQL2](https://github.com/DoctorZub/netology_homeworks/blob/main/img/SQL-2.png)

---

### Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.
```
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS total_payments,
    COUNT(rental_id) AS rental_count
FROM (
    SELECT 
        p.payment_date,
        p.amount,
        r.rental_id
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
) AS sub
GROUP BY month
ORDER BY total_payments DESC
LIMIT 1;
```
![SQL3](https://github.com/DoctorZub/netology_homeworks/blob/main/img/SQL-3.png)
