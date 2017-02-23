<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="navbar-custom-menu">
    <ul class="nav navbar-nav">
        <li class="dropdown">
            <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown"
               class="dropdown-toggle" href="#">
                <i class="glyphicon glyphicon-envelope"></i>
            </a>
        </li>
        <li class="dropdown">
            <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown"
               class="dropdown-toggle" href="#">
                <i class="glyphicon glyphicon-bell"></i>
            </a>
        </li>
        <li class="dropdown">
            <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown"
               class="dropdown-toggle" href="#">
                <i class="glyphicon glyphicon-user"></i>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#">个人资料</a></li>
                <li><a href="#">修改密码</a></li>
                <li class="divider" role="separator"></li>
                <li><a href="${ctx}/logout">退出</a></li>
            </ul>
        </li>
        <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
        </li>
    </ul>
</div>

