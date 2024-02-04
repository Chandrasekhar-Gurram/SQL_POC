USE [master]
GO

/****** Object:  Trigger [dbo].[AfterInsertOrUpdateTrigger]    Script Date: 04-02-2024 20:49:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[AfterInsertOrUpdateTrigger]
ON [dbo].[booksCopy]
AFTER INSERT, UPDATE
AS
BEGIN
    IF UPDATE(title)
    BEGIN
        UPDATE bookscopy
        SET title = [dbo].[TrimSpecialChars](i.title)
        FROM INSERTED i
        WHERE bookscopy.id = i.id;
    END
END;

GO

ALTER TABLE [dbo].[booksCopy] ENABLE TRIGGER [AfterInsertOrUpdateTrigger]
GO


