<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use pawback";//選擇資料庫
con.createStatement().execute(sql);
%>
<%
if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
	sql = "SELECT * FROM manager WHERE id='" +request.getParameter("id") + "'AND password='" + request.getParameter("pwd") + "'"  ; 
    ResultSet paperrs =con.createStatement().executeQuery(sql);
  
   //sql = "SELECT * FROM manager WHERE id='" +request.getParameter("id") + "'  AND pwd='" + request.getParameter("pwd") + "'"  ; //選擇資料表
    //ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next())
	{ 
        session.setAttribute("id",request.getParameter("id"));
        //out.println("登入成功");
		response.sendRedirect("manager_center.jsp") ;
    }
	else if(request.getParameter("id") =="" && request.getParameter("password") == ""){
		 out.println("<script language='javascript'>alert(\"帳號或密碼不得空白 !!\");window.location.href='manager.jsp';</script>");
	}
    else
        out.println("<script language='javascript'>alert(\"帳號或密碼不符 !!\");window.location.href='manager.jsp';</script>");
	
}
%>