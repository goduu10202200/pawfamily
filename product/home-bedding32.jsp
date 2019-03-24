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
<%
request.setCharacterEncoding("utf-8");
request.getSession(true);
int left;
String leftString;
sql="SELECT product_id,class_id,product_name,product_price,product_stock FROM paw_goods WHERE product_name='童話粉彩貓屋'";
ResultSet rs=con.createStatement().executeQuery(sql);
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
		<link href="../css/product_content.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
		<link href="../css/food.css" rel="stylesheet">
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
					</header>
				</div>
			</div>
			<section>
				<div class="product_content">
					<div class="product_bar">
						<span>首頁/商品專區/食物/童話粉彩貓屋</span>
					</div>
					<div class="product_top">
						<div class="product_top_left">
							<div class="product_img_item">
								<ul role="tablist">
									<li class="active">
										<a href="#1" aria-controls="home" role="tab" data-toggle="tab">
											<img src="../img/product/home/32_1.jpg" >
										</a>
									</li>
									<li>
										<a href="#2" aria-controls="home" role="tab" data-toggle="tab">
											<img src="../img/product/home/32_1-2.jpg">
										</a>
									</li>										
								</ul>
							</div>
							<div class="product_img tab-content">
								<div role="tabpanel" class="tab-pane active" id="1">
									<img src="../img/product/home/32_2.jpg">
								</div>
								<div role="tabpanel" class="tab-pane" id="2">
									<img src="../img/product/home/32_2-2.jpg">
								</div>
							</div>
						</div>
						<div class="product_top_right">
							<div class="right_title">
								<img src="../img/product/items/product_logo.png">
							</div>
							<% while(rs.next()){%>
								<form name="select" method="post" action="../shoppingcar/shoppingcar.jsp">
								<%
									out.print("<input type='hidden' name='product_id' value='"+rs.getString(1)+"'>");
								%>
								<div class="right_product_name">
									<span class="name_text" name ="product_id" ><%=rs.getString("product_name")%></span>
									<!-- <span class="name_text">原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)</span> -->
								</div>
							<div class="right_product_introduction">
								<ul class="introduction_text">
									<li>日本IRIS今年秋冬力作童話屋</li>
									<li>使用抗靜電材質，乾燥天氣也不怕</li>
								</ul>
							</div>
							<div class="right_product_price">
								<p>$<%=rs.getString("product_price")%></p>
							</div>
							<div class="right_select">
									<%
										leftString = rs.getString("product_stock");
										left = Integer.parseInt(leftString);
											if( left <= 0){
												out.print("<font class='word'>目前無庫存!!</font>");
											}
											else{
												//out.print("<input type='checkbox' name='order' style='width:18px; height:18px;' value='"+rs.getString(1)+"'>");
												out.print("<select name='order'>");
												out.print("<option value='amount'>數量</option>");
												out.print("<option value='1'>1</option>");
												out.print("<option value='2'>2</option>");
												out.print("<option value='3'>3</option>");
												out.print("<option value='4'>4</option>");
												out.print("<option value='5'>5</option>");
												out.print("</select>");
											}
									%>
								</div>
							<%
									if( session.getAttribute("id") != null ){	
								%>
								<div class="right_button">
									<div class="right_shoppingcar">
										<button type="submit">
											<span class="shoppingcar_text">加入購物車</span>
										</button>
									</div>
								</form>
								<form name="heart" method="post" action="../shoppingcar/heart_check.jsp">
									<%
										out.print("<input type='hidden' name='heart_id' value='"+rs.getString("product_id")+"'>");
									%>
									<div class="right_wishlist">
										<button type="submit">
											<span class="wishlist_text">收藏清單</span>
										</button>
									</div>
								</form>
								</div>

								<%}else{%>
									<div class="right_button">
										<div class="right_wishlist">
											<button type="" disabled="disabled">
												<span class="wishlist_text">收藏清單</span>
											</button>
										</div>
										<div class="right_shoppingcar">
											<button type="" disabled="disabled">
												<span class="shoppingcar_text">加入購物車</span>
											</button>
										</div>
									</div>
								
								<%}%>
							<%}%>
						</div>
					</div>
					<div class="product_info">
					<div class="info_bar">
					  <ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">商品說明</a></li>
					    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">付款資訊</a></li>
					    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">退換貨服務</a></li>
					    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">注意事項</a></li>
					  </ul>

					  <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="home"> 
					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    			<h4>【商品說明】</h4>
					    			<ul>
					    				<p>
										拆洗容易，可以水洗，好收納，上層使用魔鬼粘加強固定；下層有拉鍊好拆好洗、方便收納不佔地方。坐墊部分使用網眼布及超細纖維面料，可自然水洗，但是千萬不要丟進洗衣機及脫水處理，會造成整體結構變形。
										</p>
									</ul>
								</div>
					    	</div>
					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    			<h4>【商品規格】</h4>
					    				<p>
					    				商品尺寸：44長x48.5寬x30高<br>
										入口直徑：15公分<br>
										坐    墊：36寬x26長<br>
										重    量：約為655克<br>
										尺寸皆為平放單面測量 單位：公分<br>

					    				</p>
								</div>		
							</div>											    	

					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    			<h4>【適用對象】</h4>
					    				<p>小型寵物</p>
								</div>		
							</div>	

					    </div>
					    <div role="tabpanel" class="tab-pane" id="profile"> 
					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    			<h4>【超商取貨付款】</h4>
					    			<ul>
					    				<p>
					    					<li>包裹出貨後，約2~3天會送達超商，同時發送簡訊通知您領取，請於包裹送達超商7日內領取以免退回。<br></li>
											<li>若手機設定拒收大量簡訊，將可能讓您無法收到簡訊，建議您可通知電信業者解除設定或利用會員中心查詢配送進度。<br></li>
											<li>若有多次未取紀錄，本公司得隨時暫停或終止您全部或部分的購物與服務。<br></li>
										</p>
										</ul>
								</div>		
							</div>
					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    			<h4>【郵局宅配貨到付款】</h4>
					    				<p>
					    					1.台灣本島地區比照預設運費規則。<br>
											2.若有本島以外之送貨需求，收到訂單後會與訂購人聯繫，原則上是以郵局便利箱寄送，部分情況需酌收運費，敬請見諒。
										</p>
								</div>		
							</div>																				    	

					    </div>
					    <div role="tabpanel" class="tab-pane" id="messages">
					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    		<h4>【退換貨服務】</h4>
					    				<p>消費者可依照消費者保護法的規定，享有商品貨到日起七天猶豫期的權益，建議您收到商品立即開箱確認，並於七日內提出退換貨申請。提醒您「猶豫期並非試用期」，所以您所退回的商品必須是全新的狀態、而且完整包裝；請注意保持商品本體、配件、贈品、保證書、原廠包裝及所有附隨文件或資料的完整性，切勿缺漏任 何配件或損毀原廠外盒，並由您支付商品寄出運費+退貨寄回運費，即可退貨退款。食品類、接觸性商品、低溫配送類商品恕不在此規範內。</p>

					    				<h3>※食品類如：</h3>
					    				<p>飼料、零食、營養品，一經拆封使用後將被視為無法二次販售之商品，因此恕無法享有七天猶豫期及申	請退換貨。建議您收到商品時再次確認商品規格是否符合需求，不確定是否要辦理退貨以前，請勿拆封。<br></p>

										<h3>※不良品退換貨：</h3>
										<p>若商品因非人為因素之損毀、刮傷即瑕疵商品，或運輸過程造成包裝破損不完整者，請於收到商品三日內與我們聯繫告知，並於收到商品七日內辦理退換，商品回收後會進行瑕疵或損壞鑑定，並儘速將新品寄給您。色差問題之商品恕無法認定為不良品，但因每台電腦顯色情況不同，實際顏色以實品為主，敬請見諒。
										</p>
								</div>		
							</div>	


					    </div>
					    <div role="tabpanel" class="tab-pane" id="settings"> 
					    	<div class="food_earthborn">
					    		<div class="food_earthborntext">
					    			<h4>【注意事項】</h4>
					    				<p>以下情形恕無法接受退換貨：<br>
											※一但商品經使用或洗滌，基於對寵物衛生及健康之理由，恕不接受退換。<br>
											※已經超過七日退貨期限。<br>
											※未附原包裝盒或包裝已破損或髒污。<br>
											※商品因不當使用、保管之人為因素而造成之故障、損毀、刮傷、髒污、包裝破損不完整。<br>
											<p>
								</div>		
							</div>	



					     </div>
					  </div>
					</div>
					</div>

				</div>
			</section>
		</div>
		<section>
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