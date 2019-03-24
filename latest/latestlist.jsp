<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use pawfamily";
con.createStatement().execute(sql);
%>
<!DOCTYPE html>
<html class="no-js" lang="zh-tw ">
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
		<link href="../css/latest.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
		<!-- include individual files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script type="text/javascript" src="../js/slides.min.jquery.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<!--bootstrap js-->
		<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
		<!--theme js-->
		<script type="text/javascript" src="../js/PawFamily.js"></script>
		<script>
		$(function(){
			$('.flexslider').flexslider({
			animation: "slide"
			});
			setTimeout("$('#slidesLoading').fadeOut('slow');$('#slides').fadeIn()",1200);
		});
		$(function(){
			$('#slides').mouseover(function() {
				$('.prev,.next').show();
			});
			$('#slides').mouseout(function() {
				$('.prev,.next').hide();
			});
		});
		</script>
	</head>
	<body>
		<div id="main">
			<div class="pageTop">
				<div id="Paw_header">
					<header>
						<h1>
						<a href="javascript: return false" onclick="Paw_index();">
							<img style="height: 70px;width: 130px;" src="../img/pf4.png">
						</a>
						</h1>
						<div class="Pawmenu">
							<ul class="clearfix">
								<li>
									<a href="javascript: return false" onclick="Paw_latest();">最新消息</a>
								</li>
								<li class="pawnav">
									<a class="product" href="">商品介紹</a>
									<ul class="subNav">
										<li>
											<a href="javascript: return false" onclick="food();" class="toptitle">食物</a>
											<a href="javascript: return false" onclick="food_staple();" style="font-size:20px; font-weight:bold;">主食</a>
											<a href="javascript: return false" onclick="logo('原野優越');">原野優越</a>
											<a href="javascript: return false" onclick="logo('烘焙客');">烘焙客</a>
											<a href="javascript: return false" onclick="logo('Go');">Go</a>
											<a href="javascript: return false" class="toptitle2" onclick="food_desert();" style="font-size:20px; font-weight:bold;">點心</a>
											<a href="javascript: return false" onclick="logo('日本MU');">日本MU</a>
											<a href="javascript: return false" onclick="logo('活力零食');">活力零食</a>
										</li>
										<li>
											<a href="javascript: return false" onclick="home();" class="toptitle">寵物窩</a>
											<a href="javascript: return false" onclick="home_class('C2');"> 寵物窩</a>
											<a href="javascript: return false" onclick="home_class('C3');">床墊</a>
										</li>
										<li>
											<a href="javascript: return false" onclick="toy();" class="toptitle">寵物玩具</a>
											<a href="javascript: return false" onclick="toy_class('C4');">組合屋</a>
											<a href="javascript: return false" onclick="toy_class('C5');">小玩具</a>
										</li>
										<li>
											<a href="javascript: return false" onclick="bowl();" class="toptitle">寵物碗具</a>
											<a href="javascript: return false" onclick="bowl_class('C6');">寵物碗</a>
											<a href="javascript: return false" onclick="bowl_class('C7');">碗架</a>
										</li>
										<li>
											<a href="javascript: return false" onclick="customized();" class="toptitle">客製化</a>
											<a href="javascript: return false" onclick="customized_class();" style="font-size:20px; font-weight:bold;">項圈吊牌</a>
											<a href="javascript: return false" onclick="customized_logo('D4');">項圈</a>
											<a href="javascript: return false" onclick="customized_logo('D3');">吊牌</a>
											<a href="javascript: return false" onclick="customized_logo('D5');">領巾</a>
											<a href="javascript: return false" onclick="customized_class2();" class="toptitle2" style="font-size:20px; font-weight:bold;">小物</a>
											<a href="javascript: return false" onclick="customized_logo('D7');">牽繩</a>
											<a href="javascript: return false" onclick="customized_logo('D6');">蝴蝶結</a>
											<a href="javascript: return false" onclick="customized_logo('D8');">寵物包</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="javascript: return false" onclick="Paw_creator();">創作者</a>
								</li>
								<li>
									<a href="javascript: return false" onclick="Paw_aboutpf();">關於品牌</a>
								</li>
								<li>
									<a href="javascript: return false" onclick="Paw_board();">留言板</a>
								</li>
								<li>
									<a href="javascript: return false" onclick="Paw_aboutus();">關於我們</a>
								</li>
							</ul>
						</div>
						<% 
							if( session.getAttribute("id") != null ){
									out.print("<div class='login_after'><a href='javascript: return false' onclick='Paw_order_after()';>");
									out.print("您好" + session.getAttribute("id") + "會員</a></div>");
									out.print("<div class='outuser'><a href='../member/outuser.jsp'>登出</a></div>");
									out.print("<div class='carArea'><a href='javascript: return false' onclick='Paw_car();'>");
									out.print("<li class='glyphicon glyphicon-shopping-cart gi-2x'>");
						%>     
									<%
										sql="select * from shoppingcar where id='" +session.getAttribute("id")+"'";
										ResultSet rs2=con.createStatement().executeQuery(sql);
									%>
									<%
										rs2.last();
										int total_content2=rs2.getRow();  //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
										String shoppingcar_total = Integer.toString(total_content2);
										out.print("<p id='paw_car'>"+shoppingcar_total+"</p></li></a>");	
									%>						
						<%			out.print("<a href='javascript: return false' onclick='Paw_heart();'>");				
									out.print("<li class='glyphicon glyphicon-heart gi-2x'>");	
						%>
									<%
										sql="select * from heart where id='" +session.getAttribute("id")+"'";
										ResultSet rs3=con.createStatement().executeQuery(sql);
									%>
									<%
										rs3.last();
										int total_content3=rs3.getRow();  //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
										String heart_total = Integer.toString(total_content3);
										out.print("<p id='paw_heart'>"+heart_total+"</p></li></a></div>");
									%>							
						<%			//out.print("[<a href='User.jsp'><font face='Microsoft JhengHei' size='3'>會員專區</a>]</div>");
							}else
							{
						%>
						<div class="login">
							<a href="javascript: return false" onclick="Paw_login();">登入或註冊</a>
						</div>
						 <% } %>
						<!-- <div class="carArea">
							<a href="javascript: return false" onclick="Paw_car();">
								<li class="glyphicon glyphicon-shopping-cart gi-2x">
								<p id="paw_car">0</p>
								</li>
							</a>
							<a href="javascript: return false" onclick="Paw_heart();">
								<li class="glyphicon glyphicon-heart gi-2x">
								<p id="paw_heart">0</p>
								</li>
							</a>
						</div> -->
					</header>
				</div>
			</div>
		</div>
		<section>
			<div id="laestlist">
				<div class="list_view">
					<div class="container">
						<p>LATEST NEWS</p>
						<hr class="hr1">
						<div class="row" style="margin-bottom:30px; padding-bottom:30px;">
							<div class="col-md-4"  style="margin-top:50px;">
								<img src="../img/latest/l_n0.jpg">
							</div>
							<div class=".col-md-8">
								<h3 class="lewtitle">
								<a href="javascript: return false" onclick="Paw_latest_1();">《ACTION!!開賣啦~~》客製化寵物吊牌</a>
								</h3>
								<div class="bl-sort">
									事事無法預料，再乖的寵物難保哪天會突然暴走，或是不小心走失而讓你措手不及。<br>
									這時候如果你早已幫牠準備了"寵物名牌"，那麼相信一定能夠幫助你順利找到!!!<br>
									客製化專屬的寵物吊牌是你最好的選擇，全新推出迷你場記板，每隻毛寵物都應該擁有！<br>
								</div>
							</div>
							<!-- <hr class="hr2"> -->
							<div class="col-md-4">
								<img src="../img/latest/l_n30.jpg">
							</div>
							<div class=".col-md-8">
								<h3 class="lewtitle">
								<a href="javascript: return false" onclick="Paw_latest_2();">《5/14 - 6/17》限時優惠</a>
								</h3>
								<div class="bl-sort" >
									歡慶端午，即日起至6/17，全館消費滿699享8折優惠，不限商品。<br>
									【注意事項】<br>
									1.限時優惠商品不適用其它優惠活動<br>
									2.限時優惠商品恕不接受退貨，能接受再購買<br>
									3.商品加入購物車後，需完成結帳才算購買成功<br>
									4.結帳前請檢視清楚商品資訊，確認好商品顏色尺寸口味<br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<ul>
				<li>
					<div class="language">
						<a>Paw &nbsp;Family</a>
					</div>
				</li>
				<li>
					<div class="misc">
						<ul>
							<li>
								<a href="javascript: return false" onclick="Paw_shopinf();">購物資訊</a>
							</li>
							<li>
								<a href="javascript: return false" onclick="Paw_question();">線上問答</a>
							</li>
							<li>
								<a href="javascript: return false" onclick="Paw_terms();">聲明條款</a>
							</li>
							<li>
								<a href="javascript: return false" onclick="Paw_contactus();">連絡我們</a>
							</li>
							<li>
								<a href="javascript: return false" onclick="manager();">管理者登入</a>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="social">
						<div class="follow">
							加入社群
						</div>
						<ul>
							<li>
								<a href="javascript: return false" onclick="fb();" target="_blank"><img style="width:27px;height:2px no-repeat;" src="../img/index/icon_fb.png"></a>		
							</li>
							<li>
								<a href="javascript: return false" onclick="ig();" target="_blank"><img style="width:35px;height:2px no-repeat;" src="../img/index/icon_ig.png"></a>
							</li>
							<li>
								<a href="javascript: return false" onclick="line();" target="_blank"><img style="width:27px;height:2px no-repeat;" src="../img/index/icon_line.png"></a>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</footer>
	</body>
</html>