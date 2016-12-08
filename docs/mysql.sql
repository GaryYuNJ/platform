/* 建立测试数据库数据库 */
drop database if exists platform;

create database if not exists platform
    default character set utf8mb4
    default collate utf8mb4_general_ci;

use platform;

/* 实体表 */
create table entity (
    `id`        int          not null auto_increment,
    `uid`       varchar(150) not null,
    `source`    varchar(50)  not null,
    `type`      varchar(50)  not null,
    `createdat` datetime,
    `createdby` int,
    `updatedat` datetime,
    `updatedby` int,
    `deletedat` datetime,
    `deletedby` int,
    constraint pk_entity_id primary key (id)
);

create table entityrelation (
    `id`        int not null auto_increment,
    `parentid`  int not null,
    `childid`   int not null,
    `parentind` int not null,
    `level`     int not null,
    `type`      varchar(50),
    `createdat` datetime,
    `createdby` int,
    constraint fk_entityrelation_parentid foreign key (parentid) references entity (id),
    constraint fk_entityrelation_childid foreign key (childid) references entity (id),
    constraint pk_entityrelation_id primary key (id)
);

/* 角色表 */
create table role (
    `id`          int          not null   auto_increment,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_role_id foreign key (id) references entity (id),
    constraint pk_role_id primary key (id)
);

/* 组织表 */
create table organization (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_organization_id foreign key (id) references entity (id),
    constraint pk_organization_id primary key (id)
);

/* 部门表 */
create table department (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_department_id foreign key (id) references entity (id),
    constraint pk_department_id primary key (id)
);

/* 岗位表 */
create table position (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_position_id foreign key (id) references entity (id),
    constraint pk_position_id primary key (id)
);

/* 用户表 */
create table user (
    `id`                int          not null,
    `username`          varchar(50)  not null,
    `email`             varchar(150) not null,
    `mobile`            varchar(150) not null,
    `password`          varchar(150) not null,
    `salt`              varchar(150),
    `nickname`          varchar(255),
    `fullname`          varchar(255),
    `description`       varchar(255),
    `status`            varchar(50),
    `source`            varchar(50),
    `lastloginstatus`   varchar(50),
    `lastlogindatetime` datetime,
    constraint fk_user_id foreign key (id) references entity (id),
    constraint pk_user_id primary key (id)
);

/* 权限表 */
create table permission (
    `id`          int not null auto_increment,
    `code`        varchar(255),
    `title`       varchar(255),
    `description` varchar(255),
    constraint pk_permission_id primary key (id)
);

/* 实体-权限关联表 */
create table entitypermission (
    `id`           int not null auto_increment,
    `entityid`     int not null,
    `permissionid` int not null,
    `createdat`    datetime,
    `createdby`    int,
    constraint fk_entitypermission_entityid foreign key (entityid) references entity (id),
    constraint fk_entitypermission_permissionid foreign key (permissionid) references permission (id),
    constraint pk_entitypermission_id primary key (id)
);

/* 用户回话 */
create table usersession (
    `id`                 int          not null auto_increment,
    `sessionid`          varchar(255) not null,
    `username`           varchar(255) null,
    `host`               varchar(255) not null,
    `device`             varchar(255) not null,
    `lastaccessdatetime` datetime,
    `startdatetime`      datetime,
    `enddatetime`        datetime,
    constraint pk_usersession_id primary key (id)
);

/* 字典 */
create table dict (
    `id`          int          not null auto_increment,
    `code`        varchar(255) not null,
    `name`        varchar(255) not null,
    `description` varchar(255) not null,
    `createdat`   datetime,
    `createdby`   int,
    `updatedat`   datetime,
    `updatedby`   int,
    constraint pk_dict_id primary key (id)
);

/* 字典明细 */
create table dictitem (
    `id`          int          not null auto_increment,
    `dictid`      int          not null,
    `key`         varchar(255) not null,
    `value`       varchar(255) not null,
    `description` varchar(255) not null,
    `createdat`   datetime,
    `createdby`   int,
    `updatedat`   datetime,
    `updatedby`   int,
    constraint fk_dictitem_dictid foreign key (dictid) references dict (id),
    constraint pk_dictitem_id primary key (id)
);

/* 上传附件表 */
create table attachment (
    `id`          int          not null auto_increment,
    `uuid`        varchar(255) not null,
    `filename`    varchar(255) null,
    `description` varchar(255) not null,
    `createdat`   datetime,
    `createdby`   int,
    `updatedat`   datetime,
    `updatedby`   int,
    constraint pk_attachment_id primary key (id)
);

/* 目录 */
create table catalog (
    `id`          int          not null auto_increment,
    `code`        varchar(255) not null,
    `title`       varchar(255) null,
    `description` varchar(255) not null,
    `type`        varchar(255) not null,
    `createdat`   datetime,
    `createdby`   int,
    `updatedat`   datetime,
    `updatedby`   int,
    constraint pk_catalog_id primary key (id)
);

create table catalogrelation (
    `id`        int not null auto_increment,
    `parentid`  int not null,
    `childid`   int not null,
    `parentind` int not null,
    `level`     int not null,
    `createdat` datetime,
    `createdby` int,
    constraint fk_catalogrelation_parentid foreign key (parentid) references catalog (id),
    constraint fk_catalogrelation_childid foreign key (childid) references catalog (id),
    constraint pk_catalogrelation_id primary key (id)
);

create table catalogaccess (
    `id`             int         not null auto_increment,
    `accesstype`     varchar(50) not null,
    `accessroleid`   int         not null,
    `accessentityid` int         not null,
    `createdat`      datetime,
    `createdby`      int,
    constraint fk_catalogaccess_accessroleid foreign key (accessroleid) references entity (id),
    constraint fk_catalogaccess_accessentityid foreign key (accessentityid) references entity (id),
    constraint pk_catalogaccess_id primary key (id)
);

/* 资源表 */
create table resource (
    `id`          int not null auto_increment,
    `code`        varchar(255),
    `title`       varchar(255),
    `description` varchar(255),
    `type`        varchar(255),
    `createdat`   datetime,
    `createdby`   int,
    `updatedat`   datetime,
    `updatedby`   int,
    constraint pk_resources_id primary key (id)
);

create table resourceaccess (
    `id`             int         not null auto_increment,
    `accesstype`     varchar(50) not null,
    `accessroleid`   int         not null,
    `accessentityid` int         not null,
    `createdat`      datetime,
    `createdby`      int,
    constraint fk_resourceaccess_accessroleid foreign key (accessroleid) references entity (id),
    constraint fk_resourceaccess_accessentityid foreign key (accessentityid) references entity (id),
    constraint pk_resourceaccess_id primary key (id)
);

