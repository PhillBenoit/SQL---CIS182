declare @first nvarchar(20), @last nvarchar(20), @id int,
	@proc_name nvarchar(40), @pid int, @counter int;

declare Patient_Cursor cursor static
for
	select PATIENTS.FIRST_NAME, PATIENTS.LAST_NAME, PATIENTS.ID
	from PATIENTS;

declare Proc_Cursor cursor static
for
	select PATIENT_PROCEDURES.NAME, PATIENT_PROCEDURES.PATIENT_ID
	from PATIENT_PROCEDURES;

open Patient_Cursor;
fetch next from Patient_Cursor into @first, @last, @id;
while @@FETCH_STATUS = 0
	begin
	print @first + ' ' + @last;

	set @counter = 0;
	open Proc_Cursor;
	fetch next from Proc_Cursor into @proc_name, @pid;
	while @@FETCH_STATUS = 0
		begin
		if @id = @pid
			begin
			print '-- ' + @proc_name;
			set @counter = @counter + 1;
			end;
		fetch next from Proc_Cursor into @proc_name, @pid;
		end;
	close Proc_Cursor;
	if @counter = 0 print '<no procedures recorded>';

	fetch next from Patient_Cursor into @first, @last, @id;
	print char(13) + char(10);
	end;
close Patient_Cursor;
deallocate Patient_Cursor;
deallocate Proc_Cursor;