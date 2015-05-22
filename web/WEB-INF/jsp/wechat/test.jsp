<%-- 
    Document   : test
    Created on : 2015-5-3, 21:09:22
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/aidou/css/bootstrap.min.css" />
        <script type="text/javascript" src="/aidou/javascript/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="/aidou/javascript/bootstrap.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <button type="button" id="confirm" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal" >订单确认</button>
        <button type="button" id="production_completed" class="btn btn-primary" data-toggle="modal" data-target="#production_completedModal" >生产完毕</button>
        <button type="button" id="change" class="btn btn-primary" data-toggle="modal" data-target="#changeModal" >订单调整</button>
        <button type="button" id="send" class="btn btn-primary" data-toggle="modal" data-target="#sendModal" >订单发货</button>
        <button type="button" id="order_completed" class="btn btn-primary" data-toggle="modal" data-target="#order_completedModal" >订单完成</button>

        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">操作区域</h4>
                    </div>
                    <div class="modal-body">
                        <form id="confirm_form" name="confirm_form" action="/aidou/wechat/confirm_form.do" method="post">
                            <div id="confirm_div" class="form-group">
                                <label class="control-label">如果确认订单，请在下方输入授权码：</label>
                                <input type="text" name="author" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="operation_btn" type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="production_completedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">操作区域</h4>
                    </div>
                    <div class="modal-body">
                        <form id="operation" name="operation" method="">
                            <div id="production_completed_div" class="form-group">
                                <label class="control-label">如果已完成本订单的生产，请在下方输入授权码，点击确认：</label>
                                <input type="text" name="author" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">操作区域</h4>
                    </div>
                    <div class="modal-body">
                        <form id="operation" name="operation" method="">
                            <div id="change_div" class="form-group">
                                <label class="control-label">如果订单有修改，请在下方输入授权码，删除本订单，从新下单：</label>
                                <input type="text" name="author" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">订单正确</button>
                        <button type="button" class="btn btn-primary">订单有误</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="sendModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">操作区域</h4>
                    </div>
                    <div class="modal-body">
                        <form id="operation" name="operation" method="">
                            <div id="change_div" class="form-group">
                                <label class="control-label">请补充发货信息，输入授权码确认：</label>
                                运费形式：<input type="text" name="author" class="form-control" id="recipient-name">
                                预计到达时间：<input type="text" name="author" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="order_completedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">操作区域</h4>
                    </div>
                    <div class="modal-body">
                        <form id="operation" name="operation" method="">
                            <div id="change_div" class="form-group">
                                <label class="control-label">如果经销商收到货物，请输入授权码确认完成本订单：</label>
                                <input type="text" name="author" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <button id="key" type="button" class="btn btn-primary">确认</button>
        <input id="key_label" value="${key}" hidden="true">
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#confirmModal").on('shown.bs.modal', function () {
            $('#operation_btn').click(function () {
                $('#confirm_form').submit();
            });
        });
        $("#key").click(function () {
            {
                var key = $("#key_label").val();
                var uukey="uukey";
                if(key==uukey){
                    $("#confirm").attr('disabled',"true");
                }else{
                    alert("asdad")
                }
            }
        });


        $("#production_completedModal").modal(options);
        $("#sendModal").modal(options);
        $("#changeModal").modal(options);
        $("#order_completedModal").modal(options);
    });
</script>
