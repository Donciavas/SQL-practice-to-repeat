USE Projektu_valdymas;

--SELECT coulmn, group_function
--FROM table
--[WHERE condition]
--[GROUP BY list_to_group]
--[HAVING group_condition]
--[ORDER BY sorting_condition]

SELECT [ASMENSKODAS]
      ,[VARDAS]
      ,[PAVARDE]
      ,[DIRBANUO]
      ,[GIMIMOMETAI]
      ,[PAREIGOS]
      ,[SKYRIUS_PAVADINIMAS]
      ,[PROJEKTAS_ID]
  FROM [Projektu_valdymas].[dbo].[DARBUOTOJAS];

  SELECT [ASMENSKODAS],[VARDAS],[PAVARDE] FROM [dbo].[DARBUOTOJAS] WHERE [GIMIMOMETAI] = '1988-07-20';

  SELECT [DIRBANUO],[GIMIMOMETAI] FROM [dbo].[DARBUOTOJAS] 
  WHERE [GIMIMOMETAI] <= '1988-07-29';

  SELECT * FROM [dbo].[DARBUOTOJAS] 
  WHERE [DIRBANUO] <= '2012-11-11' AND [DIRBANUO] >= '2009-10-30';

  SELECT [VARDAS],[PROJEKTAS_ID],[ASMENSKODAS] FROM [dbo].[DARBUOTOJAS] 
  WHERE [PROJEKTAS_ID] IN (2, 3);

  SELECT VARDAS, PAVARDE, ASMENSKODAS FROM DARBUOTOJAS WHERE PAVARDE LIKE '%e';

  SELECT * FROM DARBUOTOJAS WHERE GIMIMOMETAI LIKE '%12';

  SELECT PAREIGOS FROM DARBUOTOJAS WHERE PAREIGOS LIKE '____u%';

  SELECT * FROM DARBUOTOJAS WHERE SKYRIUS_PAVADINIMAS is NULL;

  SELECT [DIRBANUO],[GIMIMOMETAI] FROM [DARBUOTOJAS] 
  WHERE [GIMIMOMETAI] != '1988-07-29';

  SELECT [VARDAS] FROM [DARBUOTOJAS] WHERE [VARDAS] NOT LIKE 'S%';

  SELECT [VARDAS],[DIRBANUO],[GIMIMOMETAI] FROM [DARBUOTOJAS] WHERE NOT [DIRBANUO] >= '2009-10-30' AND [DIRBANUO] <= '2012-11-11';
  
  SELECT MAX([PROJEKTAS_ID]), MIN([PROJEKTAS_ID]) FROM [DARBUOTOJAS];

  SELECT [PROJEKTAS_ID], COUNT([PROJEKTAS_ID]) FROM [Projektu_valdymas].[dbo].[DARBUOTOJAS] GROUP BY [PROJEKTAS_ID] HAVING COUNT([PROJEKTAS_ID]) > 1;

SELECT [PROJEKTAS_ID], COUNT([PROJEKTAS_ID])
FROM [Projektu_valdymas].[dbo].[DARBUOTOJAS]
GROUP BY [PROJEKTAS_ID]
HAVING COUNT([PROJEKTAS_ID]) > 1;

SELECT [PAREIGOS],[PROJEKTAS_ID],COUNT([PROJEKTAS_ID])
FROM [Projektu_valdymas].[dbo].[DARBUOTOJAS]
WHERE [PAREIGOS] LIKE 'Program%'
GROUP BY [PROJEKTAS_ID],[PAREIGOS]
HAVING COUNT([PROJEKTAS_ID]) >= 1;

SELECT [VARDAS],[PAVARDE],[PROJEKTAS_ID],COUNT([PROJEKTAS_ID])
FROM [Projektu_valdymas].[dbo].[DARBUOTOJAS]
GROUP BY [PROJEKTAS_ID],[VARDAS],[PAVARDE];

SELECT "Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai", [Projektu_valdymas].[dbo]."Vykdymas" WHERE "Vykdytojas" = "Nr" AND "Projektas" = 1;

SELECT [Pavardė], [Pavadinimas], [Valandos]
FROM [Projektu_valdymas].[dbo].[Vykdytojai], [Projektu_valdymas].[dbo].[Projektai], [Projektu_valdymas].[dbo].[Vykdymas]
WHERE [Projektas] = [Projektai].[Nr] AND [Vykdytojas] = [Vykdytojai].[Nr];

SELECT "A"."Pavardė", "B"."Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai" "A", [Projektu_valdymas].[dbo]."Vykdytojai" "B" WHERE "A"."Kvalifikacija" = "B"."Kvalifikacija" AND "A"."Nr" < "B"."Nr";

SELECT DISTINCT "A"."Pavardė", "B"."Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai" "A", [Projektu_valdymas].[dbo]."Vykdytojai" "B" WHERE "A"."Kvalifikacija" = "B"."Kvalifikacija";

SELECT "A"."Pavardė", "B"."Pavardė"
FROM [Projektu_valdymas].[dbo]."Vykdytojai" "A", [Projektu_valdymas].[dbo]."Vykdytojai" "B"
WHERE "A"."Kvalifikacija" = "B"."Kvalifikacija"
AND "A"."Nr" <> "B"."Nr";

SELECT "Pavardė", "Pavadinimas", "Valandos" 
FROM [Projektu_valdymas].[dbo]."Vykdytojai", [Projektu_valdymas].[dbo]."Projektai", [Projektu_valdymas].[dbo]."Vykdymas" 
WHERE "Projektas" = "Projektai"."Nr" 
AND "Vykdytojas" = "Vykdytojai"."Nr" 
AND "Svarba" = 'Ypatinga';

