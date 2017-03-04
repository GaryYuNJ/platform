/* 机构 --------------------------------------------------------------------------------------------------------------- */
/* 机构表 */
CREATE TABLE `sys_organization` (
    `id`          BIGINT COMMENT 'ID'       NOT NULL,
    `code`        VARCHAR(150) COMMENT '编号' NOT NULL,
    `title`       VARCHAR(150) COMMENT '标题' NOT NULL,
    `description` VARCHAR(255) COMMENT '简介说明',
    `source`      TINYINT COMMENT '来源',
    `status`      TINYINT COMMENT '状态',
    `created_at`  DATETIME COMMENT '创建时间',
    `created_by`  BIGINT COMMENT '创建人',
    `updated_at`  DATETIME COMMENT '修改时间',
    `updated_by`  BIGINT COMMENT '修改时间',
    `deleted_at`  DATETIME COMMENT '删除时间',
    `deleted_by`  BIGINT COMMENT '删除人',
    CONSTRAINT `pk_sys_organization_id` PRIMARY KEY (`id`)
);
/* 机构 --------------------------------------------------------------------------------------------------------------- */



/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */
/* 角色表 */
CREATE TABLE `sys_role` (
    `id`          BIGINT COMMENT 'ID'       NOT NULL,
    `org_id`      BIGINT COMMENT '机构ID'     NOT NULL,
    `code`        VARCHAR(150) COMMENT '编号' NOT NULL,
    `title`       VARCHAR(150) COMMENT '标题' NOT NULL,
    `description` VARCHAR(255) COMMENT '简介说明',
    `type`        TINYINT COMMENT '类型',
    `source`      TINYINT COMMENT '来源',
    `status`      TINYINT COMMENT '状态',
    `created_at`  DATETIME COMMENT '创建时间',
    `created_by`  BIGINT COMMENT '创建人',
    `updated_at`  DATETIME COMMENT '修改时间',
    `updated_by`  BIGINT COMMENT '修改时间',
    `deleted_at`  DATETIME COMMENT '删除时间',
    `deleted_by`  BIGINT COMMENT '删除人',
    CONSTRAINT `pk_sys_role_id` PRIMARY KEY (`id`)
);

/* 权限表 */
CREATE TABLE `sys_permission` (
    `id`          BIGINT COMMENT 'ID'       NOT NULL,
    `parent_id`   BIGINT COMMENT 'ID'       NOT NULL,
    `code`        VARCHAR(150) COMMENT '编号' NOT NULL,
    `title`       VARCHAR(150) COMMENT '标题',
    `description` VARCHAR(255) COMMENT '简介说明',
    `url`         VARCHAR(255) COMMENT '链接',
    `menu_ind`    TINYINT COMMENT '是否是菜单',
    `index`       TINYINT COMMENT '序号',
    `type`        TINYINT COMMENT '类型',
    `source`      TINYINT COMMENT '来源',
    `status`      TINYINT COMMENT '状态',
    `created_at`  DATETIME COMMENT '创建时间',
    `created_by`  BIGINT COMMENT '创建人',
    `updated_at`  DATETIME COMMENT '修改时间',
    `updated_by`  BIGINT COMMENT '修改时间',
    CONSTRAINT `pk_sys_permission_id` PRIMARY KEY (`id`)
);

/* 角色-权限关联表 */
CREATE TABLE `sys_role_permission` (
    `role_id`       BIGINT NOT NULL,
    `permission_id` BIGINT NOT NULL,
    `created_at`    DATETIME,
    `created_by`    BIGINT,
    CONSTRAINT `pk_sys_role_permission_id` PRIMARY KEY (`role_id`, `permission_id`)
);
/* 权限-访问控制相关 --------------------------------------------------------------------------------------------------- */


