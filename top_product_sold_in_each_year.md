### 🔹 Product Table
SELECT * FROM product;

| product_id | product_name |
|------------|--------------|
| 100        | Nokia        |
| 200        | Iphone       |
| 300        | Samsung      |



### 🔹 Sales Table
select * from sales;

| sale_id | product_id | year | quantity | price |
|---------|------------|------|----------|-------|
| 1       | 100        | 2010 | 25       | 5000  |
| 2       | 100        | 2011 | 16       | 5000  |
| 3       | 100        | 2012 | 8        | 5000  |
| 4       | 200        | 2010 | 10       | 9000  |
| 5       | 200        | 2011 | 15       | 9000  |
| 6       | 200        | 2012 | 20       | 9000  |
| 7       | 300        | 2010 | 20       | 7000  |
| 8       | 300        | 2011 | 18       | 7000  |
| 9       | 300        | 2012 | 20       | 7000  |


### Write a query to select the top product sold in each year?

```sql
WITH ranked_sales AS (   SELECT     s.year,     s.product_id,     p.product_name,     s.quantity,     ROW_NUMBER() OVER (PARTITION BY s.year ORDER BY s.quantity DESC) AS rn   FROM sales s   JOIN products p ON s.product_id = p.product_id ) SELECT year, product_name, quantity FROM ranked_sales WHERE rn = 1;
```

```sql
WITH ranked_sales AS (
    SELECT
        s.year,
        s.product_id,
        p.product_name,
        s.quantity,
        ROW_NUMBER() OVER (PARTITION BY s.year ORDER BY s.quantity DESC) AS rn
    FROM sales s
    JOIN products p
        ON s.product_id = p.product_id
)
SELECT
    year,
    product_name,
    quantity
FROM ranked_sales
WHERE rn = 1;
```
### 🔹 Yearly Product Quantity

| year | product_name | quantity |
|------|--------------|----------|
| 2010 | Nokia        | 25       |
| 2011 | Samsung      | 18       |
| 2012 | Iphone       | 20       |

```sql
WITH ranked_sales AS (
    SELECT
        s.year,
        s.product_id,
        p.product_name,
        s.quantity,
        ROW_NUMBER() OVER (PARTITION BY s.year ORDER BY s.quantity DESC) AS rn
    FROM sales s
    JOIN products p
        ON s.product_id = p.product_id
)
SELECT
    year,
    product_name,
    quantity
FROM ranked_sales
WHERE rn = 2;


———————————————————

## More will be added........,,

## Modified fine

# new aaamamama