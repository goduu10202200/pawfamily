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
					if(request.getParameter("order").equals("amount"))
					{
						out.print("<script> alert('你尚未選擇!');location.href='../index/index.jsp'; </script>");  		
					}
					else{
						int total=0;
						int left=0;
						int left2=0;
						int left3=0;
						int left4=0;
						int left5=0;
						int i=0;
						int j=100;
						int test_id=0;
						String productid = request.getParameter("product_id");
						String amount = request.getParameter("order");
						String product_name="";
						String product_price="";
						String product_total="";
						String shoppingcar_id="";
						String leftString;
						while(rs.next())
						{
							if(productid .equals(rs.getString("product_id")))
							{
								product_name=rs.getString("product_name");
								product_price=rs.getString("product_price");

								leftString = rs.getString("product_stock");
								left = Integer.parseInt(leftString);
								left2 = Integer.parseInt(amount);
								left3 = Integer.parseInt(rs.getString("product_price"));
								left4 = Integer.parseInt(amount);
								left5 = Integer.parseInt(amount);
								left = left - left2;
								total=left4*left3;
								product_total = String.valueOf(total);
								leftString = String.valueOf(left);
								//設定shoppingcar_id
								i = (int)(Math.random()*10);
								j=(int)(Math.random()*999);
								test_id=(i*j+left5)*left5;
								shoppingcar_id="A"+String.valueOf(test_id);
								session.setAttribute("shoppingcar_id", shoppingcar_id);//設定session.shoppingcar_id
								
								sql="UPDATE paw_goods set product_stock ="+left+" WHERE product_id="+rs.getString("product_id")+"";
								con.createStatement().execute(sql); 

								sql="insert shoppingcar(id,product_id, product_name,product_amount,product_price,product_total,shoppingcar_id) ";
								sql+="value ('" + session.getAttribute("id") + "', ";
								sql+="'"+rs.getString("product_id")+"', "; 
								sql+="'"+rs.getString("product_name")+"', "; 
								sql+="'"+amount+"', "; 
								sql+="'"+rs.getString("product_price")+"', ";
								sql+="'"+product_total+"', ";
								sql+="'"+shoppingcar_id+"')"; 
								//sql+="'"+session.getAttribute("total")+"')";   
								con.createStatement().execute(sql);
							}
						}
					}
					out.print("<script>alert('成功加入');location.href='../product/food.jsp'; </script>"); 
				%>

				
		</center>
	</body>
</html>