/* 组织架构相关 ------------------------------------------------------------------------------------------------------- */
/* 部门表 */
CREATE TABLE `sys_department` (
    `id`          BIGINT                    NOT NULL,
    `org_id`      BIGINT COMMENT '机构ID'     NOT NULL,
    `code`        VARCHAR(150) COMMENT '编号' NOT NULL,
    `title`       VARCHAR(150) COMMENT '标题' NOT NULL,
    `description` VARCHAR(255) COMMENT '简介说明',
    `root_ind`    TINYINT              DEFAULT 0,
    `default_ind` TINYINT              DEFAULT 0,
    `type`        TINYINT COMMENT '类型' DEFAULT 1,
    `source`      TINYINT COMMENT '来源',
    `status`      TINYINT COMMENT '状态',
    `created_at`  DATETIME COMMENT '创建时间',
    `created_by`  BIGINT COMMENT '创建人',
    `updated_at`  DATETIME COMMENT '修改时间',
    `updated_by`  BIGINT COMMENT '修改时间',
    `deleted_at`  DATETIME COMMENT '删除时间',
    `deleted_by`  BIGINT COMMENT '删除人',
    CONSTRAINT `pk_sys_department_id` PRIMARY KEY (`id`)
);

/* 岗位表 */
CREATE TABLE `sys_position` (
    `id`          BIGINT                    NOT NULL,
    `org_id`      BIGINT COMMENT '机构ID'     NOT NULL,
    `code`        VARCHAR(150) COMMENT '编号' NOT NULL,
    `title`       VARCHAR(150) COMMENT '标题' NOT NULL,
    `description` VARCHAR(255) COMMENT '简介说明',
    `root_ind`    TINYINT              DEFAULT 0,
    `default_ind` TINYINT              DEFAULT 0,
    `type`        TINYINT COMMENT '类型' DEFAULT 2,
    `source`      TINYINT COMMENT '来源',
    `status`      TINYINT COMMENT '状态',
    `created_at`  DATETIME COMMENT '创建时间',
    `created_by`  BIGINT COMMENT '创建人',
    `updated_at`  DATETIME COMMENT '修改时间',
    `updated_by`  BIGINT COMMENT '修改时间',
    `deleted_at`  DATETIME COMMENT '删除时间',
    `deleted_by`  BIGINT COMMENT '删除人',
    CONSTRAINT `pk_sys_position_id` PRIMARY KEY (`id`)
);

/* 用户表 */
CREATE TABLE `sys_user` (
    `id`          BIGINT       NOT NULL,
    `org_id`      BIGINT       NOT NULL,
    `username`    VARCHAR(150) NOT NULL,
    `email`       VARCHAR(150) NULL,
    `mobile`      VARCHAR(150) NULL,
    `password`    VARCHAR(255) NULL,
    `salt`        VARCHAR(255) NULL,
    `nickname`    VARCHAR(255),
    `fullname`    VARCHAR(255),
    `description` VARCHAR(255),
    `type`        TINYINT COMMENT '类型' DEFAULT 3,
    `source`      TINYINT COMMENT '来源',
    `status`      TINYINT COMMENT '状态',
    `created_at`  DATETIME COMMENT '创建时间',
    `created_by`  BIGINT COMMENT '创建人',
    `updated_at`  DATETIME COMMENT '修改时间',
    `updated_by`  BIGINT COMMENT '修改时间',
    `deleted_at`  DATETIME COMMENT '删除时间',
    `deleted_by`  BIGINT COMMENT '删除人',
    CONSTRAINT `pk_sys_user_id` PRIMARY KEY (`id`)
);

/* 实体表 */
CREATE VIEW `sys_v_actor` (`id`, `type`, `status`, `uid`) AS
    SELECT
        `id`,
        `type`,
        `code`,
        `status`
    FROM `sys_department`
    UNION ALL
    SELECT
        `id`,
        `type`,
        `code`,
        `status`
    FROM `sys_position`
    UNION ALL
    SELECT
        `id`,
        `type`,
        `username`,
        `status`
    FROM `sys_user`;

/* 实体关联 */
CREATE TABLE `sys_actor_relation` (
    `id`         BIGINT  NOT NULL,
    `type`       VARCHAR(50),
    `parent_id`  BIGINT  NOT NULL,
    `child_id`   BIGINT  NOT NULL,
    `level`      INT     NOT NULL,
    `parent_ind` TINYINT NOT NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    CONSTRAINT `pk_sys_actor_relation_id` PRIMARY KEY (`id`)
);

CREATE INDEX `ix_sys_actor_relation`
    ON `sys_actor_relation` (`type`, `parent_id`, `child_id`, `parent_ind`);

