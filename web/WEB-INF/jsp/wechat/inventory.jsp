<%-- 
    Document   : order
    Created on : 2015-4-27, 19:52:22
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JavaScript Test Zone -->
</script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
        <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet" />
        <link href="<c:url value='/css/bootstrap-theme.css' />" rel="stylesheet" />
        <link href="<c:url value='/css/main.css' />" rel="stylesheet" />
        <script src="/aidou/javascript/jquery-2.1.1.min.js"></script>
        <script src="/aidou/javascript/bootstrap.min.js"></script>
        <script src="/aidou/javascript/main.js"></script>
        <title></title>
    </head>
    <body>
        <div class="main_contain">
            <ul class="nav nav-pills">
                <li id="aidou_btn" role="presentation" class="active button_style"><a href="#">艾豆</a></li>
                <li id="zhaodajie_btn" role="presentation" class="button_style"><a href="#">赵大姐</a></li>
                <li id="other_btn" role="presentation" class=" button_style"><a href="#">其他</a></li>
            </ul>
            <div id="aidou">
                <table class="order_table table table-hover">
                    <c:forEach var="aidou" items="${aidou}">
                        <tr>
                            <td class="order_td_0">${aidou.id}</td>
                            <td class="order_td_0">${aidou.brand}</td>
                            <td class="order_td_1">${aidou.proname}</td>
                            <td class="order_td_2">${aidou.label}</td>
                            <td class="order_td_3"cla><input type="text" name="${aidou.id}" min="0" class="form-control stepper" placeholder="0"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="zhaodajie">
                <table class="order_table table table-hover">
                    <c:forEach var="zhaodajie" items="${zhaodajie}">
                        <tr>
                            <td class="order_td_0">${zhaodajie.id}</td>
                            <td class="order_td_0">${zhaodajie.brand}</td>
                            <td class="order_td_1">${zhaodajie.proname}</td>
                            <td class="order_td_2">${zhaodajie.label}</td>
                            <td class="order_td_3"cla><input type="text" name="${zhaodajie.id}" min="2" class="stepper form-control" placeholder="0"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="other">
                <table class="order_table table table-hover">
                    <c:forEach var="other" items="${other}">
                        <tr>
                            <td class="order_td_0">${other.id}</td>
                            <td class="order_td_0">${other.brand}</td>
                            <td class="order_td_1">${other.proname}</td>
                            <td class="order_td_2">${other.label}</td>
                            <td class="order_td_3"cla><input  type="text"  name="${other.id}" min="2" class="stepper form-control" placeholder="0"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#zhaodajie").hide();
        $("#other").hide();
        $("#aidou_btn").click(function () {
            $("#aidou").show();
            $("#aidou_btn").addClass("active");
            $("#zhaodajie_btn").removeClass("active");
            $("#other_btn").removeClass("active");
            $("#zhaodajie").hide();
            $("#other").hide();
        });
        $("#zhaodajie_btn").click(function () {
            $("#zhaodajie").show();
            $("#zhaodajie_btn").addClass("active");
            $("#aidou_btn").removeClass("active");
            $("#other_btn").removeClass("active");
            $("#aidou").hide();
            $("#other").hide();
        });
        $("#other_btn").click(function () {
            $("#other").show();
            $("#other_btn").addClass("active");
            $("#aidou_btn").removeClass("active");
            $("#zhaodajie_btn").removeClass("active");
            $("#aidou").hide();
            $("#zhaodajie").hide();
        });
    });
</script>
