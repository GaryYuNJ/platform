/* 建立测试数据库数据库 */
drop database if exists platform;

create database if not exists platform
    default character set utf8mb4
    default collate utf8mb4_general_ci;

use platform;

/* 组织架构相关 ------------------------------------------------------------------------------------------------------- */
/* 组织表 */
create table sys_organization (
    `id`          bigint       not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    `status`      varchar(50)  not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    `deleted_at`  datetime,
    `deleted_by`  int,
    constraint pk_sys_organization_id primary key (id)
);

/* 部门表 */
create table sys_department (
    `id`          bigint       not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    `status`      varchar(50)  not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    `deleted_at`  datetime,
    `deleted_by`  int,
    constraint pk_sys_department_id primary key (id)
);

/* 岗位表 */
create table sys_position (
    `id`          bigint       not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    `status`      varchar(50)  not null,
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    `deleted_at`  datetime,
    `deleted_by`  int,
    constraint pk_sys_position_id primary key (id)
);

/* 用户表 */
create table sys_user (
    `id`                  bigint       not null,
    `username`            varchar(150) not null,
    `email`               varchar(150) not null,
    `mobile`              varchar(150) not null,
    `password`            varchar(150) not null,
    `salt`                varchar(150) not null,
    `nickname`            varchar(255),
    `fullname`            varchar(255),
    `description`         varchar(255),
    `source`              varchar(50),
    `last_login_status`   varchar(50),
    `last_login_datetime` datetime,
    `status`              varchar(50),
    `created_at`          datetime,
    `created_by`          int,
    `updated_at`          datetime,
    `updated_by`          int,
    `deleted_at`          datetime,
    `deleted_by`          int,
    constraint pk_sys_user_id primary key (id)
);

/* 实体表 */
create view sys_v_actor (id, type, status) as
    select
        id,
        'ORG',
        status
    from sys_organization
    union all
    select
        id,
        'DPT',
        status
    from sys_department
    union all
    select
        id,
        'PST',
        status
    from sys_position
    union all
    select
        id,
        'USR',
        status
    from sys_user;

/* 实体关联 */
create table sys_actor_relation (
    `id`         bigint not null,
    `type`       varchar(50),
    `parent_id`  bigint not null,
    `child_id`   bigint not null,
    `level`      int    not null,
    `parent_ind` int    not null,
    `created_at` datetime,
    `created_by` int,
    constraint pk_sys_actor_relation_id primary key (id)
);

/* 用户回话 */
create table sys_user_session (
    `id`                   bigint       not null,
    `user_id`              int          not null,
    `session_id`           varchar(255) not null,
    `username`             varchar(255) null,
    `host`                 varchar(255) not null,
    `device`               varchar(255) not null,
    `last_access_datetime` datetime,
    `start_datetime`       datetime,
    `end_datetime`         datetime,
    constraint fk_sys_user_session_user_id foreign key (user_id) references sys_user (id),
    constraint pk_sys_user_session_id primary key (id)
);
/* 实体-组织架构相关 --------------------------------------------------------------------------------------------------- */


/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */
/* 角色表 */
create table sys_role (
    `id`          bigint       not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    `status`      varchar(50),
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    `deleted_at`  datetime,
    `deleted_by`  int,
    constraint pk_sys_role_id primary key (id)
);

/* 权限表 */
create table sys_permission (
    `id`          bigint not null,
    `code`        varchar(255),
    `title`       varchar(255),
    `description` varchar(255),
    `status`      varchar(50),
    `created_at`  datetime,
    `created_by`  int,
    `updated_at`  datetime,
    `updated_by`  int,
    `deleted_at`  datetime,
    `deleted_by`  int,
    constraint pk_sys_permission_id primary key (id)
);

/* 角色-权限关联表 */
create table sys_role_permission (
    `id`            bigint not null,
    `role_id`       bigint not null,
    `permission_id` bigint not null,
    `created_at`    datetime,
    `created_by`    bigint,
    constraint fk_sys_role_permission_role_id foreign key (role_id) references sys_role (id),
    constraint fk_sys_role_permission_permission_id foreign key (permission_id) references sys_permission (id),
    constraint pk_sys_role_permission_id primary key (id)
);
/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */


/* 字典相关 ---------------------------------------------------------------------------------------------------------- */
/* 字典 */
create table sys_dict (
    `id`          bigint       not null,
    `code`        varchar(255) not null,
    `name`        varchar(255) not null,
    `description` varchar(255) not null,
    `created_at`  datetime,
    `created_by`  bigint,
    `updated_at`  datetime,
    `updated_by`  bigint,
    constraint pk_sys_dict_id primary key (id)
);

