USE [BookStroreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBook]    Script Date: 12/6/2020 11:31:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteBook]
	@BookId		INT	
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0
	DECLARE @IsDelete	BIT = 1

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@BookId,0) = 0)
		BEGIN
			SET @Message = 'Book Id is required.'
		END
		ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Books WHERE Bookid = @BookId))
				BEGIN
					SET @Message = 'Can not found BookId'	
				END
				ELSE
				IF(EXISTS(SELECT * FROM Books WHERE Bookid = @BookId AND IsDelete = 1))
				BEGIN
					SET @Message = 'Book has been deleted'
				END
				ELSE
				BEGIN
					UPDATE Books
					SET IsDelete = @IsDelete
					WHERE Bookid = @BookId

					SET @Message = 'Book has been delete success'
					SET @Result = 1
				END
		END
		SELECT @Result AS Result, @Message AS [Message] ,@BookId AS BookId  ,@IsDelete AS IsDeleted
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message],@BookId AS BookId ,@IsDelete AS IsDeleted
		ROLLBACK TRAN
	END CATCH
END
