SELECT *
FROM PATIENTS AS patient RIGHT JOIN PATIENT_RECORDS as records
ON patient.ID = records.PATIENT_ID
ORDER BY SUBMISSION_DATE;
/*This is the same as a JOIN because all records must match a forign key*/