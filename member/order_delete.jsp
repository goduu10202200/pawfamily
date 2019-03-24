<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>商品刪除</title>
</head>
<body>
<center>

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
			con.createStatement().execute("use pawfamily");
			sql="select * from order_form";
			ResultSet rs=con.createStatement().executeQuery(sql);
			String  delete_id = request.getParameter("delete");
			//String  delete_id[] = request.getParameterValues("delete");
			//String delete_id=new String(request.getParameter("delete").getBytes("ISO-8859-1"),"UTF-8");
		
			int left;
			String product_delete="";
			while(rs.next())
				{
				if( delete_id.equals(rs.getString(8))) 
					product_delete = rs.getString("order_id");
					sql = "delete from order_form where order_id='"+product_delete+"'";
					con.createStatement().execute(sql);  
				
					                      
//Step 4: 執行 SQL 指令	
            //sql = "delete from shippingcar where product_num='"+delete_num+"'";
			int no = con.createStatement().executeUpdate(sql);
			if(no>0)
				out.println("<script language='javascript'>alert(\"刪除成功，請重整頁面確認 !!\");window.close();</script>");
				}
			/*
			else if(request.getParameter("dele")=="")
				out.println("<script language='javascript'>alert(\"未填入欲刪除的商品編號 !!\");history.go(-1);</script>");
			else
				out.println("<script language='javascript'>alert(\"編號錯誤，請重新輸入 !!\");history.go(-1);</script>");
			*/
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  response.sendRedirect("order.jsp");
          // response.sendRedirect("productdata_manager.jsp");
          
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
</center>
</body>
</html>
