··<%--
  Created by IntelliJ IDEA.
  User: Chenzh
  Date: 2019/2/20
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" language="java" import="java.sql.*"%>

<html>
<head>
    <%--<meta charset="UTF-8">--%>
    <title>Title</title>
</head>
<body>
    <%!
        public static final String DBDRIVER = "com.mysql.jdbc.Driver";     /*定义数据库的驱动程序*/
        public static final String DBURL = "jdbc:mysql://localhost/mldn?useSSL=false";/*数据库的连接地址*/
        public static final String DBUSER = "root";/*数据库的连接用户名*/
        public static final String DBPASS = "1234";/*数据库的密码*/
    %>
    <%
        Connection conn = null;/*申明数据库的连接对象*/
        PreparedStatement pstmt = null;/*申明数据库操作*/
        ResultSet rs = null;/*申明数据库的结果集*/
        boolean flag = false;/*定义标志位，方便判断是否登录成功，跳转到指定页面*/
        String name = null;/*接受用户的姓名*/
    %>
    <%
        try {
            Class.forName(DBDRIVER);/*加载数据库的驱动程序*/
            conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);/*取得数据库的连接*/
            String sql = "SELECT name FROM user WHERE userid = ? AND password = ?";/*SQL查询语句*/
            pstmt = conn.prepareStatement(sql);/*实例化数据库的操作对象*/
            pstmt.setString(1, request.getParameter("id"));/*设置查询所需要的内容*/
            pstmt.setString(2, request.getParameter("password"));
            rs = pstmt.executeQuery();/*执行查询*/
            if (rs.next()) {/*如果查询到了，则表示正确的用户*/
                name = rs.getString(1);/*取出姓名*/
                flag = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        finally {
            try{
                /*正着打开，倒着关闭（22行-24行）*/
                rs.close();
                pstmt.close();
                conn.close();
            }catch (Exception e){}
        }
    %>
    <%
        if (flag) {/*成功，则跳转到成功登录页*/
    %>
        <jsp:forward page="login_success.jsp">
            <jsp:param name="uname" value="<%=name%>"/>
        </jsp:forward>
    <%
        }else{
    %>
        <jsp:forward page="failure.html"/>
    <%
        }
    %>
</body>
</html>
