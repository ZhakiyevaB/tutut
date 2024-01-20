/* - Вывести продукты количество которых в продаже меньше 
самого малого среднего количества продуктов в деталях 
заказов (группировка по product_id). Результирующая таблица 
должна иметь колонки product_name и units_in_stock

- Вывести все товары (уникальные названия продуктов), 
которых заказано ровно 10 единиц (конечно же, это можно решить и без подзапроса). */

/* 
SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < ALL (   -- Фильтруем строки, оставляя только те, у которых количество единиц в запасе (units_in_stock) меньше
    SELECT AVG(quantity)
    FROM order_details
    GROUP BY product_id
)
ORDER BY units_in_stock DESC;  --  Сортируем результат в порядке убывания количества единиц в запасе.
*/

/* 
SELECT product_name
FROM products
WHERE product_id = ANY (
	  SELECT product_id FROM order_details WHERE quantity = 10
) 
*/

/* Фильтруем строки, оставляя только те, у 
которых product_id равен хотя бы одному значению, 
которое возвращается подзапросом. Подзапрос выбирает 
product_id из таблицы order_details, где quantity равно 10. */