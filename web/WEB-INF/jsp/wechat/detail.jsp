<%-- 
    Document   : orderlist
    Created on : 2015-5-4, 10:54:50
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JavaScript Test Zone -->
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"></jsp:include>
        <body>
            <!--管理员确认模态框-->
            <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">如果确认订单，请在下方输入授权码</h4>
                        </div>
                        <div class="modal-body">
                            <form id="confirmForm" name="confirmForm" action="/aidou/wechat/confirmForm.do" method="post">
                                <div class="form-group">
                                    <select name="order_msg" class="form-control">
                                        <option value="订单无误" selected="selected">订单无误</option>
                                        <option value="订单有误" selected="selected">订单有误</option>
                                    </select>
                                    <input id="author_1" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                    <input name="order_id" value="${id}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="confirm_btn" type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!--生产人员操作框-->
        <div class="modal fade" id="production_predictModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">预计完成生产时间，请在下方输入授权码</h4>
                    </div>
                    <div class="modal-body">
                        <form id="production_predictForm" name="production_predictForm" action="/aidou/wechat/production_predictForm.do" method="post">
                            <div class="form-group">
                                <input id="production_predict_time" type="text" name="production_predict_time" class="form-control" id="recipient-name" placeholder="预计生产完成时间">
                                <input id="author_2" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                <input name="order_id" value="${id}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="production_predict_btn" type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!--生产人员操作模态框-->
        <div class="modal fade" id="production_completedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">如果已完成本订单的生产，请在下方输入授权码，点击确认</h4>
                    </div>
                    <div class="modal-body">
                        <form id="production_completedForm" name="production_completedForm" action="/aidou/wechat/production_completedForm.do" method="post">
                            <div class="form-group">
                                <input id="author_3" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                <input  name="order_id" value="${id}" hidden="true">
                                <input  name="order_status" value="${order_status}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="production_completed_btn" type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <!--管理人员操作模态框-->
        <div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">如果订单有修改，请在下方输入授权码，删除本订单，重新下单</h4>
                    </div>
                    <div class="modal-body">
                        <form id="changeForm" name="changeForm" action="/aidou/wechat/changeForm.do" method="post">
                            <div  class="form-group">
                                <select name="order_msg" class="form-control" >
                                    <option value="订单无误" selected="selected">订单无误</option>
                                    <option value="订单有误" selected="selected">订单有误</option>
                                </select>
                                <input id="author_4" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                <input name="order_id" value="${id}" hidden="true">
                                <input  name="order_status" value="${order_status}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="change_btn" type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!--管理人员操作框-->
        <div class="modal fade" id="agree_sendModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">如果同意发货，请在下方输入授权码</h4>
                    </div>
                    <div class="modal-body">
                        <form id="agree_sendForm" name="agree_sendForm" action="/aidou/wechat/agree_sendForm.do" method="post">
                            <div class="form-group">
                                <input id="author_5" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                <input name="order_id" value="${id}" hidden="true">
                                <input  name="order_status" value="${order_status}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="agree_send_btn" type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!--发货人员模态框-->
        <div class="modal fade" id="sendModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">请补充发货信息，输入授权码确认</h4>
                    </div>
                    <div class="modal-body">
                        <form id="sendForm" name="sendForm" action="/aidou/wechat/sendForm.do" method="post">
                            <div class="form-group">
                                <input id="freight_number" type="text" name="freight_number" class="form-control" placeholder="运费金额">
                                <select id="freight_type" name="freight_type" class="form-control" placeholder="运费形式">
                                    <option value="物流垫付" selected="selected">物流垫付</option>
                                    <option value="客户垫付" selected="selected">客户垫付</option>
                                    <option value="客户自理" selected="selected">客户自理</option>
                                </select>
                                <input id="reach_time" type="text" name="reach_time" class="form-control" placeholder="预计到达时间">
                                <input id="author_6" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                <input name="order_id" value="${id}" hidden="true">
                                <input  name="order_status" value="${order_status}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="send_btn" type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <!--销售人员模态框-->
        <div class="modal fade" id="order_completedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">如果经销商收到货物，请输入授权码确认完成本订单</h4>
                    </div>
                    <div class="modal-body">
                        <form id="order_completedForm" name="order_completedForm" action="/aidou/wechat/order_completedForm.do" method="post">
                            <div class="form-group">
                                <input id="author_7" type="text" name="author" class="form-control" id="recipient-name" placeholder="授权码">
                                <input name="order_id" value="${id}" hidden="true">
                                <input  name="order_status" value="${order_status}" hidden="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="order_completed_btn" type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_contain">
            <table class="table table-hover">
                <tr>
                    <td>品牌</td>
                    <td>品名</td>
                    <td>规格</td>
                    <td>数量</td>
                </tr>
                <c:forEach var="subDatail" items="${subDatail}">
                    <tr>
                        <td>${subDatail.brand}</td>
                        <td>${subDatail.proname}</td>
                        <td>${subDatail.label}</td>
                        <td>${subDatail.amount}</td>
                    </tr>
                </c:forEach>
            </table>
            <table style="text-align: left" class="detail_table table table-hover table-bordered">
                <c:forEach var="fubDatail" items="${fubDatail}">
                    <tr>
                        <td>
                            <label style="width: 50%">下单时间：${fubDatail.order_time}</label>
                            <label style="width: 45%">更新时间：${fubDatail.update_time}</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label style="width: 95%">备注：${fubDatail.comment}</label></td>
                    </tr>
                    <tr>
                        <td><label style="width: 95%">预计完成生产时间：${fubDatail.production_predict_time}</label></td>
                    </tr>
                    <tr>
                        <td>
                            <label style="width: 50%">经销商：${fubDatail.merchant_name}</label>
                            <label style="width: 45%">电话：${fubDatail.merchant_tel}</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label style="width: 95%">地址：${fubDatail.merchant_address}</label></td>
                    </tr>
                    <tr>
                        <td>
                            <label style="width: 50%">运费形式：${fubDatail.freight_type}</label>
                            <label style="width: 45%">运费金额：${fubDatail.freight_number}</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label style="width: 95%">预计到达：${fubDatail.reach_time}</label></td>
                    </tr>
                    <tr>
                        <td>
                            <label style="width: 50%">业务人员：${name}</label>
                            <label style="width: 45%">电话：${fubDatail.man_telephone}</label>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div>
            <button type="button" id="step_1" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#confirmModal" >订单确认</button>
            <button type="button" id="step_2" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#production_predictModal" >生产预计</button>
            <button type="button" id="step_3" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#production_completedModal" >生产完毕</button>
        </div>
        <br/>
        <div>
            <button type="button" id="step_4" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#changeModal" >订单调整</button>
            <button type="button" id="step_5" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#agree_sendModal" >同意发货</button>
            <button type="button" id="step_6" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#sendModal" >订单发货</button>
        </div>
        <br/>
        <div>
            <button type="button" id="step_7" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#order_completedModal" >订单完成</button>
        </div>
        <input id="key_label" value="${order_status}" hidden="true">
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#confirmModal").on('shown.bs.modal', function () {
            $("#confirm_btn").click(function () {
                if ($("#author_1").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $("#confirmForm").submit();
                }
            });
        });

        $("#production_predictModal").on('shown.bs.modal', function () {
            $('#production_predict_btn').click(function () {
                if ($("#author_2").val() == "") {
                    alert("请输入授权码！");
                } else if ($("#production_predict_time").val() == "") {
                    alert("请输入预计完成时间！");
                } else {
                    $('#production_predictForm').submit();
                }
            });
        });
        $("#production_completedModal").on('shown.bs.modal', function () {
            $('#production_completed_btn').click(function () {
                if ($("#author_3").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#production_completedForm').submit();
                }
            });
        });
        $("#changeModal").on('shown.bs.modal', function () {
            $('#change_btn').click(function () {
                if ($("#author_4").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#changeForm').submit();
                }
            });
        });
        $("#agree_sendModal").on('shown.bs.modal', function () {
            $('#agree_send_btn').click(function () {
                if ($("#author_5").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#agree_sendForm').submit();
                }
            });
        });
        $("#sendModal").on('shown.bs.modal', function () {
            $('#send_btn').click(function () {
                if ($("#freight_number").val() == "") {
                    alert("请输入运费金额！");
                } else if ($("#reach_time").val() == "") {
                    alert("请输入预计到达时间！");
                } else if ($("#author_6").val() == "") {
                    alert("请输入授权码！");
                } else if ($("#freight_type").val() == "") {
                    alert("请输入运费形式！");
                } else {
                    $('#sendForm').submit();
                }
            });
        });
        $("#order_completedModal").on('shown.bs.modal', function () {
            $('#order_completed_btn').click(function () {
                if ($("#author_7").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#order_completedForm').submit();
                }
            });
        });
        var order_status = $("#key_label").val();
        if (order_status == "已下单") {
            $("#step_2").attr('disabled', "true");
            $("#step_3").attr('disabled', "true");
            $("#step_4").attr('disabled', "true");
            $("#step_5").attr('disabled', "true");
            $("#step_6").attr('disabled', "true");
            $("#step_7").attr('disabled', "true");
        } else if (order_status == "已确认") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_3").attr('disabled', "true");
            $("#step_4").attr('disabled', "true");
            $("#step_5").attr('disabled', "true");
            $("#step_6").attr('disabled', "true");
            $("#step_7").attr('disabled', "true");
        }
        else if (order_status == "预计生产") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_2").attr('disabled', "true");
            $("#step_2").css("background-color", "#FF0000");
            $("#step_4").attr('disabled', "true");
            $("#step_5").attr('disabled', "true");
            $("#step_6").attr('disabled', "true");
            $("#step_7").attr('disabled', "true");
        } else if (order_status == "生产完毕") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_2").attr('disabled', "true");
            $("#step_2").css("background-color", "#FF0000");
            $("#step_3").attr('disabled', "true");
            $("#step_3").css("background-color", "#FF0000");
            $("#step_5").attr('disabled', "true");
            $("#step_6").attr('disabled', "true");
            $("#step_7").attr('disabled', "true");
        } else if (order_status == "订单无改变") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_2").attr('disabled', "true");
            $("#step_2").css("background-color", "#FF0000");
            $("#step_3").attr('disabled', "true");
            $("#step_3").css("background-color", "#FF0000");
            $("#step_4").attr('disabled', "true");
            $("#step_4").css("background-color", "#FF0000");
            $("#step_6").attr('disabled', "true");
            $("#step_7").attr('disabled', "true");
        } else if (order_status == "允许发货") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_2").attr('disabled', "true");
            $("#step_2").css("background-color", "#FF0000");
            $("#step_3").attr('disabled', "true");
            $("#step_3").css("background-color", "#FF0000");
            $("#step_4").attr('disabled', "true");
            $("#step_4").css("background-color", "#FF0000");
            $("#step_5").attr('disabled', "true");
            $("#step_5").css("background-color", "#FF0000");
            $("#step_7").attr('disabled', "true");
        } else if (order_status == "订单发货") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_2").attr('disabled', "true");
            $("#step_2").css("background-color", "#FF0000");
            $("#step_3").attr('disabled', "true");
            $("#step_3").css("background-color", "#FF0000");
            $("#step_4").attr('disabled', "true");
            $("#step_4").css("background-color", "#FF0000");
            $("#step_5").attr('disabled', "true");
            $("#step_5").css("background-color", "#FF0000");
            $("#step_6").attr('disabled', "true");
            $("#step_6").css("background-color", "#FF0000");
        } else if (order_status == "订单完成") {
            $("#step_1").attr('disabled', "true");
            $("#step_1").css("background-color", "#FF0000");
            $("#step_2").attr('disabled', "true");
            $("#step_2").css("background-color", "#FF0000");
            $("#step_3").attr('disabled', "true");
            $("#step_3").css("background-color", "#FF0000");
            $("#step_4").attr('disabled', "true");
            $("#step_4").css("background-color", "#FF0000");
            $("#step_5").attr('disabled', "true");
            $("#step_5").css("background-color", "#FF0000");
            $("#step_6").attr('disabled', "true");
            $("#step_6").css("background-color", "#FF0000");
            $("#step_7").attr('disabled', "true");
            $("#step_7").css("background-color", "#FF0000");
        }
    });
</script>

