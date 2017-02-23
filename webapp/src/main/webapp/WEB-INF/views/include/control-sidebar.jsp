<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../commons/taglibs.jsp" %>
<%-- 侧边控制栏 --%>
<div class="control-sidebar control-sidebar-dark">
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <div class="tab-content">
        <%-- 个人信息 --%>
        <div class="tab-pane" id="control-sidebar-home-tab">
            111
        </div>

        <%-- 功能设置 --%>
        <div class="tab-pane" id="control-sidebar-settings-tab">
            <%-- 语言 --%>
            <h4 class="control-sidebar-heading">语言</h4>
            <ul class="list-unstyled clearfix">
                <li>
                    <a href="javascript:void(0);" onclick="App.changeLang('zh_CN')">中文</a>
                </li>
                <li>
                    <a href="javascript:void(0);" onclick="App.changeLang('zh_TW')">繁体</a>
                </li>
                <li>
                    <a href="javascript:void(0);" onclick="App.changeLang('en_US')">英文</a>
                </li>
            </ul>

            <%-- 颜色主题 --%>
            <h4 class="control-sidebar-heading">Skins</h4>
            <ul class="list-unstyled clearfix">
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-blue"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px; background: #367fa9;"></span>
                            <span class="bg-light-blue"
                                  style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-black"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div style="box-shadow: 0 0 2px rgba(0,0,0,0.1)" class="clearfix">
                            <span style="display:block; width: 20%; float: left; height: 7px; background: #fefefe;"></span>
                            <span style="display:block; width: 80%; float: left; height: 7px; background: #fefefe;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #222;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-purple"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-purple-active"></span>
                            <span class="bg-purple" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-green"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-green-active"></span>
                            <span class="bg-green" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-red"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-red-active"></span>
                            <span class="bg-red" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-yellow"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-yellow-active"></span>
                            <span class="bg-yellow" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-blue-light"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px; background: #367fa9;"></span>
                            <span class="bg-light-blue"
                                  style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-black-light"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div style="box-shadow: 0 0 2px rgba(0,0,0,0.1)" class="clearfix">
                            <span style="display:block; width: 20%; float: left; height: 7px; background: #fefefe;"></span>
                            <span style="display:block; width: 80%; float: left; height: 7px; background: #fefefe;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-purple-light"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-purple-active"></span>
                            <span class="bg-purple" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-green-light"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-green-active"></span>
                            <span class="bg-green" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-red-light"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-red-active"></span>
                            <span class="bg-red" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
                <li style="float:left; width: 25%; padding: 5px;">
                    <a href="javascript:void(0);" data-skin="skin-yellow-light"
                       style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 7px;"
                                  class="bg-yellow-active"></span>
                            <span class="bg-yellow" style="display:block; width: 80%; float: left; height: 7px;"></span>
                        </div>
                        <div>
                            <span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
                            <span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="control-sidebar-bg"></div>
