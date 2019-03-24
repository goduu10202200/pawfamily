<%@page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use pawfamily";
con.createStatement().execute(sql);
%>
<html>
	<head>
		<title>購物車</title>
			
	</style>
	</head>
	<body>	
		<center>
				<%
				request.setCharacterEncoding("utf-8");
				request.getSession(true);
				sql="select * from heart";
				ResultSet rs=con.createStatement().executeQuery(sql);
				%>
				<%
						String heart_id = request.getParameter("heart_id");
						String product_name="";
						String product_price="";
						while(rs.next())
						{
							if(session.getAttribute("id") .equals(rs.getString(2)) && heart_id .equals(rs.getString(3)))
							{
								out.print("<script>alert('已經追蹤過');location.href='../index/index.jsp'; </script>"); 
							}
								/*
								out.println("<form id='form1' action='heart_add.jsp' method='post'>");
									
								out.print("</form>");
								out.print("<script type='text/javascript'>form1.submit();");
								out.print("</script>");
								*/
								
								//out.print("<script>location.href='../shoppingcar/heart_add.jsp'; </script>");
								 
							
						}
						session.setAttribute("heart_id", heart_id);//設定session.heart_id
						out.print("<script>location.href='../shoppingcar/heart_add.jsp'; </script>"); 
				%>
		</center>
	</body>
</html>