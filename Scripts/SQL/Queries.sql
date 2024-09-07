/* This query retrieves a list of order IDs where either the gloss_qty or poster_qty exceeds 4000.
-Only the 'id' field is included in the result. */ 

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;








/* This query retrieves a list of orders where the standard_qty is zero
and either the gloss_qty or poster_qty is greater than 1000.  */

SELECT *
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000);







/*This query retrieves company names that start with 'C' or 'W', 
where the primary contact contains 'ana' or 'Ana', but excludes 
those that contain 'eana'. 
NB: ILIKE is used for case-insensitive pattern matching.*/


select * from accounts where (name like 'C%' or name like 'W%') and (primary_poc ilike '%ana%'
and primary_poc not ilike '%eana%')






/*This query retrieves the region, sales rep name, and account name
for each sales rep and their associated accounts. The results are sorted
alphabetically by account name (A-Z). */
 

with summary_table as (
select a.name regio_name, b.name sales_rep_name, c.name account_name from region a, sales_reps b, accounts c 
where a.id = b.region_id
and b.id = c.sales_rep_id
)

select * from summary_table 
order by account_name