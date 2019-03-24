<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>revise_member_check</title>
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
		   String old_id=new String(request.getParameter("a1").getBytes("ISO-8859-1"),"UTF-8");
           String new_pwd=new String(request.getParameter("b1").getBytes("ISO-8859-1"),"UTF-8");
		   String new_name=new String(request.getParameter("c1").getBytes("ISO-8859-1"),"UTF-8");
           //String new_gender=new String(request.getParameter("d1").getBytes("ISO-8859-1"),"UTF-8");
		   String new_tel=new String(request.getParameter("e1").getBytes("ISO-8859-1"),"UTF-8");	
		   String new_mail=new String(request.getParameter("f1").getBytes("ISO-8859-1"),"UTF-8");
		   String new_address=new String(request.getParameter("g1").getBytes("ISO-8859-1"),"UTF-8");		   

		   
//Step 4: 執行 SQL 指令	
            sql = "update member set";
            sql+=" pwd='"+new_pwd+"',";
			sql+="name='"+new_name+"',";
			//sql+="gender='"+new_gender+"',";
			sql+="phone='"+new_tel+"',";
			sql+="mail='"+new_mail+"',";			
			sql+="address='"+new_address+"'";
			sql+=" where id='"+old_id+"'";
			
			int no = con.createStatement().executeUpdate(sql);
			if(no>0)
%>
<%				
				 //out.println("<script language='javascript'>alert(\"修改成功 !!\");window.location.href='User.jsp';</script>");
			
%>
</p>
<%				
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("../member/member_information.jsp");
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
