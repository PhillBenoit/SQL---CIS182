DELETE PATIENTS WHERE PATIENTS.ID NOT IN
(SELECT DISTINCT PATIENT_RECORDS.PATIENT_ID FROM PATIENT_RECORDS);