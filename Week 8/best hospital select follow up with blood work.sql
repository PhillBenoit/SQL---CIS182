select FIRST_NAME, LAST_NAME from
PATIENT_APPOINTMENTS join PATIENTS on PATIENT_ID = ID
where PATIENT_ID not in
(select PATIENT_ID from PATIENT_RECORDS where IS_DISCHARGED = 0)
and BLOOD_WORK = 1;