USE [master]
GO

/****** Object:  StoredProcedure [dbo].[ProcessDynamicData]    Script Date: 04-02-2024 20:51:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProcessDynamicData]
    @sourceTable NVARCHAR(128),
    @destinationTable NVARCHAR(128)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    DECLARE @updateColumns NVARCHAR(MAX);
    DECLARE @insertColumns NVARCHAR(MAX);

    SELECT @updateColumns = COALESCE(@updateColumns + ', ', '') + 
                            'Target.' + QUOTENAME(COLUMN_NAME) + ' = Source.' + QUOTENAME(COLUMN_NAME)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @destinationTable;

    SELECT @insertColumns = COALESCE(@insertColumns + ', ', '') + QUOTENAME(COLUMN_NAME)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @destinationTable;

    --SET @sql = N'
    --    TRUNCATE TABLE ' + QUOTENAME(@destinationTable) + ';
    --    INSERT INTO ' + QUOTENAME(@destinationTable) + ' SELECT * FROM ' + QUOTENAME(@sourceTable) + ';
    --';

    --EXEC sp_executesql @sql;

    SET @sql = N'
        MERGE INTO ' + QUOTENAME(@destinationTable) + ' AS Target
        USING ' + QUOTENAME(@sourceTable) + ' AS Source
        ON Target.ID = Source.ID
        WHEN MATCHED THEN
            UPDATE SET ' + @updateColumns + '
        WHEN NOT MATCHED BY TARGET THEN
            INSERT (' + @insertColumns + ')
            VALUES (' + @insertColumns + ');
    ';

    EXEC sp_executesql @sql;
END;
GO