/* 用户喜好 */
CREATE TABLE `sys_user_preference` (
    `id`                  BIGINT COMMENT 'ID'   NOT NULL,
    `user_id`             BIGINT COMMENT '用户ID' NOT NULL,
    `role_id`             BIGINT COMMENT '当前角色' NOT NULL,
    `theme`               VARCHAR(50) COMMENT '当前主题',
    `language`            VARCHAR(50) COMMENT '当前语言',
    `login_datetime`      DATETIME COMMENT '本次登录时间',
    `last_login_status`   VARCHAR(50) COMMENT '最近登录时间',
    `last_login_datetime` DATETIME COMMENT '最近登录状态',
    `created_at`          DATETIME COMMENT '创建时间',
    `created_by`          BIGINT COMMENT '创建人',
    `updated_at`          DATETIME COMMENT '更新时间',
    `updated_by`          BIGINT COMMENT '更新人',
    CONSTRAINT `pk_sys_user_preference_id` PRIMARY KEY (`id`)
);

/* 用户会话 */
CREATE TABLE `sys_user_session` (
    `id`                   BIGINT       NOT NULL,
    `session_id`           VARCHAR(255) NOT NULL,
    `username`             VARCHAR(255) NULL,
    `token`                VARCHAR(255) NOT NULL,
    `host`                 VARCHAR(255) NOT NULL,
    `device`               VARCHAR(255) NOT NULL,
    `last_access_datetime` DATETIME,
    `start_datetime`       DATETIME,
    `end_datetime`         DATETIME,
    CONSTRAINT `pk_sys_user_session_id` PRIMARY KEY (`id`)
);
/* 实体-组织架构相关 --------------------------------------------------------------------------------------------------- */

/* 多语言 ------------------------------------------------------------------------------------------------------------ */
/* 语言 */
CREATE TABLE `sys_lang` (
    `id`     BIGINT COMMENT 'ID'       NOT NULL,
    `lang`   VARCHAR(100) COMMENT '语言' NOT NULL,
    `active` TINYINT                   NOT NULL DEFAULT 1,
    CONSTRAINT `pk_sys_lang_id` PRIMARY KEY (`id`)
);

CREATE INDEX `ix_sys_lang`
    ON `sys_lang` (`lang`);

/* 多语言文本 */
CREATE TABLE `sys_lang_label` (
    `id`        BIGINT COMMENT 'ID'       NOT NULL,
    `type`      VARCHAR(50) COMMENT '类型'  NOT NULL,
    `target_id` BIGINT COMMENT '目标ID'     NOT NULL,
    `lang_id`   BIGINT COMMENT '语言ID'     NOT NULL,
    `label`     VARCHAR(255) COMMENT '文本' NOT NULL,
    CONSTRAINT `pk_sys_lang_label_id` PRIMARY KEY (`id`)
);

CREATE INDEX `ix_sys_lang_label`
    ON `sys_lang_label` (`target_id`, `lang_id`, `type`);
/* 多语言 ------------------------------------------------------------------------------------------------------------ */


/* 字典相关 ---------------------------------------------------------------------------------------------------------- */
/* 字典 */
CREATE TABLE `sys_dict` (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(255) NOT NULL,
    `name`        VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT `pk_sys_dict_id` PRIMARY KEY (`id`)
);

/* 字典明细 */
CREATE TABLE `sys_dict_item` (
    `id`          BIGINT       NOT NULL,
    `dict_id`     BIGINT       NOT NULL,
    `key`         VARCHAR(150) NOT NULL,
    `value`       VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT `pk_sys_dict_item_id` PRIMARY KEY (`id`)
);
/* 字典相关 ---------------------------------------------------------------------------------------------------------- */


/* 上传附件 ---------------------------------------------------------------------------------------------------------- */
/* 上传附件表 */
CREATE TABLE `sys_attachment` (
    `id`         BIGINT       NOT NULL,
    `type`       VARCHAR(255) NOT NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    `updated_at` DATETIME,
    `updated_by` BIGINT,
    CONSTRAINT `pk_sys_attachment_id` PRIMARY KEY (`id`)
);

