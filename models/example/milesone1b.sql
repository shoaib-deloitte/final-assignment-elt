WITH Categories AS
(
SELECT nav_date,c.category as category,nav,
	  ROW_NUMBER() OVER(partition by c.category ORDER BY nav ASC) RN1,
	  ROW_NUMBER() OVER(partition by c.category ORDER BY nav DESC) RN2
	  FROM 
  "FINALASSIGNMENTELT"."MUTUALFUNDS"."NAVHISTORY" b join "FINALASSIGNMENTELT"."MUTUALFUNDS"."MUTUALFUNDS" a
on b.code=a.code join "FINALASSIGNMENTELT"."MUTUALFUNDS"."FUNDCATEGORY" c
on a.category_id=c.id
)
SELECT category,
	   MAX(CASE WHEN RN2=1 THEN nav END) maxnav,
	   MAX(CASE WHEN RN2=1 THEN nav_date END) maxnavdate,
	   MAX(CASE WHEN RN1=1 THEN nav END) minnav,
	   MAX(CASE WHEN RN1=1 THEN nav_date END) minnavdate
 FROM Categories WHERE RN1=1 OR RN2=1
GROUP BY category
