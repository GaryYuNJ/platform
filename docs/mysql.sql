/* 建立测试数据库数据库 */
drop database if exists platform;

create database if not exists platform
    default character set utf8mb4
    default collate utf8mb4_general_ci;

use platform;

/* 实体表 */
create table sys_entity (
    `id`         int          not null auto_increment,
    `uid`        varchar(100) not null,
    `source`     varchar(50)  not null,
    `type`       varchar(50)  not null,
    `status`     varchar(50)  not null,
    `created_at` datetime,
    `created_by` int,
    `updated_at` datetime,
    `updated_by` int,
    `deleted_at` datetime,
    `deleted_by` int,
    constraint pk_sys_entity_id primary key (id)
);

/* 实体关联 */
create table sys_entity_relation (
    `id`         int not null auto_increment,
    `parent_id`  int not null,
    `child_id`   int not null,
    `parent_ind` int not null,
    `level`      int not null,
    `type`       varchar(50),
    `created_at` datetime,
    `created_by` int,
    constraint fk_sys_entityrelation_parent_id foreign key (parent_id) references sys_entity (id),
    constraint fk_sys_entityrelation_child_id foreign key (child_id) references sys_entity (id),
    constraint pk_sys_entityrelation_id primary key (id)
);

/* 组织表 */
create table sys_organization (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_sys_organization_id foreign key (id) references sys_entity (id),
    constraint pk_sys_organization_id primary key (id)
);

/* 部门表 */
create table sys_department (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_sys_department_id foreign key (id) references sys_entity (id),
    constraint pk_sys_department_id primary key (id)
);

/* 岗位表 */
create table sys_position (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_sys_position_id foreign key (id) references sys_entity (id),
    constraint pk_sys_position_id primary key (id)
);

/* 用户表 */
create table sys_user (
    `id`                  int          not null,
    `username`            varchar(150) not null,
    `email`               varchar(150) not null,
    `mobile`              varchar(150) not null,
    `password`            varchar(150) not null,
    `salt`                varchar(150) not null,
    `nickname`            varchar(255),
    `fullname`            varchar(255),
    `description`         varchar(255),
    `status`              varchar(50),
    `source`              varchar(50),
    `last_login_status`   varchar(50),
    `last_login_datetime` datetime,
    constraint fk_sys_user_id foreign key (id) references sys_entity (id),
    constraint pk_sys_user_id primary key (id)
);

/* 角色表 */
create table sys_role (
    `id`          int          not null   auto_increment,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint pk_sys_role_id primary key (id)
);

/* 权限表 */
create table sys_permission (
    `id`          int not null auto_increment,
    `code`        varchar(255),
    `title`       varchar(255),
    `description` varchar(255),
    constraint pk_sys_permission_id primary key (id)
);

/* 角色-权限关联表 */
create table sys_role_permission (
    `id`            int not null auto_increment,
    `role_id`       int not null,
    `permission_id` int not null,
    `created_at`    datetime,
    `created_by`    int,
    constraint fk_sys_entity_permission_entity_id foreign key (role_id) references sys_role (id),
    constraint fk_sys_entity_permission_permission_id foreign key (permission_id) references sys_permission (id),
    constraint pk_sys_entity_permission_id primary key (id)
);

/* 实体-权限关联表 */
create table sys_entity_permission (
    `id`            int not null auto_increment,
    `entity_id`     int not null,
    `permission_id` int not null,
    `created_at`    datetime,
    `created_by`    int,
    constraint fk_sys_entity_permission_entity_id foreign key (entity_id) references sys_entity (id),
    constraint fk_sys_entity_permission_permission_id foreign key (permission_id) references sys_permission (id),
    constraint pk_sys_entity_permission_id primary key (id)
);

/* 用户回话 */
create table sys_user_session (
    `id`                   int          not null auto_increment,
    `session_id`           varchar(255) not null,
    `entity_id`            int          not null,
    `username`             varchar(255) null,
    `host`                 varchar(255) not null,
    `device`               varchar(255) not null,
    `last_access_datetime` datetime,
    `start_datetime`       datetime,
    `end_datetime`         datetime,
    constraint fk_sys_user_session_entity_id foreign key (entity_id) references sys_entity (id),
    constraint pk_sys_user_session_id primary key (id)
);

/* 字典 */
create table sys_dict (
    `id`          int          not null auto_increment,
    `code`        varchar(255) not null,
    `name`        varchar(255) not null,
    `description` varchar(255) not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    constraint pk_sys_dict_id primary key (id)
);

/* 字典明细 */
create table sys_dict_item (
    `id`          int          not null auto_increment,
    `dict_id`     int          not null,
    `key`         varchar(150) not null,
    `value`       varchar(255) not null,
    `description` varchar(255) not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    constraint fk_sys_dict_item_dict_id foreign key (dict_id) references sys_dict (id),
    constraint pk_sys_dict_item_id primary key (id)
);

/* 上传附件表 */
create table sys_attachment (
    `id`          int          not null auto_increment,
    `uuid`        varchar(255) not null,
    `filename`    varchar(255) null,
    `description` varchar(255) not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    constraint pk_sys_attachment_id primary key (id)
);

/* 目录 */
create table sys_catalog (
    `id`          int          not null auto_increment,
    `code`        varchar(150) not null,
    `title`       varchar(255) null,
    `description` varchar(255) not null,
    `type`        varchar(255) not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    constraint pk_sys_catalog_id primary key (id)
);

create table sys_catalog_relation (
    `id`         int not null auto_increment,
    `parent_id`  int not null,
    `child_id`   int not null,
    `parent_ind` int not null,
    `level`      int not null,
    `created_at` datetime,
    `created_by` int,
    constraint fk_sys_catalog_relation_parent_id foreign key (parent_id) references sys_catalog (id),
    constraint fk_sys_catalog_relation_child_id foreign key (child_id) references sys_catalog (id),
    constraint pk_sys_catalog_relation_id primary key (id)
);

create table sys_catalog_access (
    `id`               int         not null auto_increment,
    `access_type`      varchar(50) not null,
    `access_role_id`   int         not null,
    `access_entity_id` int         not null,
    `created_at`       datetime,
    `created_by`       int,
    constraint fk_sys_catalog_access_access_role_id foreign key (access_role_id) references sys_role (id),
    constraint fk_sys_catalog_access_access_entity_id foreign key (access_entity_id) references sys_entity (id),
    constraint pk_sys_catalog_access_id primary key (id)
);

/* 资源表 */
create table sys_resource (
    `id`          int not null auto_increment,
    `code`        varchar(255),
    `title`       varchar(255),
    `description` varchar(255),
    `type`        varchar(255),
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    constraint pk_sys_resource_id primary key (id)
);

create table sys_resource_access (
    `id`               int         not null auto_increment,
    `access_type`      varchar(50) not null,
    `access_role_id`   int         not null,
    `access_entity_id` int         not null,
    `created_at`       datetime,
    `created_by`       int,
    constraint fk_sys_resource_access_access_role_id foreign key (access_role_id) references sys_role (id),
    constraint fk_sys_resource_access_access_entity_id foreign key (access_entity_id) references sys_entity (id),
    constraint pk_sys_resource_access_id primary key (id)
);

