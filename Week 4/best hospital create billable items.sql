CREATE TABLE PATIENTS_BILLABLE_ITEMS
(ID								INT				NOT NULL  IDENTITY(1,1)  PRIMARY KEY,
 PATIENT_RECORDS_ID				INT				NOT NULL  REFERENCES PATIENT_RECORDS(RECORDS_ID),
 ITEM_DESCRIPTION				NVARCHAR(40)	NOT NULL,
 PRICE							SMALLMONEY		NOT NULL,
 QUANTITY						SMALLINT		NOT NULL,
 NEEDS_PRESCRIPTION				BIT				NOT NULL,
 ASSIGNED_BY_PRACTITIONER_ID	SMALLINT		NOT NULL  REFERENCES PRACTITIONERS(ID));