--Projekto Nr. 1 vykdytojų pavardės:
SELECT "Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Nr" WHERE "Projektas" = 1;

--Užklausa be JOIN:
SELECT "Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai", [Projektu_valdymas].[dbo]."Vykdymas" WHERE "Vykdytojas" = "Nr" AND "Projektas" = 1;

--Galima jungti ir daugiau lentelių, pavyzdžiui:

SELECT "Pavardė", "Pavadinimas", "Valandos" FROM([Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Vykdytojai"."Nr")JOIN [Projektu_valdymas].[dbo]."Projektai" ON "Projektas" = "Projektai"."Nr";

--Užklausa be JOIN:
SELECT "Pavardė", "Pavadinimas", "Valandos" FROM [Projektu_valdymas].[dbo]."Vykdytojai", [Projektu_valdymas].[dbo]."Projektai", [Projektu_valdymas].[dbo]."Vykdymas" WHERE "Projektas" = "Projektai"."Nr" AND "Vykdytojas" = "Vykdytojai"."Nr";

--Visų projekto Nr. 1 vykdytojų pavardės, statusai ir valandos:

SELECT "Pavardė", "Statusas", "Valandos"FROM [Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Nr" WHERE "Projektas" = 1;

--Darbuotojai ir jų dalyvavimas projekte Nr. 1:
SELECT "Pavardė", "Statusas", "Valandos"FROM [Projektu_valdymas].[dbo]."Vykdytojai" LEFT OUTER JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Nr" = "Vykdytojas" WHERE "Projektas" = 1;

--Pavardės vykdytojų, dalyvaujančių projekte Nr. 1:

SELECT "Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai" WHERE "Nr" IN(SELECT "Vykdytojas" FROM [Projektu_valdymas].[dbo]."Vykdymas" WHERE "Projektas" = 1);

--Vykdytojai, dalyvaujantys bent viename ypatingos svarbos projekte:

SELECT "Pavardė" FROM [Projektu_valdymas].[dbo]."Vykdytojai" WHERE "Nr" IN
(SELECT "Vykdytojas" FROM [Projektu_valdymas].[dbo]."Vykdymas" WHERE "Projektas" IN
(SELECT "Nr" FROM [Projektu_valdymas].[dbo]."Projektai" WHERE "Svarba" = 'Ypatinga'));

SELECT "Vykdytojas","Pavardė", "Pavadinimas" FROM([Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Vykdytojai"."Nr")JOIN [Projektu_valdymas].[dbo]."Projektai" ON "Projektas" = "Projektai"."Nr";

SELECT "Vykdytojas","Pavardė", "Pavadinimas" FROM([Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Vykdytojai"."Nr")JOIN [Projektu_valdymas].[dbo]."Projektai" ON "Projektas" = "Projektai"."Nr" WHERE "Svarba" = 'Ypatinga';

SELECT "Vykdytojas","Pavardė","Statusas" FROM([Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Vykdytojai"."Nr") WHERE "Statusas" = 'Testuotojas';

--Išrinkite visas moteris dirbančias projekte Izola ir išveskite į ekraną jų vardus, pavardes ir projekto pavadinimą.
SELECT DISTINCT "Vykdytojas","Pavardė", "Pavadinimas" FROM([Projektu_valdymas].[dbo]."Vykdytojai" JOIN [Projektu_valdymas].[dbo]."Vykdymas" ON "Vykdytojas" = "Vykdytojai"."Nr")JOIN [Projektu_valdymas].[dbo]."Projektai" ON "Projektas" = "Projektai"."Nr" WHERE "Pavardė" LIKE '%e';

--Išrinkite skyrių pavadinimus su juose dirbančių darbuotojų skaičiumi.

--Select Top N per Category
--Task: Extract the names and classes for the top 2 test scores for each class in the school, ordered by class and then by score. If there are any tie breakers, use the lower student_id to break the tie.

--WITH class_ranking AS (
--SELECT
--    c.class, n.name, s.score,
--    ROW_NUMBER() OVER (PARTITION BY c.class ORDER BY s.score DESC, s.student_id) AS rank
--FROM scores s
--JOIN classes c ON s.student_id = c.student_id
--JOIN names n ON s.student_id = c.student_id 
--)
--SELECT class, name, score
--FROM class_ranking
--WHERE rank <= 2
--ORDER BY class ASC, score DESC;

--Conditional Consecutive Select:
--Task:Display the rows which contain 3 or more consecutive days of more than 100 cases in those days.

--WITH cases_over_hundred AS (
--  SELECT * FROM cases WHERE new > 100
--)
--SELECT DISTINCT c1.* 
--FROM cases_over_hundred as c1,
--FROM cases_over_hundred as c3,
--FROM cases_over_hundred as c2,
--WHERE (c1.id = c2.id - 1 AND c1.id = c3.id - 2) 
--  OR (c1.id = c2.id + 1 AND c1.id = c3.id - 1) 
--  OR (c1.id = c2.id + 2 AND c1.id = c3.id + 1)
--ORDER BY c1.id;

--SELECT Job, Sum(Sal) TotalSum FROM EMP 
--WHERE Job NOT LIKE ‘SALES%’
--GROUP BY Job 
--HAVING Sum(Sal) > 300 
--ORDER BY Sum(Sal)

--SELECT coulmn, group_function
--FROM table
--[WHERE condition]
--[GROUP BY list_to_group]
--[HAVING group_condition]
--[ORDER BY sorting_condition]
