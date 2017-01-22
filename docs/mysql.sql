/* 建立测试数据库数据库 */
DROP DATABASE IF EXISTS platform;

CREATE DATABASE IF NOT EXISTS platform
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE platform;

/* 组织架构相关 ------------------------------------------------------------------------------------------------------- */
/* 组织表 */
CREATE TABLE sys_organization (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(150) NOT NULL,
    `title`       VARCHAR(255) NOT NULL,
    `description` VARCHAR(255),
    `type`        VARCHAR(50) DEFAULT 'ORG',
    `status`      VARCHAR(50)  NOT NULL,
    `created_at`  DATETIME,
    `created_by`  INT,
    `updated_at`  DATETIME,
    `updated_by`  INT,
    `deleted_at`  DATETIME,
    `deleted_by`  INT,
    CONSTRAINT pk_sys_organization_id PRIMARY KEY (id)
);

/* 部门表 */
CREATE TABLE sys_department (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(150) NOT NULL,
    `title`       VARCHAR(255) NOT NULL,
    `description` VARCHAR(255),
    `type`        VARCHAR(50) DEFAULT 'DPT',
    `status`      VARCHAR(50)  NOT NULL,
    `created_at`  DATETIME,
    `created_by`  INT,
    `updated_at`  DATETIME,
    `updated_by`  INT,
    `deleted_at`  DATETIME,
    `deleted_by`  INT,
    CONSTRAINT pk_sys_department_id PRIMARY KEY (id)
);

/* 岗位表 */
CREATE TABLE sys_position (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(150) NOT NULL,
    `title`       VARCHAR(255) NOT NULL,
    `description` VARCHAR(255),
    `type`        VARCHAR(50) DEFAULT 'PST',
    `status`      VARCHAR(50)  NOT NULL,
    `created_at`  DATETIME,
    `created_by`  INT,
    `updated_at`  DATETIME,
    `updated_by`  INT,
    `deleted_at`  DATETIME,
    `deleted_by`  INT,
    CONSTRAINT pk_sys_position_id PRIMARY KEY (id)
);

/* 用户表 */
CREATE TABLE sys_user (
    `id`                  BIGINT       NOT NULL,
    `username`            VARCHAR(150) NOT NULL,
    `email`               VARCHAR(150) NOT NULL,
    `mobile`              VARCHAR(150) NOT NULL,
    `password`            VARCHAR(255) NOT NULL,
    `salt`                VARCHAR(255) NOT NULL,
    `nickname`            VARCHAR(255),
    `fullname`            VARCHAR(255),
    `description`         VARCHAR(255),
    `type`                VARCHAR(50) DEFAULT 'USR',
    `source`              VARCHAR(50),
    `last_login_status`   VARCHAR(50),
    `last_login_datetime` DATETIME,
    `status`              VARCHAR(50),
    `created_at`          DATETIME,
    `created_by`          INT,
    `updated_at`          DATETIME,
    `updated_by`          INT,
    `deleted_at`          DATETIME,
    `deleted_by`          INT,
    CONSTRAINT pk_sys_user_id PRIMARY KEY (id)
);

/* 实体表 */
CREATE VIEW sys_v_actor (id, type, status, uid) AS
    SELECT
        id,
        type,
        code,
        status
    FROM sys_organization
    UNION ALL
    SELECT
        id,
        type,
        code,
        status
    FROM sys_department
    UNION ALL
    SELECT
        id,
        type,
        code,
        status
    FROM sys_position
    UNION ALL
    SELECT
        id,
        type,
        username,
        status
    FROM sys_user;

/* 实体关联 */
CREATE TABLE sys_actor_relation (
    `id`         BIGINT NOT NULL,
    `type`       VARCHAR(50),
    `parent_id`  BIGINT NOT NULL,
    `child_id`   BIGINT NOT NULL,
    `level`      INT    NOT NULL,
    `parent_ind` INT    NOT NULL,
    `created_at` DATETIME,
    `created_by` INT,
    CONSTRAINT pk_sys_actor_relation_id PRIMARY KEY (id)
);

CREATE INDEX ix_sys_actor_relation
    ON sys_actor_relation (type, parent_id, child_id, parent_ind);

/* 用户回话 */
CREATE TABLE sys_user_session (
    `id`                   BIGINT       NOT NULL,
    `session_id`           VARCHAR(255) NOT NULL,
    `username`             VARCHAR(255) NULL,
    `host`                 VARCHAR(255) NOT NULL,
    `device`               VARCHAR(255) NOT NULL,
    `last_access_datetime` DATETIME,
    `start_datetime`       DATETIME,
    `end_datetime`         DATETIME,
    CONSTRAINT pk_sys_user_session_id PRIMARY KEY (id)
);
/* 实体-组织架构相关 --------------------------------------------------------------------------------------------------- */


/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */
/* 角色表 */
CREATE TABLE sys_role (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(150) NOT NULL,
    `title`       VARCHAR(150) NOT NULL,
    `description` VARCHAR(255),
    `status`      VARCHAR(50),
    `created_at`  DATETIME,
    `created_by`  INT,
    `updated_at`  DATETIME,
    `updated_by`  INT,
    `deleted_at`  DATETIME,
    `deleted_by`  INT,
    CONSTRAINT pk_sys_role_id PRIMARY KEY (id)
);

/* 权限表 */
CREATE TABLE sys_permission (
    `id`          BIGINT NOT NULL,
    `code`        VARCHAR(255),
    `title`       VARCHAR(255),
    `description` VARCHAR(255),
    `status`      VARCHAR(50),
    `created_at`  DATETIME,
    `created_by`  INT,
    `updated_at`  DATETIME,
    `updated_by`  INT,
    `deleted_at`  DATETIME,
    `deleted_by`  INT,
    CONSTRAINT pk_sys_permission_id PRIMARY KEY (id)
);

