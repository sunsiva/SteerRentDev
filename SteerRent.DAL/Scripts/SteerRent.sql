USE [master]
GO
/****** Object:  Database [SteerRent]    Script Date: 02/05/2016 09:15:40 ******/
CREATE DATABASE [SteerRent] ON  PRIMARY 
( NAME = N'SteerRent', FILENAME = N'D:\source\apps\steerrent\SQL\DB\SteerRent.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SteerRent_log', FILENAME = N'D:\source\apps\steerrent\SQL\DB\SteerRent_log.ldf' , SIZE = 13632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SteerRent] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SteerRent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SteerRent] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SteerRent] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SteerRent] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SteerRent] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SteerRent] SET ARITHABORT OFF
GO
ALTER DATABASE [SteerRent] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SteerRent] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SteerRent] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SteerRent] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SteerRent] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SteerRent] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SteerRent] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SteerRent] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SteerRent] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SteerRent] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SteerRent] SET  DISABLE_BROKER
GO
ALTER DATABASE [SteerRent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SteerRent] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SteerRent] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SteerRent] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SteerRent] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SteerRent] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SteerRent] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SteerRent] SET  READ_WRITE
GO
ALTER DATABASE [SteerRent] SET RECOVERY FULL
GO
ALTER DATABASE [SteerRent] SET  MULTI_USER
GO
ALTER DATABASE [SteerRent] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SteerRent] SET DB_CHAINING OFF
GO
USE [SteerRent]
GO
/****** Object:  User [sr]    Script Date: 02/05/2016 09:15:40 ******/
CREATE USER [sr] FOR LOGIN [sr] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialNumberSetUp]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SerialNumberSetUp](
	[BuID] [numeric](18, 0) NOT NULL,
	[Entity] [varchar](50) NOT NULL,
	[StartSerialNo] [numeric](18, 0) NOT NULL,
	[CurrentSerialNo] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_SerialNumberSetUp] PRIMARY KEY CLUSTERED 
