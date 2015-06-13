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
                                    订单情况<select name="order_msg" class="form-control">
                                        <option value="订单无误" selected="selected">订单无误</option>
                                        <option value="订单有误" selected="selected">订单有误</option>
                                    </select>
                                    授权码<input id="author_1" type="text" name="author" class="form-control" id="recipient-name">
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
                                授权码<input id="author_2" type="text" name="author" class="form-control" id="recipient-name">
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
                                订单情况<select name="order_msg" class="form-control">
                                    <option value="订单无误" selected="selected">订单无误</option>
                                    <option value="订单有误" selected="selected">订单有误</option>
                                </select>
                                授权码<input id="author_3" type="text" name="author" class="form-control" id="recipient-name">
                                <input name="order_id" value="${id}" hidden="true">
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
                                运费金额<input id="freight_number" type="text" name="freight_number" class="form-control">
                                运费形式<select id="freight_type" name="freight_type" class="form-control">
                                    <option value="物流垫付" selected="selected">物流垫付</option>
                                    <option value="客户垫付" selected="selected">客户垫付</option>
                                    <option value="客户自理" selected="selected">客户自理</option>
                                </select>
                                预计到达时间<input id="reach_time" type="text" name="reach_time" class="form-control">
                                授权码<input id="author_4" type="text" name="author" class="form-control" id="recipient-name">
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
                                授权码<input id="author_5" type="text" name="author" class="form-control" id="recipient-name">
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
            <table class="detail_table table table-hover">
                <c:forEach var="fubDatail" items="${fubDatail}">
                    <tr>
                        <td>下单时间：${fubDatail.order_time}</td>
                        <td>更新时间：${fubDatail.update_time}</td>
                    </tr>
                    <tr>
                        <td>经销商：${fubDatail.merchant_name}</td>
                        <td> 电话：${fubDatail.merchant_tel}</td>
                    </tr>
                    <tr>
                        <td>地址：${fubDatail.merchant_address}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>运费形式：${fubDatail.freight_type}</td>
                        <td>运费金额：${fubDatail.freight_number}</td>
                    </tr>
                    <tr>
                        <td>预计到达：${fubDatail.reach_time}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>业务人员：${name}</td>
                        <td>电话：${fubDatail.man_telephone}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div>
            <button type="button" id="confirm" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#confirmModal" >订单确认</button>
            <button type="button" id="production_completed" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#production_completedModal" >生产预计</button>
            <button type="button" id="production_completed" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#production_completedModal" >生产完毕</button>
            <button type="button" id="change" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#changeModal" >订单调整</button>
            <button type="button" id="change" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#changeModal" >同意发货</button>
            <button type="button" id="send" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#sendModal" >订单发货</button>
            <button type="button" id="order_completed" class="btn_detail btn btn-primary" data-toggle="modal" data-target="#order_completedModal" >订单完成</button>
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
        $("#production_completedModal").on('shown.bs.modal', function () {
            $('#production_completed_btn').click(function () {
                if ($("#author_2").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#production_completedForm').submit();
                }
            });
        });
        $("#changeModal").on('shown.bs.modal', function () {
            $('#change_btn').click(function () {
                if ($("#author_3").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#changeForm').submit();
                }
            });
        });
        $("#sendModal").on('shown.bs.modal', function () {
            $('#send_btn').click(function () {
                if ($("#freight_number").val() == "") {
                    alert("请输入运费金额！");
                } else if ($("#reach_time").val() == "") {
                    alert("请输入预计到达时间！");
                } else if ($("#author_4").val() == "") {
                    alert("请输入授权码！");
                } else {
                    $('#sendForm').submit();
                }
            });
        });
        $("#order_completedModal").on('shown.bs.modal', function () {
            $('#order_completed_btn').click(function () {
                $('#order_completedForm').submit();
            });
        });
        var order_status = $("#key_label").val();
        if (order_status == "已确认") {
            $("#confirm").attr('disabled', "true");
        }
        else if (order_status == "生产完毕") {
            $("#confirm").attr('disabled', "true");
            $("#production_completed").attr('disabled', "true");
        } else if (order_status == "订单无改变") {
            $("#confirm").attr('disabled', "true");
            $("#production_completed").attr('disabled', "true");
            $("#change").attr('disabled', "true");
        } else if (order_status == "订单发货") {
            $("#confirm").attr('disabled', "true");
            $("#production_completed").attr('disabled', "true");
            $("#change").attr('disabled', "true");
            $("#send").attr('disabled', "true");
        } else if (order_status == "订单完成") {
            $("#confirm").attr('disabled', "true");
            $("#production_completed").attr('disabled', "true");
            $("#change").attr('disabled', "true");
            $("#send").attr('disabled', "true");
            $("#order_completed").attr('disabled', "true");
        }
    });
</script>