/* 角色-权限关联表 */
CREATE TABLE sys_role_permission (
    `id`            BIGINT NOT NULL,
    `role_id`       BIGINT NOT NULL,
    `permission_id` BIGINT NOT NULL,
    `created_at`    DATETIME,
    `created_by`    BIGINT,
    CONSTRAINT fk_sys_role_permission_role_id FOREIGN KEY (role_id) REFERENCES sys_role (id),
    CONSTRAINT fk_sys_role_permission_permission_id FOREIGN KEY (permission_id) REFERENCES sys_permission (id),
    CONSTRAINT pk_sys_role_permission_id PRIMARY KEY (id)
);
/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */


/* 字典相关 ---------------------------------------------------------------------------------------------------------- */
/* 字典 */
CREATE TABLE sys_dict (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(255) NOT NULL,
    `name`        VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT pk_sys_dict_id PRIMARY KEY (id)
);

/* 字典明细 */
CREATE TABLE sys_dict_item (
    `id`          BIGINT       NOT NULL,
    `dict_id`     BIGINT       NOT NULL,
    `key`         VARCHAR(150) NOT NULL,
    `value`       VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT fk_sys_dict_item_dict_id FOREIGN KEY (dict_id) REFERENCES sys_dict (id),
    CONSTRAINT pk_sys_dict_item_id PRIMARY KEY (id)
);
/* 字典相关 ---------------------------------------------------------------------------------------------------------- */


/* 上传附件 ---------------------------------------------------------------------------------------------------------- */
/* 上传附件表 */
CREATE TABLE sys_attachment (
    `id`         BIGINT       NOT NULL,
    `type`       VARCHAR(255) NOT NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    `updated_at` DATETIME,
    `updated_by` BIGINT,
    CONSTRAINT pk_sys_attachment_id PRIMARY KEY (id)
);

/* 文件明细表 */
CREATE TABLE sys_attachment_file (
    `id`         BIGINT       NOT NULL,
    `uuid`       VARCHAR(255) NOT NULL,
    `filename`   VARCHAR(255) NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    `updated_at` DATETIME,
    `updated_by` BIGINT,
    CONSTRAINT pk_sys_attachment_file_id PRIMARY KEY (id)
);

/* 附件关联表 */
CREATE TABLE sys_attachment_relation (
    `id`            BIGINT       NOT NULL,
    `type`          VARCHAR(255) NOT NULL,
    `attachment_id` BIGINT       NOT NULL,
    `target_id`     BIGINT       NOT NULL,
    `created_at`    DATETIME,
    `created_by`    BIGINT,
    CONSTRAINT pk_sys_attachment_relation_id PRIMARY KEY (id)
);
/* 上传附件 ---------------------------------------------------------------------------------------------------------- */


/* 目录资源 ---------------------------------------------------------------------------------------------------------- */
/* 目录 */
CREATE TABLE sys_catalog (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(150) NOT NULL,
    `title`       VARCHAR(255) NULL,
    `description` VARCHAR(255) NOT NULL,
    `type`        VARCHAR(255) NOT NULL,
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT pk_sys_catalog_id PRIMARY KEY (id)
);

CREATE TABLE sys_catalog_relation (
    `id`         BIGINT NOT NULL,
    `parent_id`  BIGINT NOT NULL,
    `child_id`   BIGINT NOT NULL,
    `parent_ind` INT    NOT NULL,
    `level`      INT    NOT NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    CONSTRAINT fk_sys_catalog_relation_parent_id FOREIGN KEY (parent_id) REFERENCES sys_catalog (id),
    CONSTRAINT fk_sys_catalog_relation_child_id FOREIGN KEY (child_id) REFERENCES sys_catalog (id),
    CONSTRAINT pk_sys_catalog_relation_id PRIMARY KEY (id)
);

CREATE TABLE sys_catalog_access (
    `id`              BIGINT      NOT NULL,
    `access_type`     VARCHAR(50) NOT NULL,
    `access_role_id`  BIGINT      NOT NULL,
    `access_actor_id` BIGINT      NOT NULL,
    `created_at`      DATETIME,
    `created_by`      BIGINT,
    CONSTRAINT pk_sys_catalog_access_id PRIMARY KEY (id)
);

/* 资源表 */
CREATE TABLE sys_resource (
    `id`          BIGINT NOT NULL,
    `code`        VARCHAR(255),
    `title`       VARCHAR(255),
    `description` VARCHAR(255),
    `type`        VARCHAR(255),
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT pk_sys_resource_id PRIMARY KEY (id)
);

CREATE TABLE sys_resource_access (
    `id`              BIGINT      NOT NULL,
    `access_type`     VARCHAR(50) NOT NULL,
    `access_role_id`  BIGINT      NOT NULL,
    `access_actor_id` BIGINT      NOT NULL,
    `created_at`      DATETIME,
    `created_by`      BIGINT,
    CONSTRAINT fk_sys_resource_access_access_role_id FOREIGN KEY (access_role_id) REFERENCES sys_role (id),
    CONSTRAINT pk_sys_resource_access_id PRIMARY KEY (id)
);
/* 目录资源 ---------------------------------------------------------------------------------------------------------- */


/* 系统设置 ---------------------------------------------------------------------------------------------------------- */

CREATE TABLE sys_setting (
    `id`         BIGINT       NOT NULL,
    `key`        VARCHAR(150) NOT NULL,
    `value`      VARCHAR(255) NOT NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    `updated_at` DATETIME,
    `updated_by` BIGINT,
    CONSTRAINT pk_sys_resource_access_id PRIMARY KEY (id)
);

/* 系统设置 ---------------------------------------------------------------------------------------------------------- */