(
	[BuID] ASC,
	[Entity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleXPage]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleXPage](
	[PageId] [numeric](18, 0) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[RoleXPage] ([PageId], [RoleId]) VALUES (CAST(10 AS Numeric(18, 0)), N'48af9845-2794-404e-9742-9fd4ca546951')
INSERT [dbo].[RoleXPage] ([PageId], [RoleId]) VALUES (CAST(10 AS Numeric(18, 0)), N'aea71fee-0630-4c94-b04d-5682f0ebd530')
INSERT [dbo].[RoleXPage] ([PageId], [RoleId]) VALUES (CAST(10 AS Numeric(18, 0)), N'49b859aa-f831-475b-bbf9-2fc359503b7e')
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleService]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleService](
	[ServiceID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[VehicleID] [numeric](18, 0) NOT NULL,
	[WarrantlyKM] [numeric](18, 0) NOT NULL,
	[WarrantyUpto] [date] NOT NULL,
	[ServiceWithin] [smallint] NOT NULL,
	[ServiceContract] [bit] NOT NULL,
	[AgencyID] [varchar](100) NULL,
	[LastServiceDate] [date] NULL,
	[NextServiceDate] [date] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_VehicleService] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleRegistration]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleRegistration](
	[RegId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[VehicleID] [numeric](18, 0) NOT NULL,
	[RegNo] [smallint] NOT NULL,
	[RegCountryID] [numeric](18, 0) NULL,
	[RegStateID] [numeric](18, 0) NULL,
	[RegDate] [date] NULL,
	[RegExpiry] [date] NULL,
	[RegCost] [numeric](18, 0) NULL,
	[RegPlateCodeID] [numeric](18, 0) NULL,
	[RegPlateColorID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_VehicleRegistration] PRIMARY KEY CLUSTERED 
(
	[RegId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehiclePurchase]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehiclePurchase](
	[PurchaseID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[VehicleID] [numeric](18, 0) NOT NULL,
	[PurchaseDate] [date] NULL,
	[DeliveryDate] [date] NULL,
	[SupplierID] [numeric](18, 0) NOT NULL,
	[PONumber] [varchar](50) NULL,
	[POValue] [numeric](18, 0) NULL,
	[TradeLicenseID] [numeric](18, 0) NOT NULL,
	[BuyBack] [bigint] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_VehiclePurchase] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleMaster]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleMaster](
	[VehicleID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[VehicleCode] [numeric](18, 0) NOT NULL,
	[BuId] [numeric](18, 0) NOT NULL,
	[UsageType] [numeric](18, 0) NOT NULL,
	[InductingLocationID] [numeric](18, 0) NOT NULL,
	[CurrentLocationID] [numeric](18, 0) NULL,
	[StatusID] [numeric](18, 0) NOT NULL,
	[GroupID] [numeric](18, 0) NULL,
	[SubGroupID] [numeric](18, 0) NULL,
	[MakeID] [numeric](18, 0) NULL,
	[BrandID] [numeric](18, 0) NULL,
	[YearModel] [numeric](18, 0) NULL,
	[VehicleTypeID] [numeric](18, 0) NULL,
	[VehicleSubTypeID] [numeric](18, 0) NULL,
	[TransmissionTypeID] [numeric](18, 0) NULL,
	[AC] [bit] NULL,
	[EngineCapacityID] [numeric](18, 0) NULL,
	[VehicleClass] [nchar](10) NULL,
	[SeatingCapacity] [smallint] NULL,
	[ColorID] [numeric](18, 0) NULL,
	[SubColorID] [numeric](18, 0) NULL,
	[FuelTypeID] [numeric](18, 0) NULL,
	[FuelTankSize] [numeric](18, 0) NULL,
	[FlaggedForSale] [bit] NULL,
	[MarkedForSale] [bit] NULL,
	[IsAvailableForRenting] [bit] NULL,
	[NoOfKeys] [tinyint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_VehicleMaster] PRIMARY KEY CLUSTERED 
(
	[VehicleCode] ASC,
	[BuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GENERATED BY THE SYSTEM. FROM SERIAL NUMBER SETUP ADD 1 TO THE CURRENT SERIALNO AND UPDATE SERIAL NUMBER SETTING FOR THE ENTITY VEHICLE CODE ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VehicleMaster', @level2type=N'COLUMN',@level2name=N'VehicleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VEHICLE IS USED FOR (E.G. LEASING, RENTING OR LIMO ETC) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VehicleMaster', @level2type=N'COLUMN',@level2name=N'UsageType'
GO
/****** Object:  Table [dbo].[VehicleInsurance]    Script Date: 02/05/2016 09:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleInsurance](
	[InsID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[VehicleID] [numeric](18, 0) NOT NULL,
	[InsTypeID] [numeric](18, 0) NOT NULL,
	[InsCompanyID] [nchar](10) NOT NULL,
	[InsPolicyNo] [varchar](50) NOT NULL,
	[InsCost] [numeric](18, 0) NOT NULL,
	[InsStart] [date] NOT NULL,
	[InsExpiry] [date] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_VehicleInsurance] PRIMARY KEY CLUSTERED 
(
	[InsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[Applications]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](235) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Applications] ([ApplicationId], [ApplicationName], [Description]) VALUES (N'ee2864ab-4a4a-42dd-959c-07dc5d5a42a2', N'http://192.168.2.6/', NULL)
INSERT [dbo].[Applications] ([ApplicationId], [ApplicationName], [Description]) VALUES (N'00c90617-dec1-4203-bac2-f3411106b0b4', N'/SteerRent', NULL)
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/SteerRent', N'/steerrent', N'6159d74d-59df-424b-ba05-acf86980189c', NULL)
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'SteerRent', N'SteerRent', N'0ab2d553-062b-4196-91b4-1d243a536da6', N'SteerRent')
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[EmployeeId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[EmployeeCode] [nvarchar](50) NOT NULL,
	[Gender] [smallint] NOT NULL,
	[DOB] [datetime] NOT NULL,
	[DesignationId] [numeric](18, 0) NOT NULL,
	[BUId] [numeric](18, 0) NOT NULL,
	[LocationId] [numeric](18, 0) NOT NULL,
	[DOJ] [datetime] NOT NULL,
	[LeavingDate] [datetime] NULL,
	[Address1] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NOT NULL,
	[Address3] [nvarchar](50) NULL,
	[City] [nchar](10) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[CountryId] [numeric](18, 0) NOT NULL,
	[Zip] [nvarchar](50) NULL,
	[EmergencyContactName] [nvarchar](50) NOT NULL,
	[EmergencyContactPhone] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nchar](10) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nchar](10) NULL,
	[UpdatedOn] [datetime] NULL,
	[FlextField1] [nvarchar](50) NULL,
	[FlexField2] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Male;0:Female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeMaster', @level2type=N'COLUMN',@level2name=N'Gender'
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] ON
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [UserId], [FirstName], [LastName], [MiddleName], [EmployeeCode], [Gender], [DOB], [DesignationId], [BUId], [LocationId], [DOJ], [LeavingDate], [Address1], [Address2], [Address3], [City], [State], [CountryId], [Zip], [EmergencyContactName], [EmergencyContactPhone], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlextField1], [FlexField2]) VALUES (CAST(16 AS Numeric(18, 0)), N'7efade21-d1f0-444c-90c2-ebc4795f4e30', N'siva', N'siva', N'siva', N'siva', 1, CAST(0x0000A30F00000000 AS DateTime), CAST(115 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000A30F00000000 AS DateTime), NULL, N'siva', N'siva', NULL, N'siva      ', N'73', CAST(113 AS Numeric(18, 0)), N'2kjkjkllkl234', N'siva', N'234234', 1, N'1         ', CAST(0x0000A31000CBF7CC AS DateTime), N'1         ', CAST(0x0000A31001884B51 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [UserId], [FirstName], [LastName], [MiddleName], [EmployeeCode], [Gender], [DOB], [DesignationId], [BUId], [LocationId], [DOJ], [LeavingDate], [Address1], [Address2], [Address3], [City], [State], [CountryId], [Zip], [EmergencyContactName], [EmergencyContactPhone], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlextField1], [FlexField2]) VALUES (CAST(17 AS Numeric(18, 0)), N'3f9368b6-1d8a-475e-ba4d-0322eea0bfca', N'siva', N'siva', N'siva', N'siva1', 1, CAST(0x0000A30900000000 AS DateTime), CAST(115 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000A31000000000 AS DateTime), NULL, N'ss', N'ss', NULL, N'ss        ', N'73', CAST(113 AS Numeric(18, 0)), N'---234233242234324', N'ss', N'222', 1, N'1         ', CAST(0x0000A311017D2EF8 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [UserId], [FirstName], [LastName], [MiddleName], [EmployeeCode], [Gender], [DOB], [DesignationId], [BUId], [LocationId], [DOJ], [LeavingDate], [Address1], [Address2], [Address3], [City], [State], [CountryId], [Zip], [EmergencyContactName], [EmergencyContactPhone], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlextField1], [FlexField2]) VALUES (CAST(18 AS Numeric(18, 0)), N'a47e2b08-a6fc-4ccb-afd4-5519000215f8', N'shell', N'shell', N'shell', N'shell', 1, CAST(0x0000A31500000000 AS DateTime), CAST(115 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000A31600000000 AS DateTime), NULL, N'shell', N'shell', NULL, N'shell     ', N'73', CAST(113 AS Numeric(18, 0)), N'223', N'shell', N'4234234', 1, N'1         ', CAST(0x0000A3140166DCA1 AS DateTime), N'1         ', CAST(0x0000A314016B285E AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [UserId], [FirstName], [LastName], [MiddleName], [EmployeeCode], [Gender], [DOB], [DesignationId], [BUId], [LocationId], [DOJ], [LeavingDate], [Address1], [Address2], [Address3], [City], [State], [CountryId], [Zip], [EmergencyContactName], [EmergencyContactPhone], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlextField1], [FlexField2]) VALUES (CAST(19 AS Numeric(18, 0)), N'75fc9360-2e16-4423-9568-0597ea256fb4', N'Shell1', N'Shell1', N'Shell1', N'Shell1', 1, CAST(0x0000A31500000000 AS DateTime), CAST(115 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000A31600000000 AS DateTime), NULL, N'Shell1', N'', NULL, N'Shell1    ', N'73', CAST(113 AS Numeric(18, 0)), N'234324', N'Shell1', N'4324', 1, N'1         ', CAST(0x0000A314018563B2 AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EmployeeMaster] OFF
/****** Object:  Table [dbo].[ChargeCodeMaster]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChargeCodeMaster](
	[BuId] [numeric](18, 0) NOT NULL,
	[ChargeCodeID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ChargeCode] [varchar](10) NOT NULL,
	[ChargeCodeDesc] [varchar](50) NOT NULL,
	[GroupDriven] [bit] NOT NULL,
	[UnitDriven] [bit] NOT NULL,
	[AdhocValue] [bit] NOT NULL,
	[IsInsurance] [bit] NOT NULL,
	[IsRental] [bit] NOT NULL,
	[IsNonRental] [bit] NOT NULL,
	[IsTrafficViolation] [bit] NOT NULL,
	[IsOtherCompliance] [bit] NOT NULL,
	[IsVasWhileRenting] [bit] NOT NULL,
	[IsVasWhileClosing] [bit] NOT NULL,
	[IsOtherVas] [bit] NOT NULL,
	[ServiceChargeApplicable] [bit] NOT NULL,
	[ServiceChargeType] [varchar](1) NULL,
	[ServiceCharge] [numeric](18, 0) NOT NULL,
	[IsDeductible] [bit] NOT NULL,
	[IsDeductibleWaiver] [bit] NOT NULL,
	[WaivingPercentage] [numeric](18, 0) NOT NULL,
	[IsSecured] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_ChargeCodeMaster] PRIMARY KEY CLUSTERED 
(
	[ChargeCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChargeCodeMaster] ON
INSERT [dbo].[ChargeCodeMaster] ([BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'test', N'test', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'P', CAST(0 AS Numeric(18, 0)), 0, 0, CAST(0 AS Numeric(18, 0)), 0, CAST(0x0000A30D0169F598 AS DateTime), N'1', NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[ChargeCodeMaster] ([BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'test1', N'test upd', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'F', CAST(100 AS Numeric(18, 0)), 0, 0, CAST(501 AS Numeric(18, 0)), 1, CAST(0x0000A30D016B4072 AS DateTime), N'1', CAST(0x0000A30E001C9BC3 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[ChargeCodeMaster] ([BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'11', N'11', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'P', CAST(0 AS Numeric(18, 0)), 1, 0, CAST(0 AS Numeric(18, 0)), 0, CAST(0x0000A30D01843D5D AS DateTime), N'1', CAST(0x0000A312000043FB AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[ChargeCodeMaster] ([BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'111', N'11', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'P', CAST(0 AS Numeric(18, 0)), 0, 0, CAST(0 AS Numeric(18, 0)), 0, CAST(0x0000A30E00088ED1 AS DateTime), N'1', CAST(0x0000A31101872634 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[ChargeCodeMaster] ([BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), N's', N'ww', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'P', CAST(12 AS Numeric(18, 0)), 0, 0, CAST(0 AS Numeric(18, 0)), 1, CAST(0x0000A30E0020D657 AS DateTime), N'1', CAST(0x0000A311018A405F AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[ChargeCodeMaster] ([BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'test11', N'222', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, N'P', CAST(0 AS Numeric(18, 0)), 0, 0, CAST(0 AS Numeric(18, 0)), 1, CAST(0x0000A311018AFD05 AS DateTime), N'1', CAST(0x0000A31201143378 AS DateTime), N'1', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChargeCodeMaster] OFF
/****** Object:  Table [dbo].[BusinessUnits]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusinessUnits](
	[BuId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[OrgId] [numeric](18, 0) NULL,
	[BuCode] [varchar](10) NULL,
	[BUName] [varchar](100) NULL,
	[BuAddress1] [varchar](50) NULL,
	[BuAddress2] [varchar](50) NULL,
	[BuAddress3] [varchar](50) NULL,
	[BuPostBox] [varchar](10) NULL,
	[BuPhoneNo] [varchar](10) NULL,
	[BuFax] [varchar](10) NULL,
	[BuEmailId] [varchar](10) NULL,
	[BuMobile] [varchar](10) NULL,
	[BuZip] [varchar](10) NULL,
	[BuContactPerson] [varchar](10) NULL,
	[BuBaseCurrency] [numeric](18, 0) NULL,
	[BuDecimals] [tinyint] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_BusinessUnits] PRIMARY KEY CLUSTERED 
(
	[BuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BusinessUnits] ON
INSERT [dbo].[BusinessUnits] ([BuId], [OrgId], [BuCode], [BUName], [BuAddress1], [BuAddress2], [BuAddress3], [BuPostBox], [BuPhoneNo], [BuFax], [BuEmailId], [BuMobile], [BuZip], [BuContactPerson], [BuBaseCurrency], [BuDecimals], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'sonata', N'sonata', N'sonata test2', N'sonata2', N'sonata', N'0', N'sonata', N'sonata', N'sonata', N'9534345345', N'sonata', N'sonata', CAST(1 AS Numeric(18, 0)), 0, N'1', NULL, N'1', CAST(0x0000A2C90157BBC3 AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BusinessUnits] OFF
/****** Object:  Table [dbo].[LookupCategories]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookupCategories](
	[LookupCategoryID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[LookupCategoryCode] [varchar](50) NULL,
	[LookupCategoryDesc] [varchar](50) NULL,
	[IsGLookup] [bit] NULL,
	[IsAppSpecific] [bit] NOT NULL,
	[IsOrgSpecific] [bit] NOT NULL,
	[IsBuSpecific] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_LookupCategories] PRIMARY KEY CLUSTERED 
(
	[LookupCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LookupCategories] ON
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(16 AS Numeric(18, 0)), N'Vehicle Make & Brand', N'Vehicle Make & Brand', 0, 1, 1, 1, CAST(0x0000A25D016D5B03 AS DateTime), N'1', CAST(0x0000A25D016D5B03 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(17 AS Numeric(18, 0)), N'Vehicle Group & Sub-Group', N'Vehicle Group & Sub-Group', 0, 1, 1, 1, CAST(0x0000A25D016D8FFC AS DateTime), N'1', CAST(0x0000A25D016D8FFC AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(19 AS Numeric(18, 0)), N'Country & State/Emirate', N'Country & State/Emirate', 0, 1, 1, 1, CAST(0x0000A27D014AE5A8 AS DateTime), N'1', CAST(0x0000A27D014AE5A8 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(40 AS Numeric(18, 0)), N'Vehicle Status', N'Vehicle Status', 1, 1, 1, 1, CAST(0x0000A2ED01889AE5 AS DateTime), N'1', CAST(0x0000A2ED01889AE5 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(41 AS Numeric(18, 0)), N'Vehicle Year Model', N'Vehicle YearModel', 1, 1, 1, 1, CAST(0x0000A2ED01889AE6 AS DateTime), N'1', CAST(0x0000A2ED01889AE6 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(42 AS Numeric(18, 0)), N'Vehicle Trans Type', N'Vehicle Trans Type', 1, 1, 1, 1, CAST(0x0000A2ED01889AE6 AS DateTime), N'1', CAST(0x0000A2ED01889AE6 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(43 AS Numeric(18, 0)), N'Vehicle Engine Capacity', N'Vehicle Engine Capacity', 1, 1, 1, 1, CAST(0x0000A2ED01889AE6 AS DateTime), N'1', CAST(0x0000A2ED01889AE6 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(44 AS Numeric(18, 0)), N'Vehicle Class', N'Vehicle Class', 1, 1, 1, 1, CAST(0x0000A2ED01889AE6 AS DateTime), N'1', CAST(0x0000A2ED01889AE6 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(45 AS Numeric(18, 0)), N'Vehicle Seating Capacity', N'Vehicle Seating Capacity', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(46 AS Numeric(18, 0)), N'Vehicle Fuel Type', N'Vehicle	Fuel Type', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(47 AS Numeric(18, 0)), N'Vehicle Tank Size', N'Vehicle	Tank Size', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(48 AS Numeric(18, 0)), N'Vehicle Trade License', N'Vehicle	Trade License', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(49 AS Numeric(18, 0)), N'Vehicle Plate Color', N'Vehicle Plate Color', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(50 AS Numeric(18, 0)), N'Vehicle Contract Type', N'Vehicle	Contract Type', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(51 AS Numeric(18, 0)), N'Hire Type', N'HireType', 1, 1, 1, 1, CAST(0x0000A2ED01889AE7 AS DateTime), N'1', CAST(0x0000A2ED01889AE7 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(52 AS Numeric(18, 0)), N'Designation', N'Designation', 1, 1, 1, 1, CAST(0x0000A2ED01889AE8 AS DateTime), N'1', CAST(0x0000A2ED01889AE8 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(53 AS Numeric(18, 0)), N'Nationality', N'Nationality', 1, 1, 1, 1, CAST(0x0000A2ED01889AE8 AS DateTime), N'1', CAST(0x0000A2ED01889AE8 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(54 AS Numeric(18, 0)), N'Bank Name', N'BankName', 1, 1, 1, 1, CAST(0x0000A2ED01889AE8 AS DateTime), N'1', CAST(0x0000A2ED01889AE8 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(55 AS Numeric(18, 0)), N'Credit Card Type', N'CreditCardType', 1, 1, 1, 1, CAST(0x0000A2ED01889AE8 AS DateTime), N'1', CAST(0x0000A2ED01889AE8 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(56 AS Numeric(18, 0)), N'Visa Type', N'VisaType', 1, 1, 1, 1, CAST(0x0000A2ED01889AE8 AS DateTime), N'1', CAST(0x0000A2ED01889AE8 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(57 AS Numeric(18, 0)), N'Preferred Contact Method', N'Preferred Contact Method', 1, 1, 1, 1, CAST(0x0000A2ED01889AE9 AS DateTime), N'1', CAST(0x0000A2ED01889AE9 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(58 AS Numeric(18, 0)), N'Value Added Services', N'Value Added Services', 1, 1, 1, 1, CAST(0x0000A2ED01889AE9 AS DateTime), N'1', CAST(0x0000A2ED01889AE9 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(59 AS Numeric(18, 0)), N'Insurance Type', N'Insurance Type', 1, 1, 1, 1, CAST(0x0000A2ED01889AE9 AS DateTime), N'1', CAST(0x0000A2ED01889AE9 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(60 AS Numeric(18, 0)), N'Insurance Company', N'Insurance Company', 1, 1, 1, 1, CAST(0x0000A2ED01889AE9 AS DateTime), N'1', CAST(0x0000A2ED01889AE9 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(61 AS Numeric(18, 0)), N'Service Agency Name', N'Service Agency Name', 1, 1, 1, 1, CAST(0x0000A2ED01889AE9 AS DateTime), N'1', CAST(0x0000A2ED01889AE9 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(62 AS Numeric(18, 0)), N'Discount Percentage', N'Discount Percentage', 1, 1, 1, 1, CAST(0x0000A2ED01889AEA AS DateTime), N'1', CAST(0x0000A2ED01889AEA AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(63 AS Numeric(18, 0)), N'Base Currency', N'Base Currency', 1, 1, 1, 1, CAST(0x0000A2ED01889AEA AS DateTime), N'1', CAST(0x0000A2ED01889AEA AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(64 AS Numeric(18, 0)), N'Quotation Status', N'Quotation Status', 1, 1, 1, 1, CAST(0x0000A2ED01889AEA AS DateTime), N'1', CAST(0x0000A2ED01889AEA AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(65 AS Numeric(18, 0)), N'Agreement Status', N'Agreement Status', 1, 1, 1, 1, CAST(0x0000A2ED01889AEA AS DateTime), N'1', CAST(0x0000A2ED01889AEA AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(66 AS Numeric(18, 0)), N'Vehicle Color & Sub-Color', N'Vehicle Color & Sub-Color', 0, 1, 1, 1, CAST(0x0000A25D016D8FFC AS DateTime), N'1', CAST(0x0000A25D016D8FFC AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(69 AS Numeric(18, 0)), N'Vehicle Type & Sub-Type', N'Vehicle Type & Sub-Type', 0, 1, 1, 1, CAST(0x0000A25D00000000 AS DateTime), N'1', CAST(0x0000A25D00000000 AS DateTime), N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[LookupCategories] ([LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsGLookup], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(70 AS Numeric(18, 0)), N'Location Incharge', N'Location Incharge', 1, 1, 1, 1, CAST(0x0000A30500000000 AS DateTime), N'1', CAST(0x0000A30500000000 AS DateTime), N'1', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LookupCategories] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[LocationCode] [varchar](10) NULL,
	[LocationName] [varchar](50) NULL,
	[ListedInWeb] [bit] NULL,
	[WorkingHrs] [numeric](18, 0) NULL,
	[WorkFrom] [time](7) NULL,
	[WorksTill] [time](7) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Mobile] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[AddressLine1] [nvarchar](50) NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[AddressLine3] [nvarchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[CountryId] [numeric](18, 0) NULL,
	[EmirateId] [numeric](18, 0) NULL,
	[Zip] [int] NULL,
	[LocationInChargeId] [numeric](18, 0) NULL,
	[ReciptNoStart] [numeric](18, 0) NULL,
	[ReceiptNoCurrent] [numeric](18, 0) NULL,
	[RentalAgreementNoStart] [numeric](18, 0) NULL,
	[RentalAgreementNoCurrent] [numeric](18, 0) NULL,
	[LeaseAgreementNoStart] [numeric](18, 0) NULL,
	[LeaseAgreementNoCurrent] [numeric](18, 0) NULL,
	[IsARevenue] [bit] NULL,
	[IsACounter] [bit] NULL,
	[IsAWorkShop] [bit] NULL,
	[IsAVirtual] [bit] NULL,
	[LeasingAllowed] [bit] NULL,
	[RentingAllowed] [bit] NULL,
	[BuId] [numeric](18, 0) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[FlexField1] [varchar](50) NULL,
	[FlexField2] [varchar](50) NULL,
	[FlexField3] [varchar](50) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationID], [LocationCode], [LocationName], [ListedInWeb], [WorkingHrs], [WorkFrom], [WorksTill], [Address], [Phone], [Mobile], [Fax], [Email], [AddressLine1], [AddressLine2], [AddressLine3], [Designation], [City], [CountryId], [EmirateId], [Zip], [LocationInChargeId], [ReciptNoStart], [ReceiptNoCurrent], [RentalAgreementNoStart], [RentalAgreementNoCurrent], [LeaseAgreementNoStart], [LeaseAgreementNoCurrent], [IsARevenue], [IsACounter], [IsAWorkShop], [IsAVirtual], [LeasingAllowed], [RentingAllowed], [BuId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(9 AS Numeric(18, 0)), N'Che', N'Che', 1, CAST(1 AS Numeric(18, 0)), CAST(0x0700D0E693C30000 AS Time), CAST(0x0700D0E693C30000 AS Time), NULL, N'8787', NULL, N'6776', N'Che@Che.oo', N'll', N'Che', NULL, N'Che', N'pp', CAST(113 AS Numeric(18, 0)), CAST(73 AS Numeric(18, 0)), 8778, CAST(116 AS Numeric(18, 0)), CAST(77 AS Numeric(18, 0)), CAST(6556 AS Numeric(18, 0)), CAST(6556 AS Numeric(18, 0)), CAST(776 AS Numeric(18, 0)), CAST(77 AS Numeric(18, 0)), CAST(7676 AS Numeric(18, 0)), 1, 0, 0, 0, 0, 1, CAST(1 AS Numeric(18, 0)), CAST(0x0000A30901813404 AS DateTime), N'1', CAST(0x0000A3120101E16D AS DateTime), N'1', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[HLookup]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HLookup](
	[HLookupID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[GlookupID] [numeric](18, 0) NOT NULL,
	[LookupCategoryID] [numeric](18, 0) NOT NULL,
	[HLookupDesc] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [char](1) NOT NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_HLookup] PRIMARY KEY CLUSTERED 
(
	[HLookupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HLookup] ON
INSERT [dbo].[HLookup] ([HLookupID], [GlookupID], [LookupCategoryID], [HLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(73 AS Numeric(18, 0)), CAST(113 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'tamilnadu', CAST(0x0000A30F000628E4 AS DateTime), N'1', NULL, NULL, N'1', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HLookup] OFF
/****** Object:  Table [dbo].[GLookup]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GLookup](
	[GLookupID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[LookupCategoryID] [numeric](18, 0) NOT NULL,
	[GLookupDesc] [varchar](100) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_GLookup] PRIMARY KEY CLUSTERED 
(
	[GLookupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GLookup] ON
INSERT [dbo].[GLookup] ([GLookupID], [LookupCategoryID], [GLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(113 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'india', CAST(0x0000A30F000628DB AS DateTime), N'1', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GLookup] ([GLookupID], [LookupCategoryID], [GLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(114 AS Numeric(18, 0)), CAST(63 AS Numeric(18, 0)), N'inr', CAST(0x0000A30F00064348 AS DateTime), N'1', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GLookup] ([GLookupID], [LookupCategoryID], [GLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(115 AS Numeric(18, 0)), CAST(52 AS Numeric(18, 0)), N'Lead', CAST(0x0000A31000BE4EE6 AS DateTime), N'1', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[GLookup] ([GLookupID], [LookupCategoryID], [GLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(116 AS Numeric(18, 0)), CAST(70 AS Numeric(18, 0)), N'Lead', CAST(0x0000A31200C616BD AS DateTime), N'1', NULL, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GLookup] OFF
/****** Object:  Table [dbo].[Organisation]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organisation](
	[OrgID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[OrgCode] [varchar](10) NOT NULL,
	[OrgLogoPath] [nvarchar](50) NULL,
	[OrgName] [varchar](50) NOT NULL,
	[OrgAddress1] [varchar](100) NOT NULL,
	[OrgAddress2] [varchar](100) NULL,
	[OrgAddress3] [varchar](100) NULL,
	[OrgCity] [nvarchar](50) NULL,
	[OrgCountryId] [numeric](18, 0) NULL,
	[OrgEmirate] [numeric](18, 0) NULL,
	[OrgPostBoxNo] [nvarchar](50) NULL,
	[CPersonName] [varchar](50) NULL,
	[CEMailID] [nvarchar](50) NOT NULL,
	[CMobileNo] [nvarchar](25) NULL,
	[CPersonDesignation] [nvarchar](50) NULL,
	[OrgPhoneNo] [nvarchar](20) NULL,
	[OrgFaxNo] [varchar](20) NULL,
	[OrgEmailID] [varchar](50) NULL,
	[OrgZip] [nvarchar](50) NULL,
	[BaseCurrencyId] [numeric](18, 0) NULL,
	[DateFormat] [varchar](10) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[FlexField1] [varchar](100) NULL,
	[FlexField2] [varchar](100) NULL,
	[FlexField3] [varchar](100) NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Organisation] ON
INSERT [dbo].[Organisation] ([OrgID], [OrgCode], [OrgLogoPath], [OrgName], [OrgAddress1], [OrgAddress2], [OrgAddress3], [OrgCity], [OrgCountryId], [OrgEmirate], [OrgPostBoxNo], [CPersonName], [CEMailID], [CMobileNo], [CPersonDesignation], [OrgPhoneNo], [OrgFaxNo], [OrgEmailID], [OrgZip], [BaseCurrencyId], [DateFormat], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]) VALUES (CAST(3 AS Numeric(18, 0)), N'sonata', N'', N'sonata', N'sontat', N'sontat', N'', N'sontant', CAST(113 AS Numeric(18, 0)), CAST(73 AS Numeric(18, 0)), N'', N'sonfa', N'asodfn@sfonsd.fom', N'324324', N'sonaf', N'8787', N'778', N'asodfn@sfonsd.fom', N'234', CAST(114 AS Numeric(18, 0)), N'1', CAST(0x0000A30F0008466E AS DateTime), N'1', NULL, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Organisation] OFF
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMaster](
	[ModuleId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ModuleCode] [nvarchar](50) NULL,
	[ModuleName] [nvarchar](50) NULL,
	[SubModuleCode] [nvarchar](max) NULL,
	[SubModuleName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[FlexField1] [nvarchar](50) NULL,
 CONSTRAINT [PK_ModuleMaster] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ModuleMaster] ON
INSERT [dbo].[ModuleMaster] ([ModuleId], [ModuleCode], [ModuleName], [SubModuleCode], [SubModuleName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(1 AS Numeric(18, 0)), N'AD001', N'Administrator', N'MA001', N'Masters', 1, N'1', CAST(0x0000A2C10188BE94 AS DateTime), N'1', CAST(0x0000A2C10188BE94 AS DateTime), NULL)
INSERT [dbo].[ModuleMaster] ([ModuleId], [ModuleCode], [ModuleName], [SubModuleCode], [SubModuleName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(2 AS Numeric(18, 0)), N'FL001', N'Fleet Management', N'VH001', N'Vehicle', 1, N'1', CAST(0x0000A2C10188BE99 AS DateTime), N'1', CAST(0x0000A2C10188BE99 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ModuleMaster] OFF
/****** Object:  Table [dbo].[PageMaster]    Script Date: 02/05/2016 09:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageMaster](
	[PageId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ModuleId] [numeric](18, 0) NOT NULL,
	[PageCode] [nvarchar](50) NULL,
	[PageName] [nvarchar](50) NULL,
	[PageDetails] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[FlexField1] [nvarchar](50) NULL,
 CONSTRAINT [PagesMaster] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PageMaster] ON
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A001', N'GeneralLookups', N'General Lookups', 1, N'1', CAST(0x0000A2C10188F66A AS DateTime), N'1', CAST(0x0000A2C10188F66A AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A002', N'HierarchicalLookups', N'Hierarchical Lookups', 1, N'1', CAST(0x0000A2C10188F66B AS DateTime), N'1', CAST(0x0000A2C10188F66B AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A003', N'CompanySetup', N'Company Setup', 1, N'1', CAST(0x0000A2C10188F66B AS DateTime), N'1', CAST(0x0000A2C10188F66B AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A004', N'Locations', N'Locations', 1, N'1', CAST(0x0000A2C10188F670 AS DateTime), N'1', CAST(0x0000A2C10188F670 AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A005', N'ChargeCodes', N'Charge Codes', 1, N'1', CAST(0x0000A2C10188F672 AS DateTime), N'1', CAST(0x0000A2C10188F672 AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A007', N'Employees', N'Employees Master', 1, N'1', CAST(0x0000A2C10188F674 AS DateTime), N'1', CAST(0x0000A2C10188F674 AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A008', N'Roles', N'Roles', 1, N'1', CAST(0x0000A2C10188F675 AS DateTime), N'1', CAST(0x0000A2C10188F675 AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A009', N'Privileges', N'Privileges', 1, N'1', CAST(0x0000A2C10188F676 AS DateTime), N'1', CAST(0x0000A2C10188F676 AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A010', N'Users', N'Users', 1, N'1', CAST(0x0000A2C10188F676 AS DateTime), N'1', CAST(0x0000A2C10188F676 AS DateTime), NULL)
INSERT [dbo].[PageMaster] ([PageId], [ModuleId], [PageCode], [PageName], [PageDetails], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [FlexField1]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'F003', N'VehicleMaster', N'Vehicle Master', 1, N'1', CAST(0x0000A2C10188F677 AS DateTime), N'1', CAST(0x0000A2C10188F677 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PageMaster] OFF
/****** Object:  StoredProcedure [dbo].[usp_OrganisationSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_OrganisationSelect]
	@OrgID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [OrgID], [OrgCode], [OrgLogoPath], [OrgName], [OrgAddress1], [OrgAddress2], [OrgAddress3], [OrgCity], 
	[OrgCountryId], (Select top 1 GLookupDesc from GLookup where GLookupID = OrgCountryId group by GLookupDesc) OrgCountry,
	[OrgEmirate], (Select top 1 HLookupDesc from HLookup where HLookupID = [OrgEmirate] group by HLookupDesc) OrgEmirateName,
	[OrgPostBoxNo], [CPersonName], CPersonDesignation, [CEMailID], [CMobileNo], [OrgPhoneNo], [OrgFaxNo], 
	[OrgEmailID], [OrgZip], [BaseCurrencyId], (Select top 1 GLookupDesc from GLookup where GLookupID = [BaseCurrencyId] group by GLookupDesc) BaseCurrency,
	[DateFormat],[CreatedBy] UserId, [IsActive]
	  FROM [dbo].[Organisation]
	 WHERE  ([OrgID] = @OrgID OR @OrgID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_OrganisationInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_OrganisationInsertUpdate]
	@OrgId numeric, 
	@OrgCode varchar(10),
	@OrgLogoPath nvarchar(50),
	@OrgName varchar(50),
	@OrgAddress1 varchar(100),
	@OrgAddress2 varchar(100),
	@OrgAddress3 varchar(100),
	@OrgCity nvarchar(50),
	@OrgCountryId numeric,
	@OrgEmirate numeric,
	@OrgPostBoxNo nvarchar(50),
	@CPersonName varchar(50),
	@CEMailID nvarchar(50),
	@CMobileNo nvarchar(25),
	@CPersonDesignation nvarchar(25),
	@OrgPhoneNo varchar(20),
	@OrgFaxNo varchar(20),
	@OrgEmailID varchar(50),
	@OrgZip nvarchar(50),
	@BaseCurrencyId numeric,
	@DateFormat varchar(10),
	@UserId varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
	if(@OrgId>0)
	BEGIN
		UPDATE [dbo].[Organisation]
	   SET [OrgCode] = @OrgCode,
		   [OrgLogoPath] = @OrgLogoPath,
		   [OrgName] = @OrgName,
		   [OrgAddress1] = @OrgAddress1,
		   [OrgAddress2] = @OrgAddress2,
		   [OrgAddress3] = '',
		   [OrgCity] = @OrgCity,
		   [OrgCountryId] = @OrgCountryId,
		   [OrgEmirate] = @OrgEmirate,
		   [OrgPostBoxNo] = @OrgPostBoxNo,
		   [CPersonName] = @CPersonName,
		   [CEMailID] = @CEMailID,
		   [CMobileNo] = @CMobileNo,
		   CPersonDesignation = @CPersonDesignation,
		   [OrgPhoneNo] = @OrgPhoneNo,
		   [OrgFaxNo] = @OrgFaxNo,
		   [OrgEmailID] = @OrgEmailID,
		   [OrgZip] = @OrgZip,
		   [BaseCurrencyId] = @BaseCurrencyId,
		   [DateFormat] = @DateFormat,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UserId,
		   [IsActive] = @IsActive
	 WHERE [OrgID] = @OrgID
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Organisation] (OrgCode, OrgLogoPath, OrgName, OrgAddress1, OrgAddress2, OrgAddress3, OrgCity, OrgCountryId, OrgEmirate, OrgPostBoxNo, CPersonName, CEMailID, CMobileNo,CPersonDesignation, OrgPhoneNo, OrgFaxNo, OrgEmailID, OrgZip, BaseCurrencyId, [DateFormat], CreatedBy,CreatedOn, IsActive)
			VALUES (@OrgCode, @OrgLogoPath, @OrgName, @OrgAddress1, @OrgAddress2, '', @OrgCity, @OrgCountryId, @OrgEmirate, @OrgPostBoxNo, @CPersonName, @CEMailID, @CMobileNo,@CPersonDesignation, @OrgPhoneNo, @OrgFaxNo, @OrgEmailID, @OrgZip, @BaseCurrencyId, @DateFormat, @UserId,GETDATE(), @IsActive)
	END
	
	SELECT [OrgID] 
		FROM [dbo].[Organisation]
			WHERE [OrgID] = SCOPE_IDENTITY()

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_OrganisationDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_OrganisationDelete]
	@OrgID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[Organisation]
	 SET ISACTIVE=0 WHERE [OrgID] = @OrgID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupCategoriesUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LookupCategoriesUpdate]
	@LookupCategoryID numeric,
	@LookupCategoryCode varchar(10),
	@LookupCategoryDesc varchar(50),
	@IsAppSpecific bit,
	@IsOrgSpecific bit,
	@IsBuSpecific bit,
	@UpdatedOn datetime,
	@UpdatedBy varchar(50),
	@IsActive bit,
	@FlexField1 varchar(100),
	@FlexField2 varchar(100),
	@FlexField3 varchar(100)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[LookupCategories]
	   SET [LookupCategoryCode] = @LookupCategoryCode,
		   [LookupCategoryDesc] = @LookupCategoryDesc,
		   [IsAppSpecific] = @IsAppSpecific,
		   [IsOrgSpecific] = @IsOrgSpecific,
		   [IsBuSpecific] = @IsBuSpecific,
		   [UpdatedOn] = @UpdatedOn,
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive,
		   [FlexField1] = @FlexField1,
		   [FlexField2] = @FlexField2,
		   [FlexField3] = @FlexField3
	 WHERE [LookupCategoryID] = @LookupCategoryID

	 SELECT @LookupCategoryID AS [LookupCategoryID]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupCategoriesSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LookupCategoriesSelect]
	@LookupCategoryID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
	SELECT [LookupCategoryID], [LookupCategoryCode], [LookupCategoryDesc], [IsAppSpecific], [IsOrgSpecific], [IsBuSpecific],HierarchyLevel, [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[LookupCategories]
	 WHERE  ([LookupCategoryID] = @LookupCategoryID OR @LookupCategoryID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupCategoriesInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LookupCategoriesInsert]
	@LookupCategoryCode varchar(10),
	@LookupCategoryDesc varchar(50),
	@IsGLookup bit,
	@IsAppSpecific bit,
	@IsOrgSpecific bit,
	@IsBuSpecific bit,
	@CreatedBy varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	INSERT INTO [dbo].[LookupCategories] (LookupCategoryCode, LookupCategoryDesc,IsGLookup, IsAppSpecific, IsOrgSpecific, IsBuSpecific, CreatedBy, IsActive)
	VALUES (@LookupCategoryCode, @LookupCategoryDesc,@IsGLookup, @IsAppSpecific, @IsOrgSpecific, @IsBuSpecific, @CreatedBy, @IsActive)

	SELECT [LookupCategoryID] 
	FROM [dbo].[LookupCategories]
	WHERE [LookupCategoryID] = SCOPE_IDENTITY()

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupCategoriesDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LookupCategoriesDelete]
	@LookupCategoryID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[LookupCategories]
	 SET ISACTIVE=0 WHERE [LookupCategoryID] = @LookupCategoryID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LocationsUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LocationsUpdate]
	@LocationID numeric,
	@LocationCode varchar(10),
	@LocationName varchar(50),
	@ListedInWeb bit,
	@WorkingHrs numeric,
	@WorkFrom time,
	@WorksTill time,
	@Phone varchar(10),
	@Fax varchar(10),
	@Email varchar(50),
	@AddressLine1 nvarchar(50),
	@AddressLine2 nvarchar(50),
	--@AddressLine3 nvarchar(50),
	@Designation varchar(20),
	@City varchar(10),
	@CountryId numeric,
	@EmirateId numeric,
	@Zip int,
	@LocationInChargeId numeric,
	@ReciptNoStart numeric,
	@ReceiptNoCurrent numeric,
	@RentalAgreementNoStart numeric,
	@RentalAgreementNoCurrent numeric,
	@LeaseAgreementNoStart numeric,
	@LeaseAgreementNoCurrent numeric,
	@IsARevenue bit,
	@IsACounter bit,
	@IsAWorkShop bit,
	@IsAVirtual bit,
	@LeasingAllowed bit,
	@RentingAllowed bit,
	@BuId numeric,
	@UpdatedBy numeric,
	@IsActive bit
	
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[Locations]
	   SET [LocationCode] = @LocationCode,
		   [LocationName] = @LocationName,
		   [ListedInWeb] = @ListedInWeb,
		   [WorkingHrs] = @WorkingHrs,
		   [WorkFrom] = @WorkFrom,
		   [WorksTill] = @WorksTill,
		   [Phone] = @Phone,
		   [Fax] = @Fax,
		   [Email] = @Email,
		   [AddressLine1] = @AddressLine1,
		   [AddressLine2] = @AddressLine2,
		   --[AddressLine3] = @AddressLine3,
		   [Designation] = @Designation,
		   [City] = @City,
		   [CountryId] = @CountryId,
		   [EmirateId] = @EmirateId,
		   [Zip] = @Zip,
		   LocationInChargeId=@LocationInChargeId,
		   [ReciptNoStart] = @ReciptNoStart,
		   [ReceiptNoCurrent] = @ReceiptNoCurrent,
		   [RentalAgreementNoStart] = @RentalAgreementNoStart,
		   [RentalAgreementNoCurrent] = @RentalAgreementNoCurrent,
		   [LeaseAgreementNoStart] = @LeaseAgreementNoStart,
		   [LeaseAgreementNoCurrent] = @LeaseAgreementNoCurrent,
		   [IsARevenue] = @IsARevenue,
		   [IsACounter] = @IsACounter,
		   [IsAWorkShop] = @IsAWorkShop,
		   [IsAVirtual] = @IsAVirtual,
		   [LeasingAllowed] = @LeasingAllowed,
		   [RentingAllowed] = @RentingAllowed,
		   [BuId] = @BuId,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [LocationID] = @LocationID

	 SELECT @LocationID AS [LocationID]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LocationsStatusUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LocationsStatusUpdate]
	@LocationID numeric,
	@BuId numeric,
	@UpdatedBy varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[Locations]
	   SET
		   [BuId] = @BuId,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [LocationID] = @LocationID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LocationsSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LocationsSelect]
	@LocationID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [LocationID], [LocationCode], [LocationName], [ListedInWeb], [WorkingHrs], [WorkFrom], [WorksTill], [Address], [Phone], [Fax], [Email], [AddressLine1], [AddressLine2], [AddressLine3], [Designation], [City],
	 ISNULL([CountryId],0) [CountryId],  (Select top 1 GLookupDesc from GLookup where GLookupID = [CountryId] group by GLookupDesc) Country
	 , ISNULL([EmirateId],0) [EmirateId], (Select top 1 HLookupDesc from HLookup where HLookupID = [EmirateId] group by HLookupDesc) Emirate
	 , [Zip], ISNULL([LocationInChargeId],0) LocationInChargeId,(Select top 1 GLookupDesc from GLookup where GLookupID = LocationInChargeId group by GLookupDesc) LocationInCharge,
	  [IsARevenue], [IsACounter], [IsAWorkShop], [IsAVirtual], [LeasingAllowed], [RentingAllowed], [BuId],[CreatedOn], Isnull([CreatedBy],0) CreatedBy, [IsActive]
	,ISNULL([ReciptNoStart],0) ReciptNoStart, ISNULL([ReceiptNoCurrent],0) ReceiptNoCurrent, ISNULL([RentalAgreementNoStart],0) RentalAgreementNoStart, ISNULL([RentalAgreementNoCurrent],0) RentalAgreementNoCurrent, ISNULL([LeaseAgreementNoStart],0) LeaseAgreementNoStart, ISNULL([LeaseAgreementNoCurrent],0) LeaseAgreementNoCurrent
	  FROM [dbo].[Locations]
	 WHERE  ([LocationID] = @LocationID OR @LocationID IS NULL OR @LocationID = 0) ORDER BY [LocationID] ASC

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_LocationsInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LocationsInsert]
	@LocationCode varchar(10),
	@LocationName varchar(50),
	@ListedInWeb bit,
	@WorkingHrs numeric,
	@WorkFrom time,
	@WorksTill time,
	@Phone varchar(10),
	@Fax varchar(10),
	@Email varchar(50),
	@AddressLine1 nvarchar(50),
	@AddressLine2 nvarchar(50),
	--@AddressLine3 nvarchar(50),
	@LocationInChargeId numeric,
	@Designation varchar(20),
	@City varchar(10),
	@CountryId numeric,
	@EmirateId numeric,
	@Zip int,
	@ReciptNoStart numeric,
	@ReceiptNoCurrent numeric,
	@RentalAgreementNoStart numeric,
	@RentalAgreementNoCurrent numeric,
	@LeaseAgreementNoStart numeric,
	@LeaseAgreementNoCurrent numeric,
	@IsARevenue bit,
	@IsACounter bit,
	@IsAWorkShop bit,
	@IsAVirtual bit,
	@LeasingAllowed bit,
	@RentingAllowed bit,
	@BuId numeric,
	@CreatedBy numeric,
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

BEGIN	

	DECLARE @Return_Value NUMERIC
	SET @Return_Value=0
	
IF (NOT EXISTS (SELECT * FROM [dbo].[Locations] WHERE  LocationCode = @LocationCode AND LocationName = @LocationName))
BEGIN

	BEGIN TRAN

	INSERT INTO [dbo].[Locations] (LocationCode, LocationName, ListedInWeb,LocationInChargeId, WorkingHrs, WorkFrom, WorksTill, Phone, Fax, Email, AddressLine1, AddressLine2, Designation, City, CountryId, EmirateId, Zip, ReciptNoStart, ReceiptNoCurrent, RentalAgreementNoStart, RentalAgreementNoCurrent, LeaseAgreementNoStart, LeaseAgreementNoCurrent, IsARevenue, IsACounter, IsAWorkShop, IsAVirtual, LeasingAllowed, RentingAllowed, BuId, CreatedBy,CreatedOn, IsActive)
	VALUES (@LocationCode, @LocationName, @ListedInWeb,@LocationInChargeId, @WorkingHrs, @WorkFrom, @WorksTill, @Phone, @Fax, @Email, @AddressLine1, @AddressLine2, @Designation, @City, @CountryId, @EmirateId, @Zip, @ReciptNoStart, @ReceiptNoCurrent, @RentalAgreementNoStart, @RentalAgreementNoCurrent, @LeaseAgreementNoStart, @LeaseAgreementNoCurrent, @IsARevenue, @IsACounter, @IsAWorkShop, @IsAVirtual, @LeasingAllowed, @RentingAllowed, @BuId, @CreatedBy,GETDATE(), @IsActive)

	SET @Return_Value = 1

	SELECT @Return_Value = [LocationID] 
		FROM [dbo].[Locations]
			WHERE [LocationID] = SCOPE_IDENTITY()
	COMMIT;
	
	END

return @Return_Value
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_LocationsDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LocationsDelete]
	@LocationID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[Locations]
	 SET ISACTIVE=0 WHERE [LocationID] = @LocationID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_HLookupUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_HLookupUpdate]
	@HLookupID numeric,
	@HLookupDesc varchar(50),
	@UpdatedBy varchar(50),
	@IsActive char(1),
	@FlexField1 varchar(100)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
IF(@FlexField1 = 'StatusUpdate')
BEGIN
	UPDATE [dbo].[HLookup]
	   SET 
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [HLookupID] = @HLookupID
	 
	 UPDATE [dbo].[GLookup]
	   SET 
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [GLookupID] in (SELECT GLookupID FROM [HLookup] WHERE HLookupID = @HLookupID)
END
ELSE
	BEGIN
	UPDATE [dbo].[HLookup]
	   SET 
		   [HLookupDesc] = @HLookupDesc,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [HLookupID] = @HLookupID
END
	 SELECT @HLookupID AS [HLookupID]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_HLookupSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_HLookupSelect]
	@HLookupID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [HLookupID], [GlookupID], [LookupCategoryID], [HLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[HLookup]
	 WHERE  ([HLookupID] = @HLookupID OR @HLookupID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_HLookupInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [usp_HLookupInsert] 30,16,'','test',1,1
CREATE PROC [dbo].[usp_HLookupInsert]
	@GlookupID numeric,
	@LookupCategoryID numeric,
	@HLookupDesc varchar(50),
	@GLookupDesc varchar(50),
	@CreatedBy varchar(50),
	@IsActive char(1)
	
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
BEGIN	

	DECLARE @Return_Value NUMERIC
	SET @Return_Value=0
	
IF (NOT EXISTS (SELECT * FROM [dbo].[HLookup] WHERE HLookupDesc = @HLookupDesc AND LookupCategoryID=@LookupCategoryID))
BEGIN
	BEGIN TRAN
		/* BEGIN: INSERT Category(GLookup) DATA */
		IF(@GLookupDesc <> '')
		BEGIN
			IF(NOT EXISTS (SELECT * FROM [dbo].[GLookup] WHERE GLookupDesc = @GLookupDesc AND LookupCategoryID=@LookupCategoryID))
			BEGIN
				INSERT INTO [dbo].[GLookup] (LookupCategoryID, GLookupDesc, CreatedBy,CreatedOn, IsActive)
					VALUES (@LookupCategoryID, @GLookupDesc, @CreatedBy,GETDATE(), @IsActive)

				SELECT @GlookupID = [GLookupID] FROM [dbo].[GLookup]
					WHERE [GLookupID] = SCOPE_IDENTITY()
					
					SET @Return_Value = 1
			END
				--ELSE
				--	return @Return_Value
		END
		/* END: INSERT Category(GLookup) DATA */
		
		/* BEGIN: INSERT Sub-Category(HLookup) DATA */
		INSERT INTO [dbo].[HLookup] (GlookupID, LookupCategoryID, HLookupDesc, CreatedOn, CreatedBy, IsActive)
		VALUES (@GlookupID, @LookupCategoryID, @HLookupDesc, GETDATE(), @CreatedBy, @IsActive)
		SET @Return_Value=2

		--SELECT [HLookupID] FROM [dbo].[HLookup]
		--	WHERE [HLookupID] = SCOPE_IDENTITY()
		/* END: INSERT Sub-Category(HLookup) DATA */
	
		
	
	COMMIT;
END

return @Return_Value
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_HLookupDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_HLookupDelete]
	@HLookupID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[HLookup]
	 SET ISACTIVE=0 WHERE [HLookupID] = @HLookupID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_GLookupUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GLookupUpdate]
	@GLookupID numeric,
	@GLookupDesc varchar(100),
	@UpdatedBy varchar(50),
	@IsActive bit,
	@FlexField1 varchar(100)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
IF(@FlexField1 = 'StatusUpdate')
BEGIN
	UPDATE [dbo].[GLookup]
	   SET 
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [GLookupID] = @GLookupID
	
END
ELSE
BEGIN
	UPDATE [dbo].[GLookup]
	   SET 
		   [GLookupDesc] = @GLookupDesc,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [GLookupID] = @GLookupID
END
	 SELECT @GLookupID AS [GLookupID]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_GLookupSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GLookupSelect]
	@GLookupID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [GLookupID], [LookupCategoryID], [GLookupDesc], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[GLookup]
	 --WHERE  ([GLookupID] = @GLookupID OR @GLookupID IS NULL)
		WHERE  ([LookupCategoryID] = @GLookupID OR @GLookupID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_GLookupInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GLookupInsert]
	@LookupCategoryID numeric,
	@GLookupDesc varchar(100),
	@CreatedBy varchar(50),
	@IsActive bit
	--@Return_Value NUMERIC OUTPUT
	--@FlexField1 varchar(100),
	--@FlexField2 varchar(100),
	--@FlexField3 varchar(100)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

BEGIN
DECLARE @Return_Value NUMERIC

SET @Return_Value=0

IF (NOT EXISTS (SELECT * FROM [dbo].[GLookup] WHERE GLookupDesc = @GLookupDesc AND LookupCategoryID=@LookupCategoryID))
	BEGIN
	BEGIN TRAN

	INSERT INTO [dbo].[GLookup] (LookupCategoryID, GLookupDesc, CreatedBy,CreatedOn, IsActive)
		VALUES (@LookupCategoryID, @GLookupDesc, @CreatedBy,GETDATE(), @IsActive)

	SELECT @Return_Value = 1--SCOPE_IDENTITY()

	COMMIT;
	END
RETURN @Return_Value
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GLookupDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GLookupDelete]
	@GLookupID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[GLookup]
	 SET ISACTIVE=0 WHERE [GLookupID] = @GLookupID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_EmployeeStatusUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_EmployeeStatusUpdate]
	@EmployeeID numeric,
	@IsActive bit,
	@UpdatedBy nchar(10)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

			BEGIN
				UPDATE [dbo].[EmployeeMaster]
				SET [IsActive] = @IsActive,
					[UpdatedBy] = @UpdatedBy,
					[UpdatedOn] = GETDATE()
				WHERE [EmployeeId] = @EmployeeId
			END
	
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_EmployeeMasterSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_EmployeeMasterSelect]
	@EmployeeId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [EmployeeId], [UserId], [FirstName], [LastName], [MiddleName],[EmployeeCode], [Gender], [DOB], [DesignationId], [BUId], [LocationId], [DOJ], [LeavingDate], [Address1], [Address2], [Zip], [City], [State] StateId, gl.GLookupDesc CountryName,gl.GLookupDesc [State], [CountryId], [EmergencyContactName], [EmergencyContactPhone], EMP.[IsActive], EMP.[CreatedBy], EMP.[CreatedOn], EMP.[UpdatedBy], EMP.[UpdatedOn]
		--,(select GLookupDesc from GLookup where GLookupID=DesignationId) Desig
	  FROM [dbo].[EmployeeMaster] EMP
		left outer join GLookup GL on gl.GLookupID = emp.CountryId and gl.IsActive=1
		left outer join GLookup GL1 on gl1.GLookupID = [EMP].[State] and GL1.IsActive=1
	 WHERE  ([EmployeeId] = @EmployeeId OR @EmployeeId IS NULL or @EmployeeId = 0) order by EmployeeId

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_EmployeeMasterInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_EmployeeMasterInsertUpdate]
	@EmployeeID numeric,
	@UserId uniqueidentifier,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@MiddleName nvarchar(50),
	@EmployeeCode nvarchar(50),
	@Gender tinyint,
	@DOB datetime,
	@DesignationId numeric,
	@BUId numeric,
	@LocationId numeric,
	@DOJ datetime,
	@LeavingDate datetime,
	@Address1 nvarchar(50),
	@Address2 nvarchar(50),
	@Zip nvarchar(50),
	@City nchar(10),
	@State nvarchar(50),
	@CountryId numeric,
	@EmergencyContactName nvarchar(50),
	@EmergencyContactPhone nvarchar(50),
	@IsActive bit,
	@CreatedBy nchar(10)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	IF @EmployeeID > 0
		BEGIN
				UPDATE [dbo].[EmployeeMaster]
			   SET [FirstName] = @FirstName,
				   [LastName] = @LastName,
				   [MiddleName] = @MiddleName,
				   [Gender] = @Gender,
				   [DOB] = @DOB,
				   [DesignationId] = @DesignationId,
				   [BUId] = @BUId,
				   [LocationId] = @LocationId,
				   [DOJ] = @DOJ,
				   [EmployeeCode]=@EmployeeCode,
				   [LeavingDate] = @LeavingDate,
				   [Address1] = @Address1,
				   [Address2] = @Address2,
				   [Zip] = @Zip,
				   [City] = @City,
				   [State] = @State,
				   [CountryId] = @CountryId,
				   [EmergencyContactName] = @EmergencyContactName,
				   [EmergencyContactPhone] = @EmergencyContactPhone,
				   [IsActive] = @IsActive,
				   [UpdatedBy] = @CreatedBy,
				   [UpdatedOn] = GETDATE()
			 WHERE [EmployeeId] = @EmployeeId
			
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[EmployeeMaster] (UserId, FirstName, LastName, MiddleName,EmployeeCode, Gender, DOB, DesignationId, BUId, LocationId, DOJ, LeavingDate, Address1, Address2, City, [State], CountryId,Zip, EmergencyContactName, EmergencyContactPhone, IsActive, CreatedBy, CreatedOn)
		VALUES (@UserId, @FirstName, @LastName, @MiddleName,@EmployeeCode, @Gender, @DOB, @DesignationId, @BUId, @LocationId, @DOJ, @LeavingDate, @Address1, @Address2, @City, @State, @CountryId,@Zip, @EmergencyContactName, @EmergencyContactPhone, @IsActive, @CreatedBy, GETDATE())
		END
		--SELECT [EmployeeId] 
		--FROM [dbo].[EmployeeMaster]
		--WHERE [EmployeeId] = SCOPE_IDENTITY()

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_EmployeeMasterDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_EmployeeMasterDelete]
	@EmployeeId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[EmployeeMaster]
	 SET ISACTIVE=0 WHERE [EmployeeId] = @EmployeeId

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_ChargeCodeMasterUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ChargeCodeMasterUpdate]
	@BuId numeric,
	@ChargeCodeID numeric,
	@ChargeCode varchar(10),
	@ChargeCodeDesc varchar(50),
	@GroupDriven bit,
	@UnitDriven bit,
	@AdhocValue bit,
	@IsInsurance bit,
	@IsRental bit,
	@IsNonRental bit,
	@IsTrafficViolation bit,
	@IsOtherCompliance bit,
	@IsVasWhileRenting bit,
	@IsVasWhileClosing bit,
	@IsOtherVas bit,
	@ServiceChargeApplicable bit,
	@ServiceChargeType varchar(1),
	@ServiceCharge numeric,
	@IsDeductible bit,
	@IsDeductibleWaiver bit,
	@WaivingPercentage numeric,
	@IsSecured bit,
	@UpdatedBy varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[ChargeCodeMaster]
	   SET [BuId] = @BuId,
		   [ChargeCode] = @ChargeCode,
		   [ChargeCodeDesc] = @ChargeCodeDesc,
		   [GroupDriven] = @GroupDriven,
		   [UnitDriven] = @UnitDriven,
		   [AdhocValue] = @AdhocValue,
		   [IsInsurance] = @IsInsurance,
		   [IsRental] = @IsRental,
		   [IsNonRental] = @IsNonRental,
		   [IsTrafficViolation] = @IsTrafficViolation,
		   [IsOtherCompliance] = @IsOtherCompliance,
		   [IsVasWhileRenting] = @IsVasWhileRenting,
		   [IsVasWhileClosing] = @IsVasWhileClosing,
		   [IsOtherVas] = @IsOtherVas,
		   [ServiceChargeApplicable] = @ServiceChargeApplicable,
		   [ServiceChargeType] = @ServiceChargeType,
		   [ServiceCharge] = @ServiceCharge,
		   [IsDeductible] = @IsDeductible,
		   [IsDeductibleWaiver] = @IsDeductibleWaiver,
		   [WaivingPercentage] = @WaivingPercentage,
		   [IsSecured] = @IsSecured,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UpdatedBy,
		   [IsActive] = @IsActive
	 WHERE [ChargeCodeID] = @ChargeCodeID

	 SELECT @ChargeCodeID AS [ChargeCodeID]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_ChargeCodeMasterSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ChargeCodeMasterSelect]
	@ChargeCodeID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [BuId], [ChargeCodeID], [ChargeCode], [ChargeCodeDesc], [GroupDriven], [UnitDriven], [AdhocValue], [IsInsurance], [IsRental], [IsNonRental], [IsTrafficViolation], [IsOtherCompliance], [IsVasWhileRenting], [IsVasWhileClosing], [IsOtherVas], [ServiceChargeApplicable], [ServiceChargeType], [ServiceCharge], [IsDeductible], [IsDeductibleWaiver], [WaivingPercentage], [IsSecured], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive]
	  FROM [dbo].[ChargeCodeMaster]
	 WHERE  ([ChargeCodeID] = @ChargeCodeID OR @ChargeCodeID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_ChargeCodeMasterInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ChargeCodeMasterInsert]
	@BuId numeric,
	@ChargeCode varchar(10),
	@ChargeCodeDesc varchar(50),
	@GroupDriven bit,
	@UnitDriven bit,
	@AdhocValue bit,
	@IsInsurance bit,
	@IsRental bit,
	@IsNonRental bit,
	@IsTrafficViolation bit,
	@IsOtherCompliance bit,
	@IsVasWhileRenting bit,
	@IsVasWhileClosing bit,
	@IsOtherVas bit,
	@ServiceChargeApplicable bit,
	@ServiceChargeType varchar(1),
	@ServiceCharge numeric,
	@IsDeductible bit,
	@IsDeductibleWaiver bit,
	@WaivingPercentage numeric,
	@IsSecured bit,
	@CreatedBy varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

