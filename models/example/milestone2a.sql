Select
nav_date, code, nav,
first_value(nav) over(partition by year(nav_date), code order by nav_date) as YearBeginning,
first_value(nav) over(partition by month(nav_date), code order by nav_date) as MonthBeginning
from "FINALASSIGNMENTELT"."MUTUALFUNDS"."NAVHISTORY"
order by nav_date asc

