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
    <style type="text/css">
        #jump {
            position:absolute;
            top:50%;
            left:50%;
            width:480px;
            height:140px;
            padding:20px;
            padding-top:30px;
            margin:-95px 0 0 -260px;
            background:#fff;
            -webkit-border-radius:4px;
            -moz-border-radius:4px;
            border-radius:4px;
            -webkit-box-shadow:0 0px 6px rgba(0, 0, 0, 0.8);
            -moz-box-shadow:0 0px 6px rgba(0, 0, 0, 0.8);
            box-shadow:0px 0px 6px rgba(0, 0, 0, 0.8);
        }
        .content {
            position:relative;
            width:300px;
            height:140px;
            overflow:auto;
            padding-left:35%;
        }

        .content h2 {
            line-height:40px;
            color:red;
            padding-top:10px;
        }
        #info, #jump-link {
            font:14px "Microsoft YaHei", Verdana, Arial, Geneva, sans-serif;
            line-height:30px;
        }
        #time {
            color:#0033ff;
            font:14px Verdana, Arial, Geneva, sans-serif;
        }
    </style>
</head>

<body>
    <div id="jump">
        <div class="content">
            <h2>操作完成</h2>
            <p id="jump-link"> 
                页面&nbsp;<span id="time">0</span>&nbsp;秒后跳转
            </p>
        </div>
    </div>
    <script type="text/javascript">
        (function () {
            var win=window.open('', '_self', '');
            win.close();
        })(window);
    </script>
</body>
</html>
