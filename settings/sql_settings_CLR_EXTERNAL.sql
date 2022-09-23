alter database DatabaseTestDB set trustworthy on
go

-- net. 4.7.2 для ms sql 2022 - если добавлять внешнюю CLR через SSMS
/*CREATE ASSEMBLY CLRTextConvertEXT
    FROM 'C:\CLR\CLRTextConvertEXT.dll'
    WITH PERMISSION_SET = UNSAFE*/

ALTER ASSEMBLY CLRTextConvertEXT
    FROM 'C:\CLR\CLRTextConvertEXT.dll'
    WITH PERMISSION_SET = UNSAFE

go