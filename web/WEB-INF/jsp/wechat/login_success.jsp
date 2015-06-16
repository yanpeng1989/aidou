<%-- 
    Document   : login_seccess
    Created on : 2015-6-14, 13:31:41
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JavaScript Test Zone -->
</script>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"></jsp:include>
    <body>
        <div class="main_contain">
            <div class="box">
                <div class="login-box">
                    <div class="login-title text-center">
                        <h1><small>选择操作</small></h1>
                    </div>
                    <div class="login-content ">
                        <div class="form">
                            <a href="/aidou/wechat/finished.do"><button  type="button" class="login_success_btn btn btn-primary btn-lg" >已完成订单</button></a><br/><br/><br/>
                            <a href="/aidou/wechat/unfinished.do"><button  type="button" class="login_success_btn btn btn-primary btn-lg" >未完成订单</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
    });
</script>

