USE [BookStroreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_ShowBooks]    Script Date: 12/6/2020 11:34:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_ShowBooks] 
	@BookId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	BEGIN
		IF(ISNULL(@BookId,0) = 0)
			BEGIN
				SET @Message = 'Book ID is required.'
			END
		ELSE
		IF (NOT EXISTS (SELECT * FROM Books WHERE BookId = @BookId))
		BEGIN
			SET @Message = 'Book is not exists.'
		END
		ELSE
			SELECT * FROM Books WHERE BookId = @BookId
		END
		SELECT @BookId AS BookId, @Message AS [Message]
END
