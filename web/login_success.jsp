<%--
  Created by IntelliJ IDEA.
  User: Chenzh
  Date: 2019/2/20
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <center>
        <h1>登录操作</h1><hr>
        <h2>登录成功</h2>
        <h2>欢迎<font color="red"><%=request.getParameter("uname")%></font>光临！</h2>
    </center>
</body>
</html>