/* 文件明细表 */
CREATE TABLE `sys_attachment_file` (
    `id`         BIGINT       NOT NULL,
    `uuid`       VARCHAR(255) NOT NULL,
    `filename`   VARCHAR(255) NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    `updated_at` DATETIME,
    `updated_by` BIGINT,
    CONSTRAINT `pk_sys_attachment_file_id` PRIMARY KEY (`id`)
);

/* 附件关联表 */
CREATE TABLE `sys_attachment_relation` (
    `id`            BIGINT       NOT NULL,
    `type`          VARCHAR(255) NOT NULL,
    `attachment_id` BIGINT       NOT NULL,
    `target_id`     BIGINT       NOT NULL,
    `created_at`    DATETIME,
    `created_by`    BIGINT,
    CONSTRAINT `pk_sys_attachment_relation_id` PRIMARY KEY (`id`)
);
/* 上传附件 ---------------------------------------------------------------------------------------------------------- */


/* 目录资源 ---------------------------------------------------------------------------------------------------------- */
/* 目录 */
CREATE TABLE `sys_catalog` (
    `id`          BIGINT       NOT NULL,
    `code`        VARCHAR(150) NOT NULL,
    `title`       VARCHAR(255) NULL,
    `description` VARCHAR(255) NOT NULL,
    `type`        VARCHAR(255) NOT NULL,
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT `pk_sys_catalog_id` PRIMARY KEY (`id`)
);

