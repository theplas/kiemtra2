USE [BookStroreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBook]    Script Date: 12/6/2020 11:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_CreateBook]
	@BookName NVARCHAR(255),
	@Author NVARCHAR(255),
	@BookRow NVARCHAR(255)

AS
BEGIN
	DECLARE @BookId	INT = 0,
	@IsDelete BIT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@BookName IS NULL OR @BookName = '')
		BEGIN
			SET @Message = 'Book name is required.'
		END
		ELSE
		IF(@Author IS NULL OR @Author = '')
		BEGIN
			SET @Message = 'Author is required.'
		END
		ELSE
		IF(@BookRow IS NULL OR @BookRow = '')
		BEGIN
			SET @Message = 'BookRow is required.'
		END
		
		ELSE
			BEGIN
				INSERT INTO [dbo].[Books]
						   ([BookName]
						   ,[Author]
						   ,[BookRow]
						   ,[IsDelete])
					 VALUES
						   (@BookName
						   ,@Author 
						   ,@BookRow
						   ,@IsDelete)


				SET @BookId = SCOPE_IDENTITY()
				SET @Message = 'Book has been created success.'
			END
		SELECT @BookId AS BookId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @BookId AS BookId, @Message AS [Message]
	END CATCH
END
