select code, nav_date as LatestDate, o.id as cat_id, o.category from "FINALASSIGNMENTELT"."MUTUALFUNDS"."NAVHISTORY" p join
(select m.code as mcode, m.category_id as id , n.category from "FINALASSIGNMENTELT"."MUTUALFUNDS"."MUTUALFUNDS" m
join "FINALASSIGNMENTELT"."MUTUALFUNDS"."FUNDCATEGORY" n on m.category_id=n.id group by mcode, m.category_id, n.category) o
where o.mcode=p.code group by p.code, nav_date, cat_id , o.category order by nav_date DESC