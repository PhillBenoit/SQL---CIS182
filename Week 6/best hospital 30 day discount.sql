UPDATE PATIENTS_BILLABLE_ITEMS
SET PRICE = PRICE * .5
FROM
	(
	SELECT PATIENTS_BILLABLE_ITEMS.ID as ID,
		DATEDIFF(DAY, PATIENT_RECORDS.SUBMISSION_DATE,
		PATIENT_RECORDS.DISCHARGE_DATE) AS Duration
	FROM PATIENTS_BILLABLE_ITEMS JOIN PATIENT_RECORDS
	ON PATIENTS_BILLABLE_ITEMS.PATIENT_RECORDS_ID = PATIENT_RECORDS.RECORDS_ID
	WHERE DATEDIFF(DAY, PATIENT_RECORDS.SUBMISSION_DATE,
		PATIENT_RECORDS.DISCHARGE_DATE) > 30
	) AS DISCOUNTS
WHERE DISCOUNTS.ID = PATIENTS_BILLABLE_ITEMS.ID;