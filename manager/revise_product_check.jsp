<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../member/config.jsp" %>

<center>
<%
 
 
if(request.getParameter("product_id") !=null){
	
  
    sql = "SELECT * FROM paw_goods WHERE product_id='" +request.getParameter("product_id")+"'"; //選擇資料表
    ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next())
	{ 
        session.setAttribute("product_id",request.getParameter("product_id"));
        response.sendRedirect("revise_product_view.jsp") ;
    }
	else if(request.getParameter("product_id") =="" ){
		out.println("<script language='javascript'>alert(\"你尚未輸入欲修改之商品編號 !!\");window.location.href='../manager/food.jsp';</script>");
	}
    else
        out.println("<script language='javascript'>alert(\"無此商品編號，請重新輸入 !!\");window.location.href='../manager/food.jsp';</script>");
}
%>

</center>