BEGIN
DECLARE @Return_Value NUMERIC

SET @Return_Value=0

IF (NOT EXISTS (SELECT * FROM [dbo].[ChargeCodeMaster] WHERE ChargeCode = @ChargeCode))
	BEGIN
	
	BEGIN TRAN

	INSERT INTO [dbo].[ChargeCodeMaster] (BuId, ChargeCode, ChargeCodeDesc, GroupDriven, UnitDriven, AdhocValue, IsInsurance, IsRental, IsNonRental, IsTrafficViolation, IsOtherCompliance, IsVasWhileRenting, IsVasWhileClosing, IsOtherVas, ServiceChargeApplicable, ServiceChargeType, ServiceCharge, IsDeductible, IsDeductibleWaiver, WaivingPercentage, IsSecured, CreatedBy,CreatedOn, IsActive)
	VALUES (@BuId, @ChargeCode, @ChargeCodeDesc, @GroupDriven, @UnitDriven, @AdhocValue, @IsInsurance, @IsRental, @IsNonRental, @IsTrafficViolation, @IsOtherCompliance, @IsVasWhileRenting, @IsVasWhileClosing, @IsOtherVas, @ServiceChargeApplicable, @ServiceChargeType, @ServiceCharge, @IsDeductible, @IsDeductibleWaiver, @WaivingPercentage, @IsSecured, @CreatedBy,GETDATE(), @IsActive)

	SELECT [ChargeCodeID] 
		FROM [dbo].[ChargeCodeMaster]
		WHERE [ChargeCodeID] = SCOPE_IDENTITY()

	SET @Return_Value=1
	
	COMMIT;
	END
	
