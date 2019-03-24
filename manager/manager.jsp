<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>PawFamily</title>
		<!-- Bootstrap -->
		<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!--theme css-->
		<link href="../css/PawFamily.css" rel="stylesheet">
		<link href="../css/flexslider.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
	</head>
	<body>
		<div id="main">
			<div class="pageTop">
				<div id="Paw_header">
					<head>
						<h1>
						<a href="javascript: return false" onclick="Paw_index();">
							<img style="height: 70px;width: 130px;" src="../img/pf4.png" >
						</a>
						</h1>
						<div class="Pawmenu">
						</div>
						<%
						if(session.getAttribute("id") != null ){
						out.println("<script language='javascript'>alert(\"您並非是管理員 !!\"); location.href='../index/index.jsp';</script>");
						}
						else{
						%>
						<form method="post" action="check_manager.jsp">
							<div class="design1">
								<input type="text" name="id" id="id" placeholder="帳號"><p>
							</div>
							<input type="password" name="pwd" id="pwd" placeholder="密碼"><p>
							<input type="submit" name="submit" class="button alt" value="登入">
						</form>
						</center>
						<%
						}
						%>
					</head>
				</div>
			</div>
		</div>
	</body>
</html>