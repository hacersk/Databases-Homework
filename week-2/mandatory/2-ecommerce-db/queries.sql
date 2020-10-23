select name as "Customer Name", address as "Address" 
 from customers
WHERE country='United States';

SELECT * 
 from customers
order by name;

SELECT *
 from products
WHERE unit_price >100;

SELECT *
 from products
WHERE product_name LIKE '%socks%';

select *
 from products
  order by unit_price
DESC LIMIT 5;

SELECT pr.product_name, pr.unit_price,s.supplier_name
 from products as pr
  INNER JOIN suppliers s
   on pr.supplier_id = s.id;

SELECT pr.product_name, pr.unit_price,s.supplier_name
 from products as pr
  INNER JOIN suppliers s
   on pr.supplier_id = s.id
WHERE s.country='United Kingdom';

select *
 from customers
  INNER JOIN orders
   on orders.customer_id=customers.id
where customers.id=1;

select *
 from customers
  INNER JOIN orders
   on orders.customer_id=customers.id
where customers.name='Hope Crosby';

select products.product_name,products.unit_price, order_items.quantity
 from products
    INNER JOIN order_items
     on order_items.product_id= products.id
    INNER JOIN orders
     on orders.id = order_id
WHERE orders.order_reference ='ORD006';

select customers.name,orders.order_reference,order_date,products.product_name,suppliers.supplier_name,order_items.quantity
 from products
    INNER JOIN suppliers
     on suppliers.id = products.supplier_id
    INNER JOIN order_items
     on order_items.product_id= products.id
    INNER JOIN orders
     on orders.id = order_id
    INNER join customers
     on customers.id = orders.customer_id;

select customers.name
 from customers 
    INNER JOIN orders
     on customers.id = orders.customer_id
    INNER JOIN order_items
     on orders.id= order_items.order_id
    INNER JOIN products
     on order_items.product_id = products.id
    INNER join suppliers
     on products.supplier_id = suppliers.id
WHERE suppliers.country ='China'
GROUP by customers.name;