-- =============================================
-- Department Master Database Setup Script
-- =============================================

-- Create Department Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id('dbo.department') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[department] (
        [recordno] INT PRIMARY KEY IDENTITY(1,1),
        [departmentcode] NVARCHAR(50) NOT NULL UNIQUE,
        [departmentname] NVARCHAR(100) NOT NULL,
        [japanhead] NVARCHAR(1),
        [office] NVARCHAR(1),
        [section] NVARCHAR(1),
        [prefix] NVARCHAR(50),
        [createdby] NVARCHAR(50),
        [createdon] DATETIME,
        [editedby] NVARCHAR(50),
        [editedon] DATETIME,
        [isactive] BIT DEFAULT 1
    )
END
GO

-- Create Stored Procedure for Insert
CREATE OR ALTER PROCEDURE [dbo].[mis_insdepartment_NEW]
    @fcode NVARCHAR(50),
    @fname NVARCHAR(100),
    @fjhead NVARCHAR(1),
    @foffice NVARCHAR(1),
    @fsection NVARCHAR(1),
    @fprefix NVARCHAR(50),
    @fpcode INT,
    @fdid INT,
    @ename NVARCHAR(50),
    @curdttime DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO [dbo].[department] 
    (
        [departmentcode],
        [departmentname],
        [japanhead],
        [office],
        [section],
        [prefix],
        [createdby],
        [createdon],
        [isactive]
    )
    VALUES 
    (
        @fcode,
        @fname,
        @fjhead,
        @foffice,
        @fsection,
        @fprefix,
        @ename,
        @curdttime,
        1
    )
END
GO

-- Create Stored Procedure for Update
CREATE OR ALTER PROCEDURE [dbo].[MIS_UPDdepartment_NEW]
    @departmentcode NVARCHAR(50),
    @departmentname NVARCHAR(100),
    @japanhead NVARCHAR(1),
    @office NVARCHAR(1),
    @section NVARCHAR(1),
    @prefix NVARCHAR(50),
    @cby NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE [dbo].[department]
    SET 
        [departmentname] = @departmentname,
        [japanhead] = @japanhead,
        [office] = @office,
        [section] = @section,
        [prefix] = @prefix,
        [editedby] = @cby,
        [editedon] = GETDATE()
    WHERE 
        [departmentcode] = @departmentcode
END
GO

-- Create Indexes
CREATE NONCLUSTERED INDEX [IX_departmentcode] ON [dbo].[department]([departmentcode])
GO

CREATE NONCLUSTERED INDEX [IX_departmentname] ON [dbo].[department]([departmentname])
GO

CREATE NONCLUSTERED INDEX [IX_isactive] ON [dbo].[department]([isactive])
GO

-- Insert Sample Data
INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('3200', 'CV', 'Y', 'O', 'Y', 'CV', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('7100', 'TPH 1', 'Y', 'P', 'Y', 'TPH 1', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('4400', 'Magnet-Dry', 'Y', 'P', 'Y', 'FM-Dry', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('4200', 'Magnet-Wet', 'Y', 'P', 'Y', 'FM-Wet', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('3100', 'Ceramic Valve (CV)', 'Y', 'P', 'Y', 'CV', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('9000A', 'Corporate Management Group Division', 'N', 'O', 'Y', 'CMG', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('9007', 'Logistic', 'N', 'O', 'Y', 'Logistic', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('9009', 'Human Excellence Initiator Division (HosteL)', 'N', 'O', 'Y', 'Hostel', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('3400', 'Medical Seal', 'Y', 'P', 'Y', 'MS', 'ADMIN', GETDATE(), 1)
GO

INSERT INTO [dbo].[department] ([departmentcode], [departmentname], [japanhead], [office], [section], [prefix], [createdby], [createdon], [isactive])
VALUES ('7700', 'Thin Film Ceramic (TFC)', 'Y', 'P', 'Y', 'TFC (TPH 4', 'ADMIN', GETDATE(), 1)
GO

PRINT 'Database setup completed successfully!'
GO