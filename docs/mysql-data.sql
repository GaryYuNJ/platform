/* 基础组织架构数据 */

insert into `sys_organization` (`id`, `code`, `title`, `status`) values (1, 'Root', 'Top Organization', 'ON');

insert into `sys_department` (`id`, `code`, `title`, `status`) values (2, 'Root', 'All Department', 'ON');

insert into `sys_department` (`id`, `code`, `title`, `status`) values (3, 'RecyleBin', 'Recyle Bin', 'ON');

insert into `sys_position` (`id`, `code`, `title`, `status`) values (4, 'Root', 'All Position', 'ON');

insert into `sys_position` (`id`, `code`, `title`, `status`) values (5, 'Unspecified', 'Unspecified', 'ON');

insert into `sys_user` (`id`, `username`, `email`, `mobile`, `password`, `salt`, `status`)
values (6, 'root', 'root@elvea.cn', '13800138000', '', '', 'ON');
