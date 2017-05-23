create view BLOOD_WORK_APPOINTMENTS as
select PRACTITIONERS.FIRST_NAME, PRACTITIONERS.LAST_NAME, STAFF_TYPE.STAFF_TYPE,
	count(FIRST_NAME) as APPOINTMENTS from PATIENT_APPOINTMENTS
join PRACTITIONERS on PATIENT_APPOINTMENTS.PRACTITIONER_ID = PRACTITIONERS.ID
join STAFF_TYPE on PRACTITIONERS.STAFF_TYPE = STAFF_TYPE.ID
where BLOOD_WORK = 1
group by PRACTITIONERS.FIRST_NAME, PRACTITIONERS.LAST_NAME, STAFF_TYPE.STAFF_TYPE;