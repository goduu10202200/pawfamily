<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
	<head>
	
		<title>管理者 新增商品</title>
		</head>

	<body>
	<%
	try {
	//Step 1: 載入資料庫驅動程式 
		Class.forName("com.mysql.jdbc.Driver");
		try {
	//Step 2: 建立連線 	
			String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","1234");
			if(con.isClosed())
				out.println("連線建立失敗");
			else {
	//Step 3: 選擇資料庫   
			sql="use pawfamily";
			con.createStatement().execute(sql);
			//從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
		   String new_id=new String(request.getParameter("product_id").getBytes("ISO-8859-1"));
		   String new_class=new String(request.getParameter("product_class").getBytes("ISO-8859-1"),"UTF-8");
		   String new_name=new String(request.getParameter("product_name").getBytes("ISO-8859-1"),"UTF-8");
		   String new_price=new String(request.getParameter("product_price").getBytes("ISO-8859-1"),"UTF-8");
		   String new_stock=new String(request.getParameter("product_stock").getBytes("ISO-8859-1"),"UTF-8");
	

	//Step 4: 執行 SQL 指令	
			sql="insert paw_goods (product_id, class_id, product_name, product_price,product_stock) ";
			sql+="value ('" +new_id + "', ";
			sql+="'"+new_class+"', ";
			sql+="'"+new_name+"', ";  
			sql+="'"+new_price+"', ";
			sql+="'"+new_stock+"')";      
	//out.println(sql);
			con.createStatement().executeUpdate(sql);
			
			out.println("<script language='javascript'>alert(\"新增成功 !!\");window.location.href='product.jsp';</script>");
	//Step 6: 關閉連線
			con.close();

				}
		}
		catch (SQLException sExec) {
			out.println("SQL錯誤"+sExec.toString());
			}
		}	
	catch (ClassNotFoundException err) {
			out.println("class錯誤"+err.toString());
		}
%>
	
	<center>


	
</body>
</html>
