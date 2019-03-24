<%
    if(session.getAttribute("id") != null){            

		//request.getSession().removeAttribute( "id");
		//request.getSession(true).invalidate(); 
		
		session.removeAttribute("id");
        response.sendRedirect("../index/index.jsp") ;
	}else{
        out.println("登出成功!") ;
	}
%>

