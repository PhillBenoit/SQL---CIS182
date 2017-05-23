declare Patient_Cursor cursor static
for
	select PATIENTS.FIRST_NAME, PATIENTS.LAST_NAME, PATIENTS.DATE_OF_BIRTH
	from PATIENTS;

declare @first nvarchar(20), @last nvarchar(20), @dob date, @Thirty_Years_Ago date;
set @Thirty_Years_Ago = dateadd(year, -30, getdate());

open Patient_Cursor;
fetch next from Patient_Cursor into @first, @last, @dob;
while @@FETCH_STATUS = 0
	begin
	if @dob < @Thirty_Years_Ago print @first + ' ' + @last + ' ' + convert(varchar,@dob);
	fetch next from Patient_Cursor into @first, @last, @dob;
	end;
close Patient_Cursor;
deallocate Patient_Cursor;