<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>後台管理</title>
	<style>
	ul.drop-down-menu ul {
        border: #ccc 1px solid;
        position: absolute;
        z-index: 99;
        left: -1px;
        top: 100%;
       min-width: 180px;
    }

    ul.drop-down-menu ul li {
        border-bottom: #ccc 1px solid;
    }

    ul.drop-down-menu ul li:last-child {
        border-bottom: none;
    }

    ul.drop-down-menu ul ul { 
        z-index: 999;
        top: 10px;
        left: 90%;
    }
	ul.drop-down-menu ul { 
        display: none;
    } 
	
    ul.drop-down-menu li:hover > ul { 
        display: block;
    }
	ul {  
        margin: 0;
        padding: 0;
        list-style: none;
    }

    ul.drop-down-menu {
        border: #fff 1px solid;
        display: inline-block;
        font-family: Microsoft JhengHei;
        font-size: 15px;
    }

    ul.drop-down-menu li {
        position: relative;
        white-space: nowrap;
        border-right: #ccc 1px solid;        
    }

    ul.drop-down-menu > li:last-child {
        border-right: none;
    }

    ul.drop-down-menu > li {
        float: left; 
    }  
    
     ul.drop-down-menu a {
        background-color: #fff;
        color: #333;
        display: block;
        padding: 0 30px;
        text-decoration: none;
        line-height: 40px;        
    }
    ul.drop-down-menu a:hover { 
        background-color: #ef5c28;
        color: #fff;
    }
    ul.drop-down-menu li:hover > a { 
        background-color: #ef5c28;
        color: #fff;
    }
	.absolute {
  position: absolute;
  top: 0px;
  right: 50px;
  width: 200px;
  height: 200px;
}
    .abc {
  position: absolute;
  top: 50px;
  right: 50px;
  width: 200px;
  height: 200px;
}
	
</style>
	</head>

	<body>		
		<div class="design">
			<% 

				if( session.getAttribute("id") != null )
				{
				    out.print("<div class='abc'><font face='Microsoft JhengHei' size='4'>您好" + session.getAttribute("id") + "管理員");
					out.print("[<a href='outUser.jsp'><font face='Microsoft JhengHei' size='3'>登出</a>]</div>");
				}
				else
				{
					out.println("<script language='javascript'>alert(\"你尚未登入 !!\");window.location.href='manager.jsp';</script>");
				}
			%>
			
		</div>
		
		<div align="manager_center">
			
			<a href="view_member.jsp"><input type="button" class="button alt" name="view_member" value="查看所有會員"><p>
			<a href="order_view_manager.jsp"><input type="button" class="button alt" name="view_order form" value="查看所有訂單"><p>
			<a href="product.jsp"><input type="button" class="button alt" name="cakedata" value="修改商品資料"><p>
			
		</div>
		<!--
		<center>
			<img src="title8.png" width="600" height="250">
			
			<ul>
				<a href="index_manager.jsp"><img src="nav1.png" width="159" height="90"></a>
				<a href="cake_manager.jsp"><img src="nav2.png" width="159" height="90"></a>
				<a href="board_manager.jsp"><img src="nav5.png" width="159" height="90"></a>
				<a href="introduction_manager.jsp"><img src="nav6.png" width="159" height="90"></a>
				<a href="manager_center.jsp"><img src="nav7.png" width="159" height="90"></a>
			</ul>
			
			<a href="new_member.jsp"><input type="button" class="button alt" name="view_member" value="查看所有會員"><p>
			<a href="order_view_manager.jsp"><input type="button" class="button alt" name="view_order form" value="查看所有訂單"><p>
			<a href="cakedata_manager.jsp"><input type="button" class="button alt" name="cakedata" value="修改商品資料"><p>
			
		</center>
		-->
	</body>
</html>


	