return @Return_Value

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ChargeCodeMasterDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ChargeCodeMasterDelete]
	@ChargeCodeID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[ChargeCodeMaster]
	 SET ISACTIVE=0 WHERE [ChargeCodeID] = @ChargeCodeID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessUnitsUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BusinessUnitsUpdate]
	@BuId numeric,
	--@OrgId numeric,
	@BuCode varchar(10),
	@BUName varchar(100),
	@BuAddress1 varchar(50),
	@BuAddress2 varchar(50),
	@BuAddress3 varchar(50),
	@BuPostBox varchar(10),
	@BuPhoneNo varchar(10),
	@BuFax varchar(10),
	@BuEmailId varchar(10),
	@BuMobile varchar(10),
	@BuZip varchar(10),
	@BuContactPerson varchar(10),
	@BuBaseCurrency numeric,
	@BuDecimals tinyint,
	@UpdatedBy varchar(50),
	@IsActive bit
	--@FlexField1 varchar(100),
	--@FlexField2 varchar(100),
	--@FlexField3 varchar(100)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[BusinessUnits]
	   SET --[OrgId] = @OrgId,
		   [BuCode] = @BuCode,
		   [BUName] = @BUName,
		   [BuAddress1] = @BuAddress1,
		   [BuAddress2] = @BuAddress2,
		   [BuAddress3] = @BuAddress3,
		   [BuPostBox] = @BuPostBox,
		   [BuPhoneNo] = @BuPhoneNo,
		   [BuFax] = @BuFax,
		   [BuEmailId] = @BuEmailId,
		   [BuMobile] = @BuMobile,
		   [BuZip] = @BuZip,
		   [BuContactPerson] = @BuContactPerson,
		   [BuBaseCurrency] = @BuBaseCurrency,
		   [BuDecimals] = @BuDecimals,
		   [UpdatedBy] = @UpdatedBy,
		   [UpdatedOn] = GETDATE(),
		   [IsActive] = @IsActive
		   --[FlexField1] = @FlexField1,
		   --[FlexField2] = @FlexField2,
		   --[FlexField3] = @FlexField3
	 WHERE [BuId] = @BuId

	 SELECT @BuId AS [BuId]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessUnitsSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BusinessUnitsSelect]
	--@BuId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [BuId], [OrgId], [BuCode], [BUName], [BuAddress1], [BuAddress2], [BuAddress3], [BuPostBox], [BuPhoneNo], [BuFax], [BuEmailId], [BuMobile], [BuZip], [BuContactPerson], [BuBaseCurrency], [BuDecimals], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]
	  FROM [dbo].[BusinessUnits]
	-- WHERE  ([BuId] = @BuId OR @BuId IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessUnitsInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BusinessUnitsInsert]
	@OrgId numeric,
	@BuCode varchar(10),
	@BUName varchar(100),
	@BuAddress1 varchar(50),
	@BuAddress2 varchar(50),
	@BuAddress3 varchar(50),
	@BuPostBox varchar(10),
	@BuPhoneNo varchar(10),
	@BuFax varchar(10),
	@BuEmailId varchar(10),
	@BuMobile varchar(10),
	@BuZip varchar(10),
	@BuContactPerson varchar(10),
	@BuBaseCurrency numeric,
	@BuDecimals tinyint,
	@CreatedBy varchar(50),
	@IsActive bit
	--@FlexField1 varchar(100),
	--@FlexField2 varchar(100),
	--@FlexField3 varchar(100)
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	INSERT INTO [dbo].[BusinessUnits] (OrgId, BuCode, BUName, BuAddress1, BuAddress2, BuAddress3, BuPostBox, BuPhoneNo, BuFax, BuEmailId, BuMobile, BuZip, BuContactPerson, BuBaseCurrency, BuDecimals, CreatedBy, IsActive)
	VALUES (@OrgId, @BuCode, @BUName, @BuAddress1, @BuAddress2, @BuAddress3, @BuPostBox, @BuPhoneNo, @BuFax, @BuEmailId, @BuMobile, @BuZip, @BuContactPerson, @BuBaseCurrency, @BuDecimals, @CreatedBy, @IsActive)

	SELECT [BuId] 
	FROM [dbo].[BusinessUnits]
	WHERE [BuId] = SCOPE_IDENTITY()

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessUnitsDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BusinessUnitsDelete]
	@BuId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[BusinessUnits]
	 SET ISACTIVE=0 WHERE [BuId] = @BuId

	COMMIT;
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'0ab2d553-062b-4196-91b4-1d243a536da6', N'dc068813-990d-4bd6-b450-61b35ab9075c', N'siva', N'ss', N'siva', 0, CAST(0x0000A22B013441B5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'e8a2e4cb-3d1b-42f9-a318-c20a67df97d4', N'Admin', N'Admin', NULL, 0, CAST(0x0000A4030126218B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'3f9368b6-1d8a-475e-ba4d-0322eea0bfca', N'siva1', N'siva1', NULL, 0, CAST(0x0000A31101228AE8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'a47e2b08-a6fc-4ccb-afd4-5519000215f8', N'shell', N'shell', NULL, 0, CAST(0x0000A314010C38D8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'75fc9360-2e16-4423-9568-0597ea256fb4', N'Shell1', N'shell1', NULL, 0, CAST(0x0000A314012ABEE8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'7efade21-d1f0-444c-90c2-ebc4795f4e30', N'siva', N'siva', NULL, 0, CAST(0x0000A3100071541C AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[CreatedBy] [nchar](10) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nchar](10) NULL,
	[UndatedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsActivated] [bit] NULL,
 CONSTRAINT [PK__aspnet_R__8AFACE1B4222D4EF] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'2dc4f1a5-ad1b-47ad-b030-af06d890cf9e', N'Lead', N'Lead', N'Lead', N'1         ', CAST(0x0000A316014CC9E5 AS DateTime), N'1         ', CAST(0x0000A3A501136BAC AS DateTime), 1, 1)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'09cc511b-708e-4444-9ef1-684e0937433d', N'Accountant', N'Accountant', N'Accountant', N'1         ', CAST(0x0000A316014E00E8 AS DateTime), N'1         ', CAST(0x0000A316017038AD AS DateTime), 0, 0)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'49b859aa-f831-475b-bbf9-2fc359503b7e', N'Manager', N'Manager', N'Manager', N'1         ', CAST(0x0000A316014FE438 AS DateTime), N'1         ', CAST(0x0000A3A501136F24 AS DateTime), 1, 0)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'38a21608-58aa-4da5-9785-418f88e24aae', N'Branch Manager', N'Branch Manager', N'Branch Manager', N'1         ', CAST(0x0000A3160174638D AS DateTime), N'1         ', CAST(0x0000A3160174638D AS DateTime), 1, 1)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'7951d515-5262-4503-8597-49d6c1a4aa41', N'Counter Supervisor', N'Counter Supervisor', N'Counter Supervisor', N'1         ', CAST(0x0000A31601746390 AS DateTime), N'1         ', CAST(0x0000A31601746390 AS DateTime), 1, 1)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'48af9845-2794-404e-9742-9fd4ca546951', N'Accountant', N'Accountant', N'Accountant', N'1         ', CAST(0x0000A31601746393 AS DateTime), N'1         ', CAST(0x0000A31601746393 AS DateTime), 1, 1)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn], [IsActive], [IsActivated]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'aea71fee-0630-4c94-b04d-5682f0ebd530', N'Application Administrator', N'Application Administrator', N'Application Administrator', N'1         ', CAST(0x0000A3160174639E AS DateTime), N'1         ', CAST(0x0000A3160174639E AS DateTime), 1, 1)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleServiceSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleServiceSelect]
	@VehicleID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [ServiceID], [VehicleID], [WarrantlyKM], [WarrantyUpto], [ServiceWithin], [ServiceContract], [AgencyID], [LastServiceDate], [NextServiceDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[VehicleService]
	 WHERE  ([VehicleID] = @VehicleID OR @VehicleID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleServiceInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_VehicleServiceInsertUpdate]
	@VehicleID numeric,
	@ServiceID numeric,
	@WarrantlyKM numeric,
	@WarrantyUpto date,
	@ServiceWithin smallint,
	@ServiceContract bit,
	@AgencyID varchar(100),
	@LastServiceDate date,
	@NextServiceDate date,
	@UserId varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

IF @VehicleID > 0

BEGIN
UPDATE [SteerRent].[dbo].[VehicleService]
   SET [VehicleID] = @VehicleID
      ,[WarrantlyKM] = @WarrantlyKM
      ,[WarrantyUpto] = @WarrantyUpto
      ,[ServiceWithin] = @ServiceWithin
      ,[ServiceContract] = @ServiceContract
      ,[AgencyID] = @AgencyID
      ,[LastServiceDate] = @LastServiceDate
      ,[NextServiceDate] = @NextServiceDate
      ,[UpdatedOn] = GETDATE()
      ,[UpdatedBy] = @UserId
      ,[IsActive] = @IsActive
 WHERE ServiceID = @ServiceID
END
ELSE
BEGIN
	INSERT INTO [dbo].[VehicleService] (ServiceID, WarrantlyKM, WarrantyUpto, ServiceWithin, ServiceContract, AgencyID, LastServiceDate, NextServiceDate, CreatedOn, CreatedBy, IsActive)
	VALUES (@ServiceID, @WarrantlyKM, @WarrantyUpto, @ServiceWithin, @ServiceContract, @AgencyID, @LastServiceDate, @NextServiceDate,GETDATE(), @UserId, @IsActive)

	SELECT [VehicleID] 
	FROM [dbo].[VehicleService]
	WHERE [VehicleID] = SCOPE_IDENTITY()
END
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleServiceDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleServiceDelete]
	@VehicleID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[VehicleService]
	 SET ISACTIVE=0 WHERE [VehicleID] = @VehicleID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleRegistrationSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleRegistrationSelect]
	@RegId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [RegId], [VehicleID], [RegNo], [RegCountryID], [RegStateID], [RegDate], [RegExpiry], [RegCost], [RegPlateCodeID], [RegPlateColorID], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[VehicleRegistration]
	 WHERE  ([RegId] = @RegId OR @RegId IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleRegistrationInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_VehicleRegistrationInsertUpdate]
	@RegId numeric,
	@VehicleID numeric,
	@RegNo smallint,
	@RegCountryID numeric,
	@RegStateID numeric,
	@RegDate date,
	@RegExpiry date,
	@RegCost numeric,
	@RegPlateCodeID numeric,
	@RegPlateColorID numeric,
	@UserId varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
