SELECT *
FROM PATIENTS AS patient JOIN PATIENT_RECORDS as records
ON patient.ID = records.PATIENT_ID
ORDER BY SUBMISSION_DATE;