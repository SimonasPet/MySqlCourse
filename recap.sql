/*

Foundation Recap Exercise
 
Use the table PatientStay.  

This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024

*/
 
SELECT

	*

FROM

	PatientStay ps ;
 
/*

1. List the patients -

a) in the Oxleas or PRUH hospitals and

b) admitted in February 2024

c) only the Surgery wards
 
2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.

3. Order results by AdmittedDate (latest first) then PatientID column (high to low)

4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.

*/
 
-- Write the SQL statement here
-- A)
SELECT
*
FROM PatientStay ps
WHERE ps.Hospital IN ('Oxleas', 'PRUH') 


-- Write the SQL statement here
-- B)

SELECT
*
FROM PatientStay ps
WHERE ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'

-- Write the SQL statement here
-- c)

SELECT
 *
FROM PatientStay ps
WHERE ps.Hospital IN ('Oxleas', 'PRUH') 
AND ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
AND ps.Ward like '%surgery'

-- Write the SQL statement here
-- 2)

SELECT
  ps.PatientId
  , ps.AdmittedDate
  , ps.DischargeDate
  , ps.Hospital
  , ps.Ward
FROM PatientStay ps
WHERE ps.Hospital IN ('Oxleas', 'PRUH') 
AND ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
AND ps.Ward like '%surgery'

-- Write the SQL statement here
-- 3&4)

SELECT
  ps.PatientId
  , ps.AdmittedDate
  , ps.DischargeDate
  , ps.Hospital
  , ps.Ward
  , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate)+1 AS LOS
FROM PatientStay ps
WHERE ps.Hospital IN ('Oxleas', 'PRUH') 
AND ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
AND ps.Ward like '%surgery'
Order BY ps.AdmittedDate DESC, ps.PatientId DESC


/*

5. How many patients has each hospital admitted? 

6. How much is the total tarriff for each hospital?

7. List only those hospitals that have admitted over 10 patients

8. Order by the hospital with most admissions first

*/
 
-- Write the SQL statement here

SELECT
ps.hospital
,count(ps.PatientID)AS 'Admissions'
FROM PatientStay ps
GROUP BY ps.Hospital

-- Write the SQL statement here
-- 5
SELECT
ps.hospital
,count(ps.PatientID) AS 'Admissions'
,count(ps.Ethnicity) AS 'Admissions 2'
FROM PatientStay ps
GROUP BY ps.Hospital


select
    ps.Hospital,  
    COUNT(*) AS NumberOfPatients
from PatientStay ps
GROUP BY ps.Hospital
--6
select
    ps.Hospital,  
    COUNT(*) AS NumberOfPatients
    , SUM(ps.Tariff) AS TotalTariff
from PatientStay ps
GROUP BY ps.Hospital

--7

select
    ps.Hospital,  
    COUNT(*) AS NumberOfPatients
    , SUM(ps.Tariff) AS TotalTariff
from PatientStay ps
GROUP BY ps.Hospital
HAVING 
Count(ps.PatientId) > 10

--8

select
    ps.Hospital,  
    COUNT(*) AS NumberOfPatients
    , SUM(ps.Tariff) AS TotalTariff
from PatientStay ps
GROUP BY ps.Hospital
HAVING 
Count(ps.PatientId) > 10
Order BY (ps.Hospital) DESC


