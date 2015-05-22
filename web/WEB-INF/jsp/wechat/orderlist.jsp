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
                <form  id="orderlist" name="orderlist" action="/aidou/wechat/writelist.do" method="post">
                    <table class="list_table table table-hover">
                        <tr>
                            <td>品牌</td>
                            <td>品名</td>
                            <td>规格</td>
                            <td>数量</td>
                        </tr>
                    <c:forEach var="list" items="${list}">
                        <tr>
                            <td>${list.brand}</td>
                            <td>${list.proname}</td>
                            <td>${list.label}</td>
                            <td>${list.amount}</td>
                        <input type="hidden" name="{list.id}" value="{list.amount}">
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>经销商：</td>
                        <td><input type="text" id="merchant_name" name="merchant_name" class="form-control" placeholder="经销商姓名"></td>
                        <td>电话：</td>
                        <td><input type="text" id="merchant_tel" name="merchant_tel" class="form-control" placeholder="经销商电话"></td>
                    </tr>
                    <tr>
                        <td>地址：</td>
                        <td><input type="text"id="merchant_address" name="merchant_address" class="form-control" placeholder="例如河南省郑州市高新区科学大道100号"></td>
                    </tr>
                    <tr>
                        <td>授权码：</td>
                        <td><input type="text" id="authority" name="authority"  class="form-control" placeholder="系统分配授权码"></td>
                    </tr>
                </table>
                <button id="order_btn" type="button" class="order_btn btn btn-primary btn-lg" >确认订单</button>
            </form>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#order_btn").click(function () {
            if($("#merchant_name").val()==""){
                alert("请输入经销商姓名！");
            }else if($("#merchant_tel").val()==""){
                alert("请输入经销商电话！");
            }else if($("#merchant_address").val()==""){
                alert("请输入经销商地址！");
            }else if($("#authority").val()==""){
                alert("请输入授权码！");
            }else{
                 $("#orderlist").submit();
            }
        });
    });
</script>
