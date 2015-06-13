<%-- 
    Document   : orderlist
    Created on : 2015-5-4, 10:54:50
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
                <table class="unfinished_table table table-hover ">
                    <tr>
                        <td class="unfinished_td_0">编号</td>
                        <td class="unfinished_td_1">业务员</td>
                        <td class="unfinished_td_1">经销商</td>
                        <td class="unfinished_td_2">数量</td>
                        <td class="unfinished_td_1">状态</td>
                        <td class="unfinished_td_3">详情</td>
                    </tr>
                <c:forEach var="unfinished" items="${unfinished}">
                    <tr>
                        <td class="unfinished_td_0">${unfinished.id}</td>
                        <td class="unfinished_td_1">${unfinished.man_telephone}</td>
                        <td class="unfinished_td_1">${unfinished.merchant_name}</td>
                        <td class="unfinished_td_2">${unfinished.sum}</td>
                        <td class="unfinished_td_1">${unfinished.order_status}</td>
                        <td class="unfinished_td_3"><a href="/aidou/wechat/detail.do?id=${unfinished.id}&name=${unfinished.man_telephone}"><button type="button" class="unfinished_btn btn btn-primary btn-lg" >详情</button></a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
    });
</script>
