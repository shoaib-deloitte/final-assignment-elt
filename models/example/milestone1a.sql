Select c.category,month(nav_date) as NavMonth,avg(nav) as AverageNavValue,avg(repurchase_price) as AverageRepurchasePrice,avg(sale_price) as AverageSalePrice
FROM 
  "FINALASSIGNMENTELT"."MUTUALFUNDS"."NAVHISTORY" b join "FINALASSIGNMENTELT"."MUTUALFUNDS"."MUTUALFUNDS" a
on b.code=a.code join "FINALASSIGNMENTELT"."MUTUALFUNDS"."FUNDCATEGORY" c
on a.category_id=c.id group by c.category,NavMonth order by c.category,NavMonth