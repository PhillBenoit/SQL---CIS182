SELECT *
FROM PATIENTS AS patient FULL JOIN PATIENT_RECORDS as records
ON patient.ID = records.PATIENT_ID
ORDER BY SUBMISSION_DATE;
/*This is the same as a RIGHT JOIN because all records must match a forign key*/