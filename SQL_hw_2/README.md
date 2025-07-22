# Домашнее задание к занятию "Работа с данными (DDL/DML)" - `Zubkov Danil`

### Задание 1
```
SELECT s.last_name, s.first_name
FROM staff s
JOIN store st ON st.manager_staff_id = s.staff_id
JOIN customer c ON c.store_id = st.store_id
GROUP BY st.store_id, s.last_name, s.first_name
HAVING COUNT(c.customer_id) > 300;
```
```
SELECT ct.city
FROM address ad
JOIN city ct ON ad.city_id = ct.city_id
JOIN store st ON st.address_id = ad.address_id
JOIN customer c ON c.store_id = st.store_id
GROUP BY st.store_id, ct.city
HAVING COUNT(c.customer_id) > 300;
```

```
SELECT store_id, COUNT(store_id)
FROM customer
GROUP BY store_id
HAVING COUNT(store_id) > 300;
```
---

### Задание 2
```
SELECT COUNT(film_id) AS film_count
FROM film
WHERE length > (SELECT AVG(length) FROM film);
```
---

### Задание 3
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