IF @RegId > 0
BEGIN
	UPDATE [dbo].[VehicleRegistration]
	   SET [VehicleID] = @VehicleID,
		   [RegNo] = @RegNo,
		   [RegCountryID] = @RegCountryID,
		   [RegStateID] = @RegStateID,
		   [RegDate] = @RegDate,
		   [RegExpiry] = @RegExpiry,
		   [RegCost] = @RegCost,
		   [RegPlateCodeID] = @RegPlateCodeID,
		   [RegPlateColorID] = @RegPlateColorID,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UserId,
		   [IsActive] = @IsActive
	 WHERE [RegId] = @RegId
END
ELSe
BEGIN
	INSERT INTO [dbo].[VehicleRegistration] (VehicleID, RegNo, RegCountryID, RegStateID, RegDate, RegExpiry, RegCost, RegPlateCodeID, RegPlateColorID,CreatedOn, CreatedBy, IsActive)
	VALUES (@VehicleID, @RegNo, @RegCountryID, @RegStateID, @RegDate, @RegExpiry, @RegCost, @RegPlateCodeID, @RegPlateColorID,GETDATE(), @UserId, @IsActive)

	SELECT [RegId] 
	FROM [dbo].[VehicleRegistration]
	WHERE [RegId] = SCOPE_IDENTITY()
