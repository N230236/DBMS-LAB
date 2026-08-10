USE DBMSLAB;
SELECT * FROM TAXPAYER;
SELECT * FROM INCOME_RECORD;
SELECT * FROM FINANCIAL_YEAR;
SELECT * FROM INCOME_CATEGORY;
/*TASK1*/
SELECT full_name,annual_income FROM TAXPAYER INNER JOIN INCOME_RECORD ON TAXPAYER.taxpayer_id=INCOME_RECORD.taxpayer_id
/*TASK2*/
SELECT t.full_name,ic.category_name FROM TAXPAYER t INNER JOIN INCOME_RECORD ir
ON t.taxpayer_id=ir.taxpayer_id INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=IC.CATEGORY_ID;
/*TASK3*/
SELECT ir.INCOME_ID,ir.INCOME_SOURCE,ir.AMOUNT,fy.YEAR_LABEL FROM INCOME_RECORD ir
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID =fy.YEAR_ID;
/*TASK4*/
SELECT t.full_name,t.annual_income,ir.AMOUNT FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id;
/*TASK5*/
SELECT t.full_name,ir.INCOME_SOURCE,ic.category_name,fy.YEAR_LABEL FROM TAXPAYER t INNER JOIN INCOME_RECORD ir
ON t.taxpayer_id=ir.taxpayer_id INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID =ic.CATEGORY_ID
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID;
/*LEVEL2 TASK1*/
SELECT t.full_name,ic.category_name,ir.INCOME_SOURCE FROM TAXPAYER t INNER JOIN INCOME_RECORD ir
ON t.taxpayer_id =ir.taxpayer_id INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=ic.CATEGORY_ID WHERE ic.category_name='SALARY';
/*TASK2*/
SELECT t.full_name,t.occupation,ir.INCOME_SOURCE,ic.category_name FROM TAXPAYER t INNER JOIN INCOME_RECORD ir
ON t.taxpayer_id=ir.taxpayer_id INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=IC.CATEGORY_ID WHERE ic.category_name='BUISSINESS';
/*TASK3*/
SELECT t.taxpayer_id,t.full_name,t.pan_num,t.occupation,fy.YEAR_LABEL,fy.START_DATE,fy.END_DATE
FROM TAXPAYER t INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id 
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID;
/*TASK4*/
SELECT t.taxpayer_id,t.full_name,t.pan_num,t.occupation,ic.category_name,ic.discription FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN INCOME_CATEGORY ic 
ON ir.CATEGORY_ID =ic.CATEGORY_ID;
/*TASK5*/
SELECT t.full_name,t.pan_num,t.occupation,ir.AMOUNT,ic.category_name,fy.YEAR_LABEL,fy.START_DATE,fy.END_DATE FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id = ir.taxpayer_id INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=ic.CATEGORY_ID
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID;

/*LEVEL3*/
/*TASK1*/
SELECT t.*,i.* FROM TAXPAYER t LEFT JOIN INCOME_RECORD i ON t.taxpayer_id=i.taxpayer_id;
/*TASK2*/
SELECT i.*,c.* FROM INCOME_RECORD i LEFT JOIN INCOME_CATEGORY c ON i.CATEGORY_ID=c.CATEGORY_ID;
/*TASK3*/
SELECT t.*,i.* FROM TAXPAYER t LEFT JOIN INCOME_RECORD i ON t.taxpayer_id=i.taxpayer_id
UNION 
SELECT t.*,i.* FROM TAXPAYER t RIGHT JOIN INCOME_RECORD i ON t.taxpayer_id=i.taxpayer_id;
/*TASK4*/
SELECT t.*,f.* FROM TAXPAYER t CROSS JOIN FINANCIAL_YEAR f;
/*TASK5*/
SELECT t1.taxpayer_id AS ID1,t1.full_name AS name1,t2.taxpayer_id AS ID2,t2.full_name AS name2,t1.occupation
FROM TAXPAYER t1 JOIN TAXPAYER t2 ON t1.occupation=t2.occupation AND t1.taxpayer_id=t2.taxpayer_id;

/*ADDITIONAL PROBLEMS*/
/*TASK6*/
SELECT t.full_name,t.pan_num,ir.INCOME_SOURCE,ic.category_name,fy.YEAR_LABEL FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=ic.CATEGORY_ID
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID;
/*TASK7*/
SELECT t.taxpayer_id,t.full_name,ic.category_name,ic.discription FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=ic.CATEGORY_ID;
/*TASK8*/
SELECT ir.INCOME_SOURCE,fy.YEAR_ID FROM INCOME_RECORD ir
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID; 
/*TASK9*/
SELECT DISTINCT t.taxpayer_id,t.full_name,t.pan_num,ic.category_name,fy.YEAR_LABEL FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=ic.CATEGORY_ID
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID WHERE ic.category_name='SALARY' AND fy.YEAR_LABEL='2025-2026';
/*TASK10*/
SELECT t.taxpayer_id,t.full_name,t.pan_num,t.occupation,ir.INCOME_ID,ir.INCOME_SOURCE,ir.AMOUNT,ic.category_id,
ic.category_name,ic.discription,fy.YEAR_ID,fy.YEAR_LABEL FROM TAXPAYER t
INNER JOIN INCOME_RECORD ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN INCOME_CATEGORY ic ON ir.CATEGORY_ID=ic.CATEGORY_ID
INNER JOIN FINANCIAL_YEAR fy ON ir.YEAR_ID=fy.YEAR_ID;
