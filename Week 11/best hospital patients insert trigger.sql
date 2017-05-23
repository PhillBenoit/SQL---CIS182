create trigger PATIENTS_INSERT
	on VALIDATED_PATIENTS
	instead of insert
as

declare @first nvarchar(20), @last nvarchar(20), @bday date, @ssn int, @street nvarchar(50),
	@city nvarchar(30), @state char(2), @zip int, @country char(2);

select
	@first = FIRST_NAME,
	@last = LAST_NAME,
	@bday = DATE_OF_BIRTH,
	@ssn = SSN,
	@street = MAIL_STREET,
	@city = MAIL_CITY,
	@state = MAIL_STATE,
	@zip = MAIL_ZIP,
	@country = MAIL_COUNTRY
from inserted;

select @zip =
case
	--all valid US Zip codes start at 10001
	when @zip < 10001 then -1
	--Zip codes with only 5 digits get 4 0s appended
	when @zip < 100000 then @zip * 10000
	--zip codes with 6-8 digits are invalid
	--9 digit zip codes must be at least 10001-0000
	when @zip < 100010000 then -1
	--Zip codes with 9 digits are left alone
	when @zip < 1000000000 then @zip
	--Zip codes longer than 9 digits are invalid
	else -1
end;

if @zip = -1
	throw 55000, 'Invalid Zip Code', 1;
else
	insert PATIENTS values (@first, @last, @bday, @ssn, @street, @city, @state, @zip, @country);