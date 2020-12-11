
    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK_4A83E8EA]') and parent_object_id = OBJECT_ID(N'AspNetUserRoles'))
alter table AspNetUserRoles  drop constraint FK_4A83E8EA


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK_2576596E]') and parent_object_id = OBJECT_ID(N'AspNetUserRoles'))
alter table AspNetUserRoles  drop constraint FK_2576596E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK_33BDE4D7]') and parent_object_id = OBJECT_ID(N'AspNetUserLogins'))
alter table AspNetUserLogins  drop constraint FK_33BDE4D7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK_B7163970]') and parent_object_id = OBJECT_ID(N'AspNetUserClaims'))
alter table AspNetUserClaims  drop constraint FK_B7163970


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK_6FC117AE]') and parent_object_id = OBJECT_ID(N'ApplicationUser'))
alter table ApplicationUser  drop constraint FK_6FC117AE


    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUsers') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUsers

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUserRoles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUserRoles

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUserLogins') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUserLogins

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetRoles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetRoles

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUserClaims') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUserClaims

    if exists (select * from dbo.sysobjects where id = object_id(N'ApplicationUser') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ApplicationUser

    create table AspNetUsers (
        Id NVARCHAR(255) not null,
       AccessFailedCount INT null,
       Email NVARCHAR(255) null,
       EmailConfirmed BIT null,
       LockoutEnabled BIT null,
       LockoutEndDateUtc DATETIME2 null,
       PasswordHash NVARCHAR(255) null,
       PhoneNumber NVARCHAR(255) null,
       PhoneNumberConfirmed BIT null,
       TwoFactorEnabled BIT null,
       UserName NVARCHAR(255) not null unique,
       SecurityStamp NVARCHAR(255) null,
       primary key (Id)
    )

    create table AspNetUserRoles (
        UserId NVARCHAR(255) not null,
       RoleId NVARCHAR(255) not null
    )

    create table AspNetUserLogins (
        UserId NVARCHAR(255) not null,
       LoginProvider NVARCHAR(255) null,
       ProviderKey NVARCHAR(255) null
    )

    create table AspNetRoles (
        Id NVARCHAR(255) not null,
       Name NVARCHAR(255) not null unique,
       primary key (Id)
    )

    create table AspNetUserClaims (
        Id INT IDENTITY NOT NULL,
       ClaimType NVARCHAR(255) null,
       ClaimValue NVARCHAR(255) null,
       UserId NVARCHAR(255) null,
       primary key (Id)
    )

    create table ApplicationUser (
        applicationuser_key NVARCHAR(255) not null,
       primary key (applicationuser_key)
    )

    alter table AspNetUserRoles 
        add constraint FK_4A83E8EA 
        foreign key (RoleId) 
        references AspNetRoles

    alter table AspNetUserRoles 
        add constraint FK_2576596E 
        foreign key (UserId) 
        references AspNetUsers

    alter table AspNetUserLogins 
        add constraint FK_33BDE4D7 
        foreign key (UserId) 
        references AspNetUsers

    alter table AspNetUserClaims 
        add constraint FK_B7163970 
        foreign key (UserId) 
        references AspNetUsers

    alter table ApplicationUser 
        add constraint FK_6FC117AE 
        foreign key (applicationuser_key) 
        references AspNetUsers
