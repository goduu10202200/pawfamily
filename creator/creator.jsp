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
		<link href="../css/creator.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
		<!-- include individual files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script type="text/javascript" src="../js/slides.min.jquery.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<!--bootstrap js-->
		<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
		<!--theme js-->
		<script type="text/javascript" src="../js/PawFamily.js"></script>
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
				<div id="creator">
					<div class="creator_view">
						<div class="pagetitle">
							<div class="pagetext">CREATOR</div>
							<hr class="hr1">
						</div>
						<div class="creator_list">
							<div clss="creator_per">
								<div class="creator_inf">
									<div class="pic">
										<div class="creatorphotot">
											<img src="../img/creator/creator.jpg">
										</div>
										<div class="creatorname">
											<p>WeWii Handmade</p>
										</div>
										<div class="creator_introduction">
											<p>
												堅持手作與不同素材的運用搭配從染色<br>
												、上油、縫線、打磨都堅持手工操作，<br>
												讓一針一線都保有溫度，希望買到的客<br>
												人都可以在生活中完整的運用它，不管
												髒了舊了，都可以慢慢累積成為生活的
												一部分。2013年我們慢慢開始一邊經營
												網路品牌，一邊開發新產品，未來希望
												能夠以設計，結合皮革良品，我們喜愛
												的慣性，慢慢的延展串連，成為一個更豐富並且讓人感覺溫暖的品牌。
											</p>
										</div>
										<div class="creator_button">
											<button onclick="Paw_creator_1();">查看創作家</button>	
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="creator_list">
							<div clss="creator_per">
								<div class="creator_inf">
									<div class="pic">
										<div class="creatorphotot">
											<img src="../img/creator/creator2.jpg">
										</div>
										<div class="creatorname">
											<p>Sugoi Baby 超毛小子</p>
										</div>
										<div class="creator_introduction">
											<p>
												以"愛與幸福"為創作開端，希望藉此傳達"人與毛小孩"之間的情感聯繫，皆以毛小孩為主題做一連串創作設計的所在，插畫創作、明信片、狗牌，'狗鍊、圍巾...等等，也可以進行客製化的服務!!商品從染色、上油、縫線、打磨都堅持手工操作，為的是讓每一針一線都透過我們的手去穩固他的耐用性，讓產品是保有溫度並且耐用的。堅持手作與不同素材的運用搭配，簡單的生活品味，從商品的細節中都可以感受到。
											</p>
										</div>
										<div class="creator_button">
											<button onclick="Paw_creator_2();">查看創作家</button>	
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<div class="creator_list">
							<div clss="creator_per">
								<div class="creator_inf">
									<div class="pic">
										<div class="creatorphotot">
											<img src="../img/creator/creator3.jpg">
										</div>
										<div class="creatorname">
											<p>Paralife 環保材料手造館</p>
										</div>
										<div class="creator_introduction">
											<p>
												我們的產品以天然、環保的物料為主，絕不使用動物皮作材料。強烈質感，配合簡單樸素的設計，捨棄不必要的裝飾，便能突出非常漂亮的天然物料。我們相信不同植物原材料有著獨突、不可取代之美。懂得欣賞它，便能感受大自奧妙之處。除了主打的天然物料，我們主張循環再造的環保物料，包括報紙、再造紙等，經加工後，讓物件擁有第二次的生命。我們相信環保是一種個人生活的態度，把它貫徹於產品之中，讓更多人共同珍惜資源。
											</p>
										</div>
										<div class="creator_button">
											<button onclick="Paw_creator_3();">查看創作家</button>	
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<div class="creator_list">
							<div clss="creator_per">
								<div class="creator_inf">
									<div class="pic">
										<div class="creatorphotot">
											<img src="../img/creator/creator4.jpg">
										</div>
										<div class="creatorname">
											<p>sienna</p>
										</div>
										<div class="creator_introduction">
											<p>
												品牌創始於2005年，以皮件為原點，慢慢的延展出除了皮件以外，讓生活更便利的設計產品。台灣少量生產，品質和實用性是我們最在意的。關於皮革創作在自己生活中的位置；皮革創作從一開始單純興趣的好奇、摸索、沉迷到變成工作、生活技能、飯碗，期間也經歷過為了生活沒天沒夜製作趕工；然而現在希望慢慢能回歸到初見面的原點。
											</p>
										</div>
										<div class="creator_button">
											<button onclick="Paw_creator_4();">查看創作家</button>	
										</div>
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