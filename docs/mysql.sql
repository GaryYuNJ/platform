/* 建立测试数据库数据库 */
drop database if exists platform;

create database if not exists platform
    default character set utf8mb4
    default collate utf8mb4_general_ci;

use platform;

/* 实体-组织架构相关 --------------------------------------------------------------------------------------------------- */
/* 实体表 */
create table sys_actor (
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
    constraint pk_sys_actor_id primary key (id)
);


/* 实体关联 */
create table sys_actor_relation (
    `id`         int not null auto_increment,
    `parent_id`  int not null,
    `child_id`   int not null,
    `parent_ind` int not null,
    `level`      int not null,
    `type`       varchar(50),
    `created_at` datetime,
    `created_by` int,
    constraint fk_sys_actor_relation_parent_id foreign key (parent_id) references sys_actor (id),
    constraint fk_sys_actor_relation_child_id foreign key (child_id) references sys_actor (id),
    constraint pk_sys_actor_relation_id primary key (id)
);

/* 组织表 */
create table sys_organization (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_sys_organization_id foreign key (id) references sys_actor (id),
    constraint pk_sys_organization_id primary key (id)
);

/* 部门表 */
create table sys_department (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_sys_department_id foreign key (id) references sys_actor (id),
    constraint pk_sys_department_id primary key (id)
);

/* 岗位表 */
create table sys_position (
    `id`          int          not null,
    `code`        varchar(150) not null,
    `title`       varchar(150) not null,
    `description` varchar(255),
    constraint fk_sys_position_id foreign key (id) references sys_actor (id),
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
    constraint fk_sys_user_id foreign key (id) references sys_actor (id),
    constraint pk_sys_user_id primary key (id)
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
    constraint fk_sys_user_session_entity_id foreign key (entity_id) references sys_actor (id),
    constraint pk_sys_user_session_id primary key (id)
);

/* 实体-组织架构相关 --------------------------------------------------------------------------------------------------- */


/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */
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
    constraint fk_sys_role_permission_entity_id foreign key (role_id) references sys_role (id),
    constraint fk_sys_role_permission_permission_id foreign key (permission_id) references sys_permission (id),
    constraint pk_sys_role_permission_id primary key (id)
);

/* 实体-权限关联表 */
create table sys_actor_permission (
    `id`            int not null auto_increment,
    `entity_id`     int not null,
    `permission_id` int not null,
    `created_at`    datetime,
    `created_by`    int,
    constraint fk_sys_actor_permission_entity_id foreign key (entity_id) references sys_actor (id),
    constraint fk_sys_actor_permission_permission_id foreign key (permission_id) references sys_permission (id),
    constraint pk_sys_actor_permission_id primary key (id)
);
/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */


/* 字典相关 ---------------------------------------------------------------------------------------------------------- */
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
/* 字典相关 ---------------------------------------------------------------------------------------------------------- */


/* 上传附件 ---------------------------------------------------------------------------------------------------------- */
/* 上传附件表 */
create table sys_attachment (
    `id`         int          not null auto_increment,
    `type`       varchar(255) not null,
    `created_at` datetime,
    `created_by` int,
    `updated_at` datetime,
    `updated_by` int,
    constraint pk_sys_attachment_id primary key (id)
);

/* 文件明细表 */
create table sys_attachment_file (
    `id`         int          not null auto_increment,
    `uuid`       varchar(255) not null,
    `filename`   varchar(255) null,
    `created_at` datetime,
    `created_by` int,
    `updated_at` datetime,
    `updated_by` int,
    constraint pk_sys_attachment_file_id primary key (id)
);

/* 附件关联表 */
create table sys_attachment_relation (
    `id`            int          not null auto_increment,
    `type`          varchar(255) not null,
    `attachment_id` int          not null,
    `target_id`     int          not null,
    `created_at`    datetime,
    `created_by`    int,
    constraint pk_sys_attachment_relation_id primary key (id)
);
/* 上传附件 ---------------------------------------------------------------------------------------------------------- */


/* 目录资源 ---------------------------------------------------------------------------------------------------------- */
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
    constraint fk_sys_catalog_access_access_entity_id foreign key (access_entity_id) references sys_actor (id),
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
    constraint fk_sys_resource_access_access_entity_id foreign key (access_entity_id) references sys_actor (id),
    constraint pk_sys_resource_access_id primary key (id)
);
/* 目录资源 ---------------------------------------------------------------------------------------------------------- */


/* 基础数据 ---------------------------------------------------------------------------------------------------------- */
insert into sys_actor (
    `id`, `uid`, `source`, `type`, `status`, `created_at`, `created_by`,
    `updated_at`, `updated_by`, `deleted_at`, `deleted_by`)
values
    (1, 'ORG00001', 'SYS', 'ORG', 'ON', now(), null, now(), null, now(), null),
    (2, 'DPT00001', 'SYS', 'DPT', 'ON', now(), null, now(), null, now(), null),
    (3, 'DPT00002', 'SYS', 'DPT', 'ON', now(), null, now(), null, now(), null),
    (4, 'PST00001', 'SYS', 'PST', 'ON', now(), null, now(), null, now(), null),
    (5, 'PST00002', 'SYS', 'PST', 'ON', now(), null, now(), null, now(), null),
    (6, 'USR00001', 'SYS', 'PST', 'ON', now(), null, now(), null, now(), null);

/* 顶层组织 */
insert into sys_organization (`id`, `code`, `title`, `description`)
values (1, 'Root', 'Root Organization', 'Root Organization');

/* 顶层组织基础部门 */
insert into sys_department (`id`, `code`, `title`, `description`)
values
    (2, 'Root', 'Root Department', 'Root Department'),
    (3, 'RecyleBin', 'Recyle Bin', 'Recyle Bin');

/* 顶层组织基础岗位 */
insert into sys_position (`id`, `code`, `title`, `description`)
values
    (4, 'All Position', 'All Position', 'All Position'),
    (5, 'Unspecified ', 'Unspecified', 'Unspecified');

/* 管理员 */
insert into sys_user (
    `id`, `username`, `email`, `mobile`, `password`, `salt`,
    `nickname`, `fullname`, `description`, `status`, `source`,
    `last_login_status`, `last_login_datetime`
) values
    (6, 'admin', 'admin@host', '13800138000', '', '', 'Administrator', null, null, 'ON', 'SYS', null, null);

/* 实体关联信息 */
insert into sys_actor_relation (
    `id`, `parent_id`, `child_id`, `parent_ind`, `level`, `type`, `created_at`, `created_by`
) values
    (1, 1, 2, 1, 1, 'DPT_PARENT_ORG', now(), null),
    (2, 1, 3, 1, 1, 'DPT_PARENT_ORG', now(), null),
    (3, 1, 4, 1, 1, 'PST_PARENT_ORG', now(), null),
    (4, 1, 5, 1, 1, 'PST_PARENT_ORG', now(), null),
    (5, 2, 6, 1, 1, 'USR_CURRENT_DPT', now(), null),
    (6, 5, 6, 1, 1, 'USR_CURRENT_PST', now(), null);