/* 字典明细 */
create table sys_dict_item (
    `id`          bigint       not null,
    `dict_id`     bigint       not null,
    `key`         varchar(150) not null,
    `value`       varchar(255) not null,
    `description` varchar(255) not null,
    `created_at`  datetime,
    `created_by`  bigint,
    `updated_at`  datetime,
    `updated_by`  bigint,
    constraint fk_sys_dict_item_dict_id foreign key (dict_id) references sys_dict (id),
    constraint pk_sys_dict_item_id primary key (id)
);
/* 字典相关 ---------------------------------------------------------------------------------------------------------- */


/* 上传附件 ---------------------------------------------------------------------------------------------------------- */
/* 上传附件表 */
create table sys_attachment (
    `id`         bigint       not null,
    `type`       varchar(255) not null,
    `created_at` datetime,
    `created_by` bigint,
    `updated_at` datetime,
    `updated_by` bigint,
    constraint pk_sys_attachment_id primary key (id)
);

/* 文件明细表 */
create table sys_attachment_file (
    `id`         bigint       not null,
    `uuid`       varchar(255) not null,
    `filename`   varchar(255) null,
    `created_at` datetime,
    `created_by` bigint,
    `updated_at` datetime,
    `updated_by` bigint,
    constraint pk_sys_attachment_file_id primary key (id)
);

/* 附件关联表 */
create table sys_attachment_relation (
    `id`            bigint       not null,
    `type`          varchar(255) not null,
    `attachment_id` bigint       not null,
    `target_id`     bigint       not null,
    `created_at`    datetime,
    `created_by`    bigint,
    constraint pk_sys_attachment_relation_id primary key (id)
);
/* 上传附件 ---------------------------------------------------------------------------------------------------------- */


/* 目录资源 ---------------------------------------------------------------------------------------------------------- */
/* 目录 */
create table sys_catalog (
    `id`          bigint       not null,
    `code`        varchar(150) not null,
    `title`       varchar(255) null,
    `description` varchar(255) not null,
    `type`        varchar(255) not null,
    `created_at`  datetime,
    `created_by`  bigint,
    `updated_at`  datetime,
    `updated_by`  bigint,
    constraint pk_sys_catalog_id primary key (id)
);

create table sys_catalog_relation (
    `id`         bigint not null,
    `parent_id`  bigint not null,
    `child_id`   bigint not null,
    `parent_ind` int    not null,
    `level`      int    not null,
    `created_at` datetime,
    `created_by` bigint,
    constraint fk_sys_catalog_relation_parent_id foreign key (parent_id) references sys_catalog (id),
    constraint fk_sys_catalog_relation_child_id foreign key (child_id) references sys_catalog (id),
    constraint pk_sys_catalog_relation_id primary key (id)
);

create table sys_catalog_access (
    `id`              bigint      not null,
    `access_type`     varchar(50) not null,
    `access_role_id`  bigint      not null,
    `access_actor_id` bigint      not null,
    `created_at`      datetime,
    `created_by`      bigint,
    constraint pk_sys_catalog_access_id primary key (id)
);

/* 资源表 */
create table sys_resource (
    `id`          bigint not null,
    `code`        varchar(255),
    `title`       varchar(255),
    `description` varchar(255),
    `type`        varchar(255),
    `created_at`  datetime,
    `created_by`  bigint,
    `updated_at`  datetime,
    `updated_by`  bigint,
    constraint pk_sys_resource_id primary key (id)
);

create table sys_resource_access (
    `id`              bigint      not null,
    `access_type`     varchar(50) not null,
    `access_role_id`  bigint      not null,
    `access_actor_id` bigint      not null,
    `created_at`      datetime,
    `created_by`      bigint,
    constraint fk_sys_resource_access_access_role_id foreign key (access_role_id) references sys_role (id),
    constraint pk_sys_resource_access_id primary key (id)
);
/* 目录资源 ---------------------------------------------------------------------------------------------------------- */


/* 系统设置 ---------------------------------------------------------------------------------------------------------- */

create table sys_setting (
    `id`         bigint       not null,
    `key`        varchar(150) not null,
    `value`      varchar(255) not null,
    `created_at` datetime,
    `created_by` bigint,
    `updated_at` datetime,
    `updated_by` bigint,
    constraint pk_sys_resource_access_id primary key (id)
);

/* 系统设置 ---------------------------------------------------------------------------------------------------------- */
