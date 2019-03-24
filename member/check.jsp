<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%

if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
      
    
   sql = "SELECT * FROM member WHERE id='" +request.getParameter("id") + "'  AND pwd='" + request.getParameter("pwd") + "'"  ; 
    ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next()){            
        session.setAttribute("id",request.getParameter("id"));
        response.sendRedirect("../index/index.jsp") ;
    }
    else
        out.println("<script language='javascript'>alert(\"帳號或密碼不符 !!\");window.location.href='login.jsp';</script>");
}
%>

