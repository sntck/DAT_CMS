--create database DAT_CMS
--go

use lida_dat_cms
go

CREATE TABLE [dbo].[tlkTFTD](
	[tftd] [varchar](100) NULL
)

/************************************************************
*	Project stuff 
************************************************************/
CREATE TABLE [dbo].[tblProject](
	[pID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectNumber] [varchar](5) NULL,
	[ProjectName] [varchar](100) NULL,
	PortfolioNumber varchar(9) null,
	[Stage] [int] NULL,
	[Classification] [int] NULL,
	[DATRAG] [int] NULL,
	[ProjectedStartDate] [datetime] NULL,
	[ProjectedEndDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PI] [int] NULL,
	[LeadApplicant] [int] NULL,
	[Faculty] [int] NULL,
	[LIDA] [bit] NULL,
	[DSPT] [bit] NULL,
	[ISO27001] [bit] NULL,
	[LASER] [bit] NULL,
	[IRC] [bit] NULL,
	[SEED] [bit] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY NONCLUSTERED 
(
	[pID] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT ((0)) FOR [LIDA]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT ((0)) FOR [DSPT]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT ((0)) FOR [ISO27001]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT ((0)) FOR [Azure]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT ((0)) FOR [IRC]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT ((0)) FOR [SEED]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT (getdate()) FOR [ValidFrom]
GO

ALTER TABLE [dbo].[tblProject] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

CREATE TABLE [dbo].[tblProjectNotes](
	[pnID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectNumber] [varchar](5) NULL,
	[pNote] [varchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_ProjectNotes] PRIMARY KEY NONCLUSTERED 
(
	[pnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblProjectNotes] ADD  DEFAULT (getdate()) FOR [Created]
GO

ALTER TABLE [dbo].[tblProjectNotes] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

create table dbo.tblProjectDocument (
	pdID int identity(1,1)
	, ProjectNumber varchar(5)
	, DocumentType int
	, VersionNumber decimal(5,2)
	, Submitted datetime
	, Accepted datetime
	, ValidFrom datetime default getdate()
	, ValidTo datetime
	, CreatedBy varchar(50) default suser_name()
	constraint PK_tblProjectDocument primary key nonclustered (pdID)
	)

create table dbo.tblProjectPlatformInfo (
	ProjectPlatformInfoID int identity(1,1)
	, ProjectNumber varchar(5)
	, PlatformInfoID int
	, ProjectPlatformInfo varchar(255)
	, ValidFrom datetime default getdate()
	, ValidTo datetime 
	, CreatedBy varchar(50) default suser_sname()
	constraint PK_ProjectPlatformInfo primary key nonclustered (ProjectPlatformInfoID)
	)

create table dbo.versioning (
	versionID int identity(1,1)
	, VersionName varchar(50)
	, ValidFrom datetime default cast(getdate() as Date)
	, ValidTo datetime
	constraint PK_Versioning primary key (versionID)
	)

CREATE TABLE [dbo].[tlkClassification](
	[classificationID] [int] IDENTITY(1,1) NOT NULL,
	[classificationDescription] [varchar](25) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
 CONSTRAINT [PK_Classification] PRIMARY KEY NONCLUSTERED 
(
	[classificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tlkClassification] ADD  DEFAULT (getdate()) FOR [ValidFrom]
GO

CREATE TABLE [dbo].[tlkFaculty](
	[facultyID] [int] IDENTITY(1,1) NOT NULL,
	[facultyDescription] [varchar](100) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY NONCLUSTERED 
(
	[facultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tlkFaculty] ADD  DEFAULT (getdate()) FOR [ValidFrom]
GO

CREATE TABLE [dbo].[tlkRAG](
	[ragID] [int] IDENTITY(1,1) NOT NULL,
	[ragDescription] [varchar](25) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
 CONSTRAINT [PK_RAG] PRIMARY KEY NONCLUSTERED 
(
	[ragID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tlkRAG] ADD  DEFAULT (getdate()) FOR [ValidFrom]
GO

CREATE TABLE [dbo].[tlkStage](
	[StageID] [int] IDENTITY(1,1) NOT NULL,
	[pStageDescription] [varchar](25) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY NONCLUSTERED 
(
	[StageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tlkStage] ADD  DEFAULT (getdate()) FOR [ValidFrom]
GO

create table dbo.tlkDocuments (
	DocumentID int identity(1,1)
	, DocumentDescription varchar(50)
	, ValidFrom datetime default getdate()
	, ValidTo datetime
	constraint PK_Documents primary key nonclustered (documentID)
	)

create table dbo.tlkPlatformInfo (
	PlatformInfoID int identity(1,1)
	, PlatformInfoDescription varchar(50)
	, ValidFrom datetime default getdate()
	, ValidTo datetime
	constraint PK_PlatformInfo primary key nonclustered (PlatformInfoID)
	)

create table dbo.tblProjectDatTime (
	dtID int identity(1,1) not null
	, ProjectNumber varchar(5)
	, DatHours decimal(3,1)
	, Created datetime default getdate()
	, CreatedBy varchar(50) default suser_name()
	constraint PK_ProjectDatTime primary key (dtID)
	)

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_Project_Classification] FOREIGN KEY([Classification])
REFERENCES [dbo].[tlkClassification] ([classificationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_Project_Classification]
GO

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_Project_DATRAG] FOREIGN KEY([DATRAG])
REFERENCES [dbo].[tlkRAG] ([ragID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_Project_DATRAG]
GO

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_Project_Faculty] FOREIGN KEY([Faculty])
REFERENCES [dbo].[tlkFaculty] ([facultyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_Project_Faculty]
GO

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_Project_Stage] FOREIGN KEY([Stage])
REFERENCES [dbo].[tlkStage] ([StageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_Project_Stage]
GO

alter table dbo.tblProjectDocument
add constraint FK_ProjectDocument_Documents foreign key (DocumentType)
	references dbo.tlkDocuments (DocumentID)
	on delete cascade
	on update cascade

ALTER TABLE dbo.tblProjectDocument CHECK CONSTRAINT FK_ProjectDocument_Documents
GO

alter table dbo.tblProjectPlatformInfo
add constraint FK_ProjectPlatformInfo_PlatformInfo foreign key (PlatformInfoID)
	references dbo.tlkPlatformInfo(PlatformInfoID)
	on update cascade
	on delete cascade

ALTER TABLE dbo.tblProjectPlatformInfo CHECK CONSTRAINT FK_ProjectPlatformInfo_PlatformInfo
GO

/************************************************************
*	User stuff 
************************************************************/

create table dbo.tblUser (
	 [UserID] int identity(1,1)
	, UserNumber int
	, [Status] int
	, [Title] int
	, [FirstName] varchar(50)
	, [LastName] varchar(50)
	, [Email] varchar(255)
	, [Phone] varchar(15)
	, [UserName] varchar(12)
	, [Organisation] varchar(255)
	, [StartDate] datetime
	, [EndDate] datetime
	, [Priviledged] bit default 0
	, [IRCAgreement] datetime
	, [ISET] datetime
	, [ISAT] datetime
	, [SAFE] datetime
	, [TokenSerial] bigint
	, [TokenIssued] datetime
	, [TokenReturned] datetime
	, [ValidFrom] datetime default getdate()
	, [ValidTo] datetime 
	, [CreatedBy] varchar(50) default suser_sname()
	constraint PK_User primary key nonclustered (UserID)
	)

create table dbo.tblUserNotes (
	unID int identity(1,1)
	, UserNumber int
	, uNote varchar(max)
	, Created datetime default getdate()
	, CreatedBy varchar(50) default suser_name()
	constraint PK_UserNotes primary key nonclustered (unID)
	)

create table dbo.tblUserProject (
	UserNumber int
	, ProjectNumber varchar(5)
	, [ValidFrom] datetime default getdate()
	, [ValidTo] datetime 
	, [CreatedBy] varchar(50) default suser_sname()
	--constraint PK_UserProject primary key nonclustered (UserNumber, ProjectNumber)
	)


create table dbo.tlkUserStatus (
	StatusID int identity(1,1)
	, StatusDescription varchar(25)
	, [ValidFrom] datetime default getdate()
	, [ValidTo] datetime 
	constraint PK_UserStatus primary key nonclustered (StatusID)
	)
alter table dbo.tblUser
add constraint FK_User_UserStatus foreign key ([Status])
	references dbo.tlkUserStatus(StatusID)
	on update cascade
	on delete cascade

create table dbo.tlkTitle (
	TitleID int identity(1,1)
	, TitleDescription varchar(25)
	, [ValidFrom] datetime default getdate()
	, [ValidTo] datetime 
	constraint PK_Title primary key nonclustered (TitleID)
	)
alter table dbo.tblUser
add constraint FK_User_Title foreign key ([Title])
	references dbo.tlkTitle(TitleID)
	on update cascade
	on delete cascade


/************************************************************
*	Lookup stuff 
************************************************************/

--INSERT INTO dbo.tblProject
--           (ProjectNumber, ProjectName)
--     VALUES
--           ('P0001', 'Seeder project')

INSERT INTO dbo.tlkStage
           (pStageDescription)
     VALUES
		('Pre-Approval'), ('Setup'), ('Active'), ('Frozen'), ('Closed')

INSERT INTO dbo.tlkClassification
           (classificationDescription)
     VALUES
		('IRC_Unclassified'), ('IRC_Protect'), ('IRC_Confidential'), ('IRC_Secure')

INSERT INTO dbo.tlkRAG
           (ragDescription)
     VALUES
			('Green'), ('Amber'), ('Red')

INSERT INTO dbo.tlkFaculty
           (facultyDescription)
     VALUES
			('Arts Humanities and Cultures'), ('Biological Sciences'), ('Business'), ('Social Sciences'), ('Engineering and Physical Sciences'), ('Environment'), ('Medicine and Health'), ('Interdisciplinary')

insert into dbo.tlkTitle (TitleDescription) values 
	('Mr'), ('Mrs'), ('Ms'), ('Miss'), ('Dr'), ('Prof'), ('Sir')

 insert into dbo.tlkUserStatus (StatusDescription) values
	('Enabled'), ('Disabled'), ('Pending')

insert into dbo.tblUser (UserNumber, Title, FirstName, LastName)
values (1, 1, 'Flint', 'Sparkoff')

insert into dbo.tlkDocuments (documentDescription) values
	('Project Proposal'), ('Data Management Plan'), ('Risk Assessment')

insert into dbo.tlkPlatformInfo (PlatformInfoDescription) values
	('VRE Number'), ('S:/ File Path'), ('SEED Database'), ('SEED Web App')