CREATE TABLE `sys_catalog_relation` (
    `id`         BIGINT NOT NULL,
    `parent_id`  BIGINT NOT NULL,
    `child_id`   BIGINT NOT NULL,
    `parent_ind` INT    NOT NULL,
    `level`      INT    NOT NULL,
    `created_at` DATETIME,
    `created_by` BIGINT,
    CONSTRAINT `fk_sys_catalog_relation_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `sys_catalog` (`id`),
    CONSTRAINT `fk_sys_catalog_relation_child_id` FOREIGN KEY (`child_id`) REFERENCES `sys_catalog` (`id`),
    CONSTRAINT `pk_sys_catalog_relation_id` PRIMARY KEY (`id`)
);

CREATE TABLE `sys_catalog_access` (
    `id`              BIGINT      NOT NULL,
    `access_type`     VARCHAR(50) NOT NULL,
    `access_role_id`  BIGINT      NOT NULL,
    `access_actor_id` BIGINT      NOT NULL,
    `created_at`      DATETIME,
    `created_by`      BIGINT,
    CONSTRAINT `pk_sys_catalog_access_id` PRIMARY KEY (`id`)
);

/* 资源表 */
CREATE TABLE `sys_resource` (
    `id`          BIGINT NOT NULL,
    `code`        VARCHAR(255),
    `title`       VARCHAR(255),
    `description` VARCHAR(255),
    `type`        VARCHAR(255),
    `created_at`  DATETIME,
    `created_by`  BIGINT,
    `updated_at`  DATETIME,
    `updated_by`  BIGINT,
    CONSTRAINT `pk_sys_resource_id` PRIMARY KEY (`id`)
);

CREATE TABLE `sys_resource_access` (
    `id`              BIGINT      NOT NULL,
    `access_type`     VARCHAR(50) NOT NULL,
    `access_role_id`  BIGINT      NOT NULL,
    `access_actor_id` BIGINT      NOT NULL,
    `created_at`      DATETIME,
    `created_by`      BIGINT,
    CONSTRAINT `fk_sys_resource_access_access_role_id` FOREIGN KEY (`access_role_id`) REFERENCES `sys_role` (`id`),
    CONSTRAINT `pk_sys_resource_access_id` PRIMARY KEY (`id`)
);
/* 目录资源 ---------------------------------------------------------------------------------------------------------- */


/* 系统设置 ---------------------------------------------------------------------------------------------------------- */
CREATE TABLE `sys_system_setting` (
    `id`         BIGINT       NOT NULL,
    `org_id`     BIGINT       NOT NULL,
    `key`        VARCHAR(150) NOT NULL,
    `value`      VARCHAR(255) NOT NULL,
    `updated_at` DATETIME,
    `updated_by` BIGINT,
    CONSTRAINT `pk_sys_system_setting_id` PRIMARY KEY (`id`)
);
/* 系统设置 ---------------------------------------------------------------------------------------------------------- */



/* 系统基础数据 ---------------------------------------------------------------------------------------------------------- */
/* 基础组织架构数据 */

/* 顶层机构 */
INSERT INTO `sys_organization` (`id`, `code`, `title`, `source`, `status`, `created_at`)
    VALUE (1, 'TOP_ORG', 'Root Organization', 1, 1, now());

/* 顶层部门 */
INSERT INTO `sys_department` (`id`, `org_id`, `code`, `title`, `source`, `status`, `root_ind`, `created_at`)
    VALUE (2, 1, 'TOP_DPT', 'Root Department', 1, 1, 1, now());

/* 临时部门，用于存放新注册用户 */
INSERT INTO `sys_department` (`id`, `org_id`, `code`, `title`, `source`, `status`, `default_ind`, `created_at`)
    VALUE (3, 1, 'TMP_DPT', 'Temp Department', 1, 1, 1, now());

/* 顶层岗位 */
INSERT INTO `sys_position` (`id`, `org_id`, `code`, `title`, `source`, `status`, `root_ind`, `created_at`)
    VALUE (4, 1, 'TOP_PST', 'All Positions', 1, 1, 1, now());

/* 未指定岗位 */
INSERT INTO `sys_position` (`id`, `org_id`, `code`, `title`, `source`, `status`, `default_ind`, `created_at`)
    VALUE (5, 1, 'UNSPECIFIED', 'Unspecified', 1, 1, 1, now());

/* 系统管理员 */
INSERT INTO `sys_user` (`id`, `org_id`,
                        `username`, `email`, `mobile`, `source`, `status`, `created_at`, `password`)
VALUES
    (6, 1, 'admin', 'admin@host.com', '13800138000', 1, 1, now(),
     '$2a$10$Fhcx0Fa9Vd/wgt1qDeCpBeFgXbPPU1J1QAPZbNCYxC29nQQyALnZ.');

/* ==================================== 角色权限基础数据 ==================================== */
/* 角色 */
INSERT INTO `sys_role` (`id`, `org_id`, `code`, `title`, `type`, `source`, `status`, `created_at`)
VALUES
    (1, 1, 'SADM', 'Super Administrator', 1, 1, 1, now()),
    (2, 1, 'ADM', 'Administrator', 2, 1, 1, now()),
    (3, 1, 'USR', 'User', 3, 1, 1, now());

/* 权限 */
INSERT INTO `sys_permission` (`id`, `type`, `parent_id`, `code`, `url`, `menu_ind`, `index`, `status`, `description`, `created_at`)
VALUES
    /* ==================================== 管理员 ==================================== */
    /* 站点管理 */
    (101, 3, 0, 'SITE_MGT', '', 1, 5, 1, '站点管理', now()),
    /* 公告管理 */
    (10101, 3, 101, 'ANNC_MGT', '/admin/announcement/index', 1, 1, 1, '公告管理', now()),
    (1010101, 3, 10101, 'ANNC_VIEW', '', 0, 1, 1, '查看公告', now()),
    (1010102, 3, 10101, 'ANNC_ADD', '', 0, 2, 1, '添加公告', now()),
    (1010103, 3, 10101, 'ANNC_EDIT', '', 0, 3, 1, '编辑公告', now()),
    (1010104, 3, 10101, 'ANNC_DEL', '', 0, 4, 1, '删除公告', now()),
    (1010105, 3, 10101, 'ANNC_COMMENT_MGT', '', 0, 5, 1, '公告评论管理', now()),
    /* 宣传栏管理 */
    (10102, 3, 101, 'POSTER_MGT', '/admin/poster/index', 1, 4, 1, '宣传栏管理', now()),
    (1010201, 3, 10102, 'POSTER_VIEW', '', 0, 1, 1, '查看宣传栏', now()),
    (1010202, 3, 10102, 'POSTER_ADD', '', 0, 2, 1, '添加宣传栏', now()),
    (1010203, 3, 10102, 'POSTER_EDIT', '', 0, 3, 1, '编辑宣传栏', now()),
    (1010204, 3, 10102, 'POSTER_DEL', '', 0, 4, 1, '删除宣传栏', now()),
    /* ---------- 系统管理 ---------- */
    (102, 2, 0, 'SYS_MGT', '', 1, 6, 1, '系统管理', now()),
    /* 部门管理 */
    (10201, 3, 102, 'DPT_MGT', '/admin/department/index', 1, 1, 1, '部门管理', now()),
    (1020101, 3, 10601, 'DPT_VIEW', '', 0, 1, 1, '查看部门', now()),
    (1020102, 3, 10601, 'DPT_ADD', '', 0, 2, 1, '添加部门', now()),
    (1020103, 3, 10601, 'DPT_EDIT', '', 0, 3, 1, '编辑部门', now()),
    (1020104, 3, 10601, 'DPT_DEL', '', 0, 4, 1, '删除部门', now()),
    /* 岗位管理 */
    (10202, 3, 102, 'PST_MGT', '/admin/position/index', 1, 2, 1, '岗位管理', now()),
    (1020201, 3, 10602, 'PST_VIEW', '', 0, 1, 1, '查看岗位', now()),
    (1020202, 3, 10602, 'PST_ADD', '', 0, 2, 1, '添加岗位', now()),
    (1020203, 3, 10602, 'PST_EDIT', '', 0, 3, 1, '编辑岗位', now()),
    (1020204, 3, 10602, 'PST_DEL', '', 0, 4, 1, '删除岗位', now()),
    /* 用户管理 */
    (10203, 3, 102, 'USR_MGT', '', 1, 3, 1, '用户管理', now()),
    (1020301, 3, 10603, 'USR_VIEW', '', 0, 1, 1, '查看用户', now()),
    (1020302, 3, 10603, 'USR_ADD', '', 0, 2, 1, '添加用户', now()),
    (1020303, 3, 10603, 'USR_EDIT', '', 0, 3, 1, '编辑用户', now()),
    (1020304, 3, 10603, 'USR_DEL', '', 0, 1, 4, '删除用户', now()),
    (1020305, 3, 10603, 'USR_IMPORT', '', 0, 5, 1, '导入用户', now()),
    (1020306, 3, 10603, 'USR_EXPORT', '', 0, 6, 1, '导出用户', now()),
    (1020307, 3, 10603, 'USR_RESET_PASSWORD', '', 0, 7, 1, '重置用户密码', now()),
    (1020308, 3, 10603, 'USR_INACTIVE_VIEW', '', 0, 8, 1, '查看非活动用户', now()),
    (1020309, 3, 10603, 'USR_INACTIVE_EDIT', '', 0, 9, 1, '编辑非活动用户', now()),
    /* 用户群管理 */
    (10204, 3, 102, 'USER_GROUP_MGT', '/admin/user/group/index', 1, 4, 1, '用户群管理', now()),
    (1020401, 3, 10204, 'USER_GROUP_VIEW', '', 0, 1, 1, '查看用户群', now()),
    (1020402, 3, 10204, 'USER_GROUP_ADD', '', 0, 2, 1, '添加用户群', now()),
    (1020403, 3, 10204, 'USER_GROUP_EDIT', '', 0, 3, 1, '编辑用户群', now()),
    (1020404, 3, 10204, 'USER_GROUP_DEL', '', 0, 4, 1, '删除用户群', now()),
    /* 角色管理 */
    (10205, 2, 102, 'SYS_ROLE_MGT', '/admin/role/index', 1, 9, 1, '角色权限管理', now()),
    (1020501, 2, 10205, 'SYS_ROLE_VIEW', '', 0, 1, 1, '查看角色', now()),
    (1020502, 2, 10205, 'SYS_ROLE_ADD', '', 0, 2, 1, '添加角色', now()),
    (1020503, 2, 10205, 'SYS_ROLE_EDIT', '', 0, 3, 1, '编辑角色', now()),
    (1020504, 2, 10205, 'SYS_ROLE_DEL', '', 0, 4, 1, '删除角色', now()),
    /* 机构管理 */
    (10206, 1, 102, 'ORG_MGT', '', 1, 8, 0, '机构管理', now()),
    (1020601, 1, 10206, 'ORG_VIEW', '', 0, 1, 0, '查看机构', now()),
    (1020602, 1, 10206, 'ORG_ADD', '', 0, 2, 0, '添加机构', now()),
    (1020603, 1, 10206, 'ORG_EDIT', '', 0, 3, 0, '编辑机构', now()),
    (1020604, 1, 10206, 'ORG_DEL', '', 0, 4, 0, '删除机构', now()),
    /* 系统设置 */
    (10207, 2, 102, 'SYS_SYSTEM_SETTING_MGT', '', 1, 10, 1, '系统设置', now()),
    (1020701, 2, 10207, 'SYS_SYSTEM_SETTING_VIEW', '', 0, 1, 1, '查看系统设置', now()),
    (1020702, 2, 10207, 'SYS_SYSTEM_SETTING_EDIT', '', 0, 2, 1, '修改系统设置', now()),
    /* 用户会话管理 */
    (10208, 2, 102, 'USER_SESSION_MGT', '/admin/user/session/index', 1, 12, 1, '用户会话管理', now()),
    (1020801, 2, 10208, 'USER_SESSION_VIEW', '', 0, 1, 1, '查看用户会话', now()),
    (1020802, 2, 10208, 'USER_SESSION_EDIT', '', 0, 2, 1, '编辑用户会话', now()),
    /* 消息管理 */
    (10209, 3, 102, 'MESSAGE_MGT', '/admin/message/index', 1, 15, 1, '消息管理', now()),
    (1020901, 3, 10209, 'MESSAGE_VIEW', '', 0, 1, 1, '查看消息模板', now()),
    (1020902, 3, 10209, 'MESSAGE_EDIT', '', 0, 2, 1, '编辑消息模板', now()),
    (1020903, 3, 10209, 'MESSAGE_MSG_VIEW', '', 0, 3, 1, '查看历史消息', now()),
    (1020904, 3, 10209, 'MESSAGE_MSG_EDIT', '', 0, 3, 1, '查看历史消息', now()),
    /* 标签管理 */
    (10210, 2, 102, 'TAG_MGT', '/admin/tag/index', 1, 16, 1, '标签管理', now()),
    (1021001, 2, 10210, 'TAG_VIEW', '', 0, 1, 1, '查看标签', now()),
    (1021002, 2, 10210, 'TAG_ADD', '', 0, 2, 1, '添加标签', now()),
    (1021003, 2, 10210, 'TAG_EDIT', '', 0, 3, 1, '编辑标签', now()),
    (1021004, 2, 10210, 'TAG_DEL', '', 0, 4, 1, '删除标签', now()),
    /* 字典管理 */
    (10211, 2, 102, 'DICT_MGT', '/admin/dict/index', 1, 7, 1, '字典管理', now()),
    (1021101, 2, 10211, 'DICT_VIEW', '', 0, 1, 1, '查看字典', now()),
    (1021102, 2, 10211, 'DICT_ADD', '', 0, 2, 1, '添加字典', now()),
    (1021103, 2, 10211, 'DICT_EDIT', '', 0, 3, 1, '编辑字典', now()),
    (1021104, 2, 10211, 'DICT_DEL', '', 0, 4, 1, '删除字典', now()),
    /* ==================================== 普通用户 ==================================== */
    /* 普通用户 */
    (201, 3, 0, 'USER', '', 1, 1, 0, '普通用户', now());

/* 系统管理员权限 */
INSERT INTO `sys_role_permission` (`permission_id`, `role_id`, `created_at`, `created_by`)
    SELECT
        `p`.`id`,
        `r`.`id`,
        now(),
        NULL
    FROM `sys_permission` `p`, `sys_role` `r`
    WHERE `r`.`type` = 1 AND `p`.`type` IN (1, 2, 3);

/* 管理员权限 */
INSERT INTO `sys_role_permission` (`permission_id`, `role_id`, `created_at`, `created_by`)
    SELECT
        `p`.`id`,
        `r`.`id`,
        now(),
        NULL
    FROM `sys_permission` `p`, `sys_role` `r`
    WHERE `r`.`type` = 2 AND `p`.`type` IN (2, 3);

/* 用户权限 */
INSERT INTO `sys_role_permission` (`permission_id`, `role_id`, `created_at`, `created_by`)
    SELECT
        `p`.`id`,
        `r`.`id`,
        now(),
        NULL
    FROM `sys_permission` `p`, `sys_role` `r`
    WHERE `r`.`type` = 3 AND `p`.`type` IN (3);

