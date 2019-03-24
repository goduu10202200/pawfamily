<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@include file="../member/config.jsp" %>
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
		<link href="../css/product_content.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
		<link href="../css/terms.css" rel="stylesheet">
		<!-- include individual files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script type="text/javascript" src="../js/slides.min.jquery.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<!--bootstrap js-->
		<script src="../bootstrap/js/bootstrap.min.js"></script>
		<!--theme js-->
		<script src="../js/product.js"></script>
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
			<div id="terms">
				<div class="terms_view">
					<div class="terms">
			 			<div class="terms_title">常見問題</div>
			 				<div class="terms_line" ></div>
			 					<div class="terms_text">
			 						<h5>該如何加入會員呢？</h5><br>
			 							<ul style="list-style-type: disc;">
			 								<li>簡單填寫基本資料，即可免費加入Paw Family會員。</li>
											<li>首次購物會員所填寫之會員基本資料將成為您下次購物所需輸入之帳號密碼，帳號即為當初設定之Email。</li>
											<li>此會員帳號，將作為日後Paw Family嚴選品牌旗艦店任何優惠活動訊息與訂單相關資料之通知依據，故請務必確實填寫正確。若未正確填寫可能會導致無法順利登入會員及收到相關通知，還請特別注意！</li>
										</ul>


									<h5>什麼是優惠卷？如何使用？</h5><br>
			 							<ul style="list-style-type: disc;">
			 								<li>折價券無法直接扣抵運費。</li>
			 								<li>不定期提供予會員之折扣優惠券，折價券會直接歸戶於消費者之會員中心內，並可直接使用於商品。</li>
											<li>折價券一經使用後該折價券立即失效，如未完成門市取貨付款或有退貨之情形，折價券會因失效而無法歸回帳戶，僅會退還您購物實際支付的金額，亦無法辦理折價券退款。</li>
											<li>折價券在您確實完成結帳後才會進行抵扣，若在購物車內但仍未完成結帳之折價券已超過使用期限，則該筆折價券會失效。建議您提早進行抵扣，避免因時間差導致系統接收訂單時折價券已逾期無法使用。</li>
											<li>Paw Family保留隨時變更、修改或中止折價券使用辦法之權利。</li>
										</ul>

									<h5>今天訂購的商品什麼時候會收到？</h5><br>
			 							<ul style="list-style-type: disc;">
			 								<li>郵局貨到付款：訂單成立後的2-3工作天送達，遇假日順延</li>
			 								<li>7-11取貨付款：訂單成立的3-4工作天送達指定門市(部分偏遠地區山區困難配送點除外)</li>
										</ul>

									<h5>退換貨處理？</h5><br>
			 							<ul style="list-style-type: disc;">
			 								若您對於收到的商品不滿意，或是商品瑕疵而要求辦理退貨請於收到商品7日內，與Paw Family客服聯絡辦理退換貨。
			 								<li>【換貨】<br>
											商品換貨時，商品必須連同配件贈品以紙箱完整包裝，Paw Family將以來回件方式寄出正確/全新商品給您，請於物流送件時將錯誤/瑕疵商品交由物流人員收回即可。當退換原因為商品瑕疵或錯誤，Faw Family將負擔往返運費。</li>
			 							<li>【退貨】<br>
											商品退貨時，商品必須無損傷及完整包裝，連同配件贈品，以紙箱包裝原封以郵局掛號包裹寄回 Faw Family ，並在包裹上註明訂貨人姓名。 </li>
										</ul>


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