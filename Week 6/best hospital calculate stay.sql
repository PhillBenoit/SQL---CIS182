SELECT PATIENTS.FIRST_NAME, PATIENTS.LAST_NAME,
	DATEDIFF(DAY, PATIENT_RECORDS.SUBMISSION_DATE,
	PATIENT_RECORDS.DISCHARGE_DATE) AS Duration
FROM PATIENTS JOIN PATIENT_RECORDS
ON PATIENTS.ID = PATIENT_RECORDS.PATIENT_ID
ORDER BY Duration;