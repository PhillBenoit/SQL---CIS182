declare Table_Cursor cursor static
for
	select TABLE_NAME from INFORMATION_SCHEMA.TABLES where
	TABLE_TYPE = 'BASE TABLE' and TABLE_NAME <> 'sysdiagrams';

declare @table_name nvarchar(40);

open Table_Cursor;
fetch next from Table_Cursor into @table_name;
while @@FETCH_STATUS = 0
	begin
	exec('select  * from ' + @table_name + ' for xml path(''' +
		@table_name + '_DBENTRY''), root(''' + @table_name + '_DBRECORDS'')')
	fetch next from Table_Cursor into @table_name;
	end;
close Table_Cursor;
deallocate Table_Cursor;