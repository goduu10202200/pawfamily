<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>管理者|商品更新</title>
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
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
		   String old_id=new String(request.getParameter("product_id").getBytes("ISO-8859-1"),"UTF-8");
		   String new_class=new String(request.getParameter("product_class").getBytes("ISO-8859-1"),"UTF-8");
		   String new_name=new String(request.getParameter("product_name").getBytes("ISO-8859-1"),"UTF-8");
		   String new_price=new String(request.getParameter("product_price").getBytes("ISO-8859-1"),"UTF-8");
		   String new_stock=new String(request.getParameter("product_stock").getBytes("ISO-8859-1"),"UTF-8");
		   

		   
//Step 4: 執行 SQL 指令	
            sql = "update paw_goods set";
			sql+=" class_id='"+new_class+"',";
			sql+=" product_name='"+new_name+"',";
			sql+=" product_price='"+new_price+"',";
			sql+="product_stock='"+new_stock+"'";	
			sql+=" where product_id='"+old_id+"'";
			
			int no = con.createStatement().executeUpdate(sql);
			if(no>0)
%>

<%					
				out.println("<script language='javascript'>alert(\" 修改成功 \");window.location.href='../manager/product.jsp';</script>");
%>

<%					
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          // response.sendRedirect("cakeView.jsp");
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
