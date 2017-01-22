/* 基础组织架构数据 */

INSERT INTO `sys_organization` (`id`, `code`, `title`, `status`) VALUES (1, 'Root', 'Top Organization', 'ON');

INSERT INTO `sys_department` (`id`, `code`, `title`, `status`) VALUES (2, 'Root', 'All Department', 'ON');

INSERT INTO `sys_department` (`id`, `code`, `title`, `status`) VALUES (3, 'RecyleBin', 'Recyle Bin', 'ON');

INSERT INTO `sys_position` (`id`, `code`, `title`, `status`) VALUES (4, 'Root', 'All Position', 'ON');

INSERT INTO `sys_position` (`id`, `code`, `title`, `status`) VALUES (5, 'Unspecified', 'Unspecified', 'ON');

INSERT INTO `sys_user` (`id`, `username`, `email`, `mobile`, `password`, `salt`, `status`)
VALUES (6, 'root', 'root@elvea.cn', '13800138000', '', '', 'ON');
