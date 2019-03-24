<%@page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/config.jsp"%>
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
				sql="select * from paw_goods";
				ResultSet rs=con.createStatement().executeQuery(sql);
				%>
				<%
						String heart_id = request.getParameter("heart_id");
						String product_name="";
						String product_price="";
						while(rs.next())
						{
							if(session.getAttribute("heart_id") .equals(rs.getString(1)))
							{
								product_name=rs.getString("product_name");
								product_price=rs.getString("product_price");
								 	
								sql="insert heart(id,product_id, product_name,product_price) ";
								sql+="value ('" + session.getAttribute("id") + "', ";
								sql+="'"+rs.getString("product_id")+"', "; 
								sql+="'"+rs.getString("product_name")+"', "; 
								sql+="'"+rs.getString("product_price")+"')"; 
								con.createStatement().execute(sql);
							}
						}
					session.removeAttribute("heart_id");	
					out.print("<script>alert('成功加入');location.href='../index/index.jsp'; </script>"); 
				%>
		</center>
	</body>
</html>