END
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleRegistrationDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleRegistrationDelete]
	@RegId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[VehicleRegistration]
	 SET ISACTIVE=0 WHERE [RegId] = @RegId

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehiclePurchaseSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehiclePurchaseSelect]
	@VehicleID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [PurchaseID], [VehicleID], [PurchaseDate], [DeliveryDate], [SupplierID], [PONumber], [POValue], [TradeLicenseID], [BuyBack], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[VehiclePurchase]
	 WHERE  ([VehicleID] = @VehicleID OR @VehicleID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehiclePurchaseInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehiclePurchaseInsertUpdate]
	@PurchaseID numeric,
	@PurchaseDate date,
	@DeliveryDate date,
	@SupplierID numeric,
	@PONumber varchar(50),
	@POValue numeric,
	@TradeLicenseID numeric,
	@BuyBack bigint,
	@UserId varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
	IF @PurchaseID > 0
	BEGIN
		UPDATE [SteerRent].[dbo].[VehiclePurchase]
	   SET [PurchaseDate] = @PurchaseDate
		  ,[DeliveryDate] = @DeliveryDate
		  ,[SupplierID] = @SupplierID
		  ,[PONumber] = @PONumber
		  ,[POValue] = @POValue
		  ,[TradeLicenseID] = @TradeLicenseID
		  ,[BuyBack] = @BuyBack
		  ,[UpdatedOn] = GETDATE()
		  ,[UpdatedBy] = @UserId
		  ,[IsActive] = @IsActive
		WHERE PurchaseID = @PurchaseID
		
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[VehiclePurchase] (PurchaseDate, DeliveryDate, SupplierID, PONumber, POValue, TradeLicenseID, BuyBack, CreatedOn, CreatedBy, IsActive)
		VALUES (@PurchaseDate, @DeliveryDate, @SupplierID, @PONumber, @POValue, @TradeLicenseID, @BuyBack,GETDATE(), @UserId, @IsActive)

		--SELECT [VehicleID] 
		--	FROM [dbo].[VehiclePurchase]
		--	WHERE [VehicleID] = SCOPE_IDENTITY()
	END
	
COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehiclePurchaseDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehiclePurchaseDelete]
	@VehicleID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[VehiclePurchase]
	 SET ISACTIVE=0 WHERE [VehicleID] = @VehicleID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleMasterSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleMasterSelect]
	@BuId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [VehicleID], [VehicleCode], [BuId], [UsageType], [InductingLocationID], [CurrentLocationID], [StatusID], [GroupID], [SubGroupID], [MakeID], [BrandID], [YearModel], [VehicleTypeID], [VehicleSubTypeID], [TransmissionTypeID], [AC], [EngineCapacityID], [VehicleClass], [SeatingCapacity], [ColorID], [SubColorID], [FuelTypeID], [FuelTankSize], [FlaggedForSale], [MarkedForSale], [IsAvailableForRenting], [NoOfKeys], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[VehicleMaster]
	 WHERE  ([BuId] = @BuId OR @BuId IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleMasterInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_VehicleMasterInsertUpdate]
	@VehicleID numeric,
	@VehicleCode numeric,
	@BuId numeric,
	@UsageType numeric,
	@InductingLocationID numeric,
	@CurrentLocationID numeric,
	@StatusID numeric,
	@GroupID numeric,
	@SubGroupID numeric,
	@MakeID numeric,
	@BrandID numeric,
	@YearModel numeric,
	@VehicleTypeID numeric,
	@VehicleSubTypeID numeric,
	@TransmissionTypeID numeric,
	@AC bit,
	@EngineCapacityID numeric,
	@VehicleClass nchar(10),
	@SeatingCapacity smallint,
	@ColorID numeric,
	@SubColorID numeric,
	@FuelTypeID numeric,
	@FuelTankSize numeric,
	@FlaggedForSale bit,
	@MarkedForSale bit,
	@IsAvailableForRenting bit,
	@NoOfKeys tinyint,
	@UserId varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

IF @VehicleID > 0
BEGIN
	UPDATE [SteerRent].[dbo].[VehicleMaster]
   SET [VehicleCode] = @VehicleCode,
      [BuId] = @BuId,
      [UsageType] = @UsageType,
      [InductingLocationID] = @InductingLocationID,
      [CurrentLocationID] = @CurrentLocationID,
      [StatusID] = @StatusID,
      [GroupID] = @GroupID,
      [SubGroupID] = @SubGroupID,
      [MakeID] = @MakeID,
      [BrandID] = @BrandID,
      [YearModel] = @YearModel,
      [VehicleTypeID] = @VehicleTypeID,
      [VehicleSubTypeID] = @VehicleSubTypeID,
      [TransmissionTypeID] = @TransmissionTypeID,
      [AC] = @AC,
      [EngineCapacityID] = @EngineCapacityID,
      [VehicleClass] = @VehicleClass,
      [SeatingCapacity] = @SeatingCapacity,
      [ColorID] = @ColorID,
      [SubColorID] = @SubColorID,
      [FuelTypeID] = @FuelTypeID,
      [FuelTankSize] = @FuelTankSize,
      [FlaggedForSale] = @FlaggedForSale,
      [MarkedForSale] = @MarkedForSale,
      [IsAvailableForRenting] = @IsAvailableForRenting,
      [NoOfKeys] = @NoOfKeys,
      [UpdatedOn] = GETDATE(),
      [UpdatedBy] = @UserId,
      [IsActive] = @IsActive
   
 WHERE VehicleID = @VehicleID
END
ELSE
BEGIN
	INSERT INTO [dbo].[VehicleMaster] (VehicleID, VehicleCode, UsageType, InductingLocationID, CurrentLocationID, StatusID, GroupID, SubGroupID, MakeID, BrandID, YearModel, VehicleTypeID, VehicleSubTypeID, TransmissionTypeID, AC, EngineCapacityID, VehicleClass, SeatingCapacity, ColorID, SubColorID, FuelTypeID, FuelTankSize, FlaggedForSale, MarkedForSale, IsAvailableForRenting, NoOfKeys,CreatedOn, CreatedBy, IsActive)
	VALUES (@VehicleID, @VehicleCode, @UsageType, @InductingLocationID, @CurrentLocationID, @StatusID, @GroupID, @SubGroupID, @MakeID, @BrandID, @YearModel, @VehicleTypeID, @VehicleSubTypeID, @TransmissionTypeID, @AC, @EngineCapacityID, @VehicleClass, @SeatingCapacity, @ColorID, @SubColorID, @FuelTypeID, @FuelTankSize, @FlaggedForSale, @MarkedForSale, @IsAvailableForRenting, @NoOfKeys,GETDATE(), @UserId, @IsActive)

	SELECT [BuId] 
	FROM [dbo].[VehicleMaster]
	WHERE [BuId] = SCOPE_IDENTITY()
END
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleMasterDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleMasterDelete]
	@BuId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[VehicleMaster]
	 SET ISACTIVE=0 WHERE [BuId] = @BuId

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleInsuranceSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleInsuranceSelect]
	@InsID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [InsID], [VehicleID], [InsTypeID], [InsCompanyID], [InsPolicyNo], [InsCost], [InsStart], [InsExpiry], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsActive], [FlexField1], [FlexField2], [FlexField3]
	  FROM [dbo].[VehicleInsurance]
	 WHERE  ([InsID] = @InsID OR @InsID IS NULL)

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleInsuranceInsertUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_VehicleInsuranceInsertUpdate]
	@InsID numeric,
	@VehicleID numeric,
	@InsTypeID numeric,
	@InsCompanyID nchar(10),
	@InsPolicyNo varchar(50),
	@InsCost numeric,
	@InsStart date,
	@InsExpiry date,
	@UserId varchar(50),
	@IsActive bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

IF @InsID > 0
BEGIN
UPDATE [dbo].[VehicleInsurance]
	   SET [VehicleID] = @VehicleID,
		   [InsTypeID] = @InsTypeID,
		   [InsCompanyID] = @InsCompanyID,
		   [InsPolicyNo] = @InsPolicyNo,
		   [InsCost] = @InsCost,
		   [InsStart] = @InsStart,
		   [InsExpiry] = @InsExpiry,
		   [UpdatedOn] = GETDATE(),
		   [UpdatedBy] = @UserId,
		   [IsActive] = @IsActive
	 WHERE [InsID] = @InsID
END
ELSE
BEGIN
	INSERT INTO [dbo].[VehicleInsurance] (VehicleID, InsTypeID, InsCompanyID, InsPolicyNo, InsCost, InsStart, InsExpiry,CreatedOn, CreatedBy, IsActive)
	VALUES (@VehicleID, @InsTypeID, @InsCompanyID, @InsPolicyNo, @InsCost, @InsStart, @InsExpiry, GETDATE(), @UserId, @IsActive)

	SELECT [InsID] 
	FROM [dbo].[VehicleInsurance]
	WHERE [InsID] = SCOPE_IDENTITY()
END
	 
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_VehicleInsuranceDelete]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_VehicleInsuranceDelete]
	@InsID numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[VehicleInsurance]
	 SET ISACTIVE=0 WHERE [InsID] = @InsID

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_SubcategoryByCategoryId]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_SubcategoryByCategoryId]
	@GLookupId numeric
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN
SELECT [HLookupID]
      ,[GlookupID]
      ,[LookupCategoryID]
      ,[HLookupCode]
      ,[HLookupDesc]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[UpdatedOn]
      ,[UpdatedBy]
      ,[IsActive]
      ,[FlexField1]
      ,[FlexField2]
      ,[FlexField3]
  FROM [HLookup]
	WHERE GlookupID = @GLookupId and IsActive = 1

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_RoleXPage_Insert_Update]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_RoleXPage_Insert_Update]
	@RoleId uniqueidentifier,
	@PageId int,
	@IsDelete bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN

	BEGIN TRAN

IF (NOT EXISTS (SELECT * FROM [RoleXPage] WHERE RoleId = @RoleId and PageId = @PageId) and @IsDelete=1)
BEGIN
	INSERT INTO [RoleXPage](RoleId,PageId) values (@RoleId,@PageId)
END
ELSE IF(@IsDelete = 0)
BEGIN
	DELETE FROM [dbo].[RoleXPage] WHERE RoleId = @RoleId and PageId = @PageId
END
	 SELECT @RoleId AS [RoleId]

	COMMIT;
	
