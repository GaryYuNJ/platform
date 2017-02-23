<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../commons/taglibs.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title><sitemesh:write property='title'/></title>
        <%@ include file="../commons/meta.jsp" %>
        <%@ include file="../commons/meta.site.jsp" %>
        <sitemesh:write property='head'/>
    </head>
    <body class="hold-transition skin-blue layout-top-nav">
        <%@ include file="../include/site/nav.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 main">
                    <sitemesh:write property='body'/>
                </div>
                <%@ include file="../include/control-sidebar.jsp" %>
            </div>
        </div>
    </body>
</html>