END
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'8510160d-1d8f-4627-9529-323a1f200cc6', N'00c90617-dec1-4203-bac2-f3411106b0b4', N'Admin', NULL)
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'c93d0ecc-cce9-4282-9354-75b97957a653', N'00c90617-dec1-4203-bac2-f3411106b0b4', N'Accountant', NULL)
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'bf20420f-4775-477a-9ac6-8139fcd6ee07', N'ee2864ab-4a4a-42dd-959c-07dc5d5a42a2', N'Admin', NULL)
/****** Object:  Table [dbo].[Profiles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](max) NOT NULL,
	[PropertyValueStrings] [nvarchar](max) NOT NULL,
	[PropertyValueBinary] [varbinary](max) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_PrivilegesSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PrivilegesSelect]
	@RoleId uniqueidentifier
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	declare @whereClause varchar(150)
	SELECT @whereClause=RoleName from dbo.aspnet_Roles where RoleId=@RoleId
	
	BEGIN TRAN
	IF(@whereClause = 'Admin')
	BEGIN
			SELECT PM.PAGEID,PM.PAGECODE, PM.PAGENAME,PM.PAGEDETAILS,MM.MODULENAME,isnull(RP.ROLEID,NEWID()) ROLEID, CASE when rp.RoleId IS null then 0 else 1 end as ISACTIVE FROM PAGEMASTER PM 
			INNER JOIN MODULEMASTER MM ON PM.MODULEID = MM.MODULEID 
			left outer JOIN ROLEXPAGE RP ON RP.PAGEID = PM.PAGEID  and RoleId=@RoleId
			where ModuleName in('Administrator','Fleet Management')
	END
	else
	BEGIN
			SELECT PM.PAGEID,PM.PAGECODE, PM.PAGENAME,PM.PAGEDETAILS,MM.MODULENAME,isnull(RP.ROLEID,NEWID()) ROLEID, CASE when rp.RoleId IS null then 0 else 1 end as ISACTIVE FROM PAGEMASTER PM 
			INNER JOIN MODULEMASTER MM ON PM.MODULEID = MM.MODULEID 
			left outer JOIN ROLEXPAGE RP ON RP.PAGEID = PM.PAGEID and RoleId=@RoleId
			where ModuleName in('Fleet Management')
			--left outer join aspnet_Roles RL oN rl.RoleId = Rp.RoleId
	END

	COMMIT;
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'0ab2d553-062b-4196-91b4-1d243a536da6', N'dc068813-990d-4bd6-b450-61b35ab9075c', N'indian', 1, N'ss', N'1', N'ss@steerrent.com', N'ss@steerrent.com', N'nickname', N'sunsiva', 1, 0, CAST(0x0000A22B01889A49 AS DateTime), CAST(0x0000A22B013441B5 AS DateTime), CAST(0x0000A22B01889A49 AS DateTime), CAST(0x0000A22B01889A49 AS DateTime), 0, CAST(0x0000A22B01889A49 AS DateTime), 0, CAST(0x0000A22B01889A49 AS DateTime), N'test')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'e8a2e4cb-3d1b-42f9-a318-c20a67df97d4', N'19LvksFCL24+gs6CdOQMxEa2Eeo=', 1, N'SvaSuhQ2UB2H4aqIs3kzmQ==', NULL, N'siva1@gmail.com', N'siva1@gmail.com', N'Q', N'4W0lkcAmW41yUE3lXnYj1vU/1Ss=', 1, 0, CAST(0x0000A28501388C1C AS DateTime), CAST(0x0000A4030126218B AS DateTime), CAST(0x0000A28E006C79A2 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'7efade21-d1f0-444c-90c2-ebc4795f4e30', N'yrrjoLhfq6RmqpVIuDxLsJsSoYs=', 1, N'6VQWDCOLdy05A074x2z3RQ==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A3100071541C AS DateTime), CAST(0x0000A3100071541C AS DateTime), CAST(0x0000A3100071541C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'3f9368b6-1d8a-475e-ba4d-0322eea0bfca', N't/yAKlPti3k54F8VCVtvtwV6PUE=', 1, N'VXbFhp8V+mrHd5z0bT47eQ==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A31101228AE8 AS DateTime), CAST(0x0000A31101228AE8 AS DateTime), CAST(0x0000A31101228AE8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'a47e2b08-a6fc-4ccb-afd4-5519000215f8', N'3aPiJuP+/q9ULbK/FLH0124ygZ4=', 1, N'669sXYoG5x3BsNHIa/AHXA==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A314010C38D8 AS DateTime), CAST(0x0000A314010C38D8 AS DateTime), CAST(0x0000A314010C38D8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'6159d74d-59df-424b-ba05-acf86980189c', N'75fc9360-2e16-4423-9568-0597ea256fb4', N'EMggU7gHOFnwqjDzS3JwfAnKXPA=', 1, N'khyjCyMhqcBhG12EoFKWFQ==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A314012ABEE8 AS DateTime), CAST(0x0000A314012ABEE8 AS DateTime), CAST(0x0000A314012ABEE8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_aspnet_RolesUpdate]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_aspnet_RolesUpdate]
	@RoleId uniqueidentifier,
	@RoleName nvarchar(256),
	@LoweredRoleName nvarchar(256),
	@Description nvarchar(256),
	@UserId nchar(10),
	@IsActive bit,
	@IsActivated bit
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE [dbo].[aspnet_Roles]
	   SET 
		   [UpdatedBy] = @UserId,
		   [UndatedOn] = GETDATE(),
		   [IsActive] = @IsActive,
		   IsActivated = @IsActivated
		   
	 WHERE [RoleId] = @RoleId

	 SELECT @RoleId AS [RoleId]

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_aspnet_RolesSelect]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_aspnet_RolesSelect]
	@RoleId uniqueidentifier
AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT [ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UndatedOn],[IsActive],IsActivated
	  FROM [dbo].[aspnet_Roles] where IsActive = 1
	 --WHERE  ([RoleId] = @RoleId OR @RoleId IS NULL)09cc511b-708e-4444-9ef1-684e0937433d

	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[usp_aspnet_RolesInsert]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_aspnet_RolesInsert]
           @RoleName nvarchar(256),
           @LoweredRoleName nvarchar(256),
           @Description nvarchar(256),
           @CreatedBy nchar(10),
           @IsActive bit

AS 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    
    DECLARE @Return_Value NUMERIC

	SET @Return_Value=0

IF (NOT EXISTS (SELECT * FROM [dbo].[aspnet_Roles] WHERE [RoleName] = @RoleName))
BEGIN
    
    SET @ApplicationId =(SELECT TOP 1 APPLICATIONID FROM DBO.ASPNET_APPLICATIONS	ORDER BY APPLICATIONNAME ASC)
	
BEGIN TRAN
		
INSERT INTO [dbo].[aspnet_Roles]
           (ApplicationId
           ,[RoleName]
           ,[LoweredRoleName]
           ,[Description]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[IsActive]
           ,IsActivated)
     VALUES
           (@Applicationid,
           @RoleName,
           @LoweredRoleName,
           @Description,
           @CreatedBy,
           GETDATE(),
           @IsActive,
           0)

	COMMIT;
	SET @Return_Value=1
END

return @Return_Value
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[GET_USERS_REPORT]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_USERS_REPORT]

AS 
	SET NOCOUNT ON;
	
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT u.UserName, m.Email, m.Comment
	
		FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.UserId = m.UserId
	  
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[GET_ROLES_REPORT]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[GET_ROLES_REPORT]

AS 
	SET NOCOUNT ON;
	
	SET XACT_ABORT ON;

	BEGIN TRAN

	SELECT u.UserName, m.Email, m.Comment
	
		FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.UserId = m.UserId
	  
	COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 02/05/2016 09:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 02/05/2016 09:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Default [DF__webpages___IsCon__0DCF0841]    Script Date: 02/05/2016 09:15:44 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
/****** Object:  Default [DF__webpages___Passw__0EC32C7A]    Script Date: 02/05/2016 09:15:44 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
/****** Object:  Default [DF_VehicleService_ServiceContract]    Script Date: 02/05/2016 09:15:44 ******/
ALTER TABLE [dbo].[VehicleService] ADD  CONSTRAINT [DF_VehicleService_ServiceContract]  DEFAULT ((0)) FOR [ServiceContract]
GO
/****** Object:  Default [DF_VehiclePurchase_BuyBack]    Script Date: 02/05/2016 09:15:44 ******/
ALTER TABLE [dbo].[VehiclePurchase] ADD  CONSTRAINT [DF_VehiclePurchase_BuyBack]  DEFAULT ((0)) FOR [BuyBack]
GO
/****** Object:  Default [DF_VehicleMaster_AC]    Script Date: 02/05/2016 09:15:44 ******/
ALTER TABLE [dbo].[VehicleMaster] ADD  CONSTRAINT [DF_VehicleMaster_AC]  DEFAULT ((1)) FOR [AC]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__76619304]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF_EmployeeMaster_Gender]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_Gender]  DEFAULT ((1)) FOR [Gender]
GO
/****** Object:  Default [DF_ChargeCodeMaster_GroupDriven]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_GroupDriven]  DEFAULT ((0)) FOR [GroupDriven]
GO
/****** Object:  Default [DF_ChargeCodeMaster_UnitDriven]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_UnitDriven]  DEFAULT ((0)) FOR [UnitDriven]
GO
/****** Object:  Default [DF_ChargeCodeMaster_AdhocValue]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_AdhocValue]  DEFAULT ((0)) FOR [AdhocValue]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsInsurance]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsInsurance]  DEFAULT ((0)) FOR [IsInsurance]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsRental]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsRental]  DEFAULT ((0)) FOR [IsRental]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsNonRental]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsNonRental]  DEFAULT ((0)) FOR [IsNonRental]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsTrafficViolation]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsTrafficViolation]  DEFAULT ((0)) FOR [IsTrafficViolation]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsOtherCompliance]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsOtherCompliance]  DEFAULT ((0)) FOR [IsOtherCompliance]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsVasWhileRenting]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsVasWhileRenting]  DEFAULT ((0)) FOR [IsVasWhileRenting]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsVasWhileClosing]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsVasWhileClosing]  DEFAULT ((0)) FOR [IsVasWhileClosing]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsOtherVas]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsOtherVas]  DEFAULT ((0)) FOR [IsOtherVas]
GO
/****** Object:  Default [DF_ChargeCodeMaster_ServiceChargeApplicable]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_ServiceChargeApplicable]  DEFAULT ((0)) FOR [ServiceChargeApplicable]
GO
/****** Object:  Default [DF_ChargeCodeMaster_ServiceCharge]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_ServiceCharge]  DEFAULT ((0)) FOR [ServiceCharge]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsDeductible]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsDeductible]  DEFAULT ((0)) FOR [IsDeductible]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsDeductibleWaiver]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsDeductibleWaiver]  DEFAULT ((0)) FOR [IsDeductibleWaiver]
GO
/****** Object:  Default [DF_ChargeCodeMaster_WaivingPercentage]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_WaivingPercentage]  DEFAULT ((0)) FOR [WaivingPercentage]
GO
/****** Object:  Default [DF_ChargeCodeMaster_IsSecured]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[ChargeCodeMaster] ADD  CONSTRAINT [DF_ChargeCodeMaster_IsSecured]  DEFAULT ((0)) FOR [IsSecured]
GO
/****** Object:  Default [DF_GLookup_IsActive]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[GLookup] ADD  CONSTRAINT [DF_GLookup_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__7A3223E8]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__7B264821]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__7C1A6C5A]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__2057CCD0]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__44FF419A]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF__aspnet_Ro__RoleI__44FF419A]  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF_aspnet_Roles_IsActive]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF_aspnet_Roles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__214BF109]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__7755B73D]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  ForeignKey [PageMaster_ModuleId_FK]    Script Date: 02/05/2016 09:16:36 ******/
ALTER TABLE [dbo].[PageMaster]  WITH CHECK ADD  CONSTRAINT [PageMaster_ModuleId_FK] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[ModuleMaster] ([ModuleId])
GO
ALTER TABLE [dbo].[PageMaster] CHECK CONSTRAINT [PageMaster_ModuleId_FK]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__00DF2177]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__22401542]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__440B1D61]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Roles] CHECK CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
/****** Object:  ForeignKey [User_Application]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [User_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [User_Application]
GO
/****** Object:  ForeignKey [RoleEntity_Application]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleEntity_Application]
GO
/****** Object:  ForeignKey [ProfileEntity_User]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [ProfileEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [ProfileEntity_User]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__7EF6D905]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__2334397B]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__24285DB4]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__251C81ED]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__7D0E9093]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__7E02B4CC]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__4AB81AF0]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__02C769E9]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [UsersInRole_Role]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_Role]
GO
/****** Object:  ForeignKey [UsersInRole_User]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_User]
GO
/****** Object:  ForeignKey [MembershipEntity_Application]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_Application]
GO
/****** Object:  ForeignKey [MembershipEntity_User]    Script Date: 02/05/2016 09:16:37 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_User]
GO
