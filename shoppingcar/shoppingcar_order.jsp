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
		<link href="../css/shoppingcar.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
		<!-- include individual files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script type="text/javascript" src="../js/slides.min.jquery.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<!--bootstrap js-->
		<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
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
			<section>
				<div class="shoppingcar">
				<%
					try{
						Class.forName("com.mysql.jdbc.Driver");//載入資料庫驅動程式
						try{
							if(con.isClosed())
								out.println("連線建立失敗");
							else{
								//Step 3: 選擇資料庫
								sql="use pawfamily";
								con.createStatement().execute(sql);
								//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
								sql="select * from shoppingcar where id='" +session.getAttribute("id")+"'"; //算出共幾筆資料
								ResultSet rs=con.createStatement().executeQuery(sql);
								//先移到檔尾, getRow()後, 就可知道共有幾筆記錄
								rs.last();
								int total_content=rs.getRow();
								//每頁顯示6筆, 算出共幾頁
								int page_num=(int)Math.ceil((double)total_content/5); //無條件進位
								if (page_num==0) //無留言時將頁數指標訂為1
								page_num=1;
								//out.println("請選擇頁數");
								//讀取page變數
								String page_string = request.getParameter("page");
								if (page_string == null)
								page_string = "1";  //無產品時將頁數指標訂為1
								Integer current_page=Integer.valueOf(page_string);//將page_string轉成整數
								//計算開始記錄位置
								
								//Step 5: 顯示結果
								int start_record=(int)Math.ceil((double)(current_page-1)*5);
								//遞減排序, 讓最新的資料排在最前面
								sql="select * from shoppingcar where id='" +session.getAttribute("id")+"' ORDER BY no DESC LIMIT ";//LIMIT是限制傳回筆數
								//sql+=start_record;
								sql+=start_record+",5";
								//上述語法解讀如下:
								// current_page... select * from guestbook order by no desc limit
								//      current_page=1: select * from guestbook order by no desc limit 0, 5 //從第0筆顯示5筆
								//      current_page=2: select * from guestbook order by no desc limit 5, 5 //從第5筆顯示5筆
								//      current_page=3: select * from guestbook order by no desc limit 10, 5//從第10筆顯示5筆
								rs=con.createStatement().executeQuery(sql);
							
								//逐筆顯示, 直到沒有資料(最多還是5筆)
					%>
					<div class="shoppingcar_order">
						<table width="100%" border="0">
							<thead>
								<tr>
									<th style="width: 277px;">
										<a href="">繼續購物</a>
									</th>
									<th>商品資訊</th>
									<th>數量</th>
									<th>價錢</th>
									<th style="width: 277px;">刪除</th>
								</tr>
							</thead>
							<% while(rs.next()){
										out.println("<tbody>");
											out.println("<tr>");
												out.println("<td>");
													out.println("<span>");
														//out.println(rs.getString("product_id"));
														out.println("<img src='../img/product/manager/"+rs.getString("product_id")+"_1.jpg'>");
													out.println("</span>");
												out.println("</td>");
												/*
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_id"));
													out.println("</span>");
												out.println("</td>");
												*/
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_name"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_amount"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println("$"+rs.getString("product_total"));
													out.println("</span>");
												out.println("</td>");
												////
								%>
												<td>
													<form name="checkbox" method="post" action="shoppingcar_delete.jsp">
													<input type="hidden" name="delete" value="<%=rs.getString("product_id")%>">
														<button name="" type="submit" class="btn  btn-lg Paw_button" 
														style="background-color: #fff; outline-color:#fff;">
														<span class="glyphicon glyphicon-trash"></span>
														</button>
													</form>
												</td>
									<%
											out.println("</tr>");
										out.println("</tbody>");
									}%>								
								</table>
					<%
							sql="select * from shoppingcar where id='" +session.getAttribute("id")+"'";
							ResultSet rs2=con.createStatement().executeQuery(sql);
					%>
					<%
							rs2.last();
							int total_content2=rs2.getRow();  //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
							//每頁顯示9筆, 算出共幾頁
							int page_num2=(int)Math.ceil((double)total_content2/6.0); //無條件進位
							if (page_num2==0) //無留言時將頁數指標訂為1
							page_num2=1;
							out.println("<div class='page'>");
								for(int i=1;i<=page_num2;i++) //使用get傳輸方式,建立1,2,...頁超連結
								{
									out.print("<a href='shoppingcar_order.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
								}
							out.println("</div>");
							}
						}
						catch (SQLException sExec) {
						out.println("SQL錯誤");
						}
					}
					catch (ClassNotFoundException err) {
						out.println("class錯誤");
					}
					%>
								<!-- <tr>
									<td>
										<img src="../img/1.jpg">
									</td>
									<td>
										<span>原野優越農場-低敏無穀犬火雞肉+鮭魚+蘋果</span>
									</td>
									<td>
										<span>5</span>
									</td>
									<td>
										<span>$600</span>
									</td>
									<td>
										<button type="button" class="btn  btn-lg Paw_button" style="background-color: #fff; outline-color:#fff;">
										<span class="glyphicon glyphicon-trash"></span>
										</button>
									</td>
								</tr> -->
								<!-- <tr>
									<td>
										<img src="../img/1.jpg">
									</td>
									<td>
										<span>原野優越農場-低敏無穀犬火雞肉+鮭魚+蘋果</span>
									</td>
									<td>
										<span>5</span>
									</td>
									<td>
										<span>$600</span>
									</td>
									<td>
										<button type="button" class="btn  btn-lg Paw_button" style="background-color: #fff; outline-color:#fff;">
										<span class="glyphicon glyphicon-trash"></span>
										</button>
									</td>
								</tr>
								<tr>
									<td>
										<img src="../img/1.jpg">
									</td>
									<td>
										<span>原野優越農場-低敏無穀犬火雞肉+鮭魚+蘋果</span>
									</td>
									<td>
										<span>5</span>
									</td>
									<td>
										<span>$600</span>
									</td>
									<td>
										<button type="button" class="btn  btn-lg Paw_button" style="background-color: #fff; outline-color:#fff;">
										<span class="glyphicon glyphicon-trash"></span>
										</button>
									</td>
								</tr>
								<tr>
									<td>
										<img src="../img/1.jpg">
									</td>
									<td>
										<span>原野優越農場-低敏無穀犬火雞肉+鮭魚+蘋果</span>
									</td>
									<td>
										<span>5</span>
									</td>
									<td>
										<span>$600</span>
									</td>
									<td>
										<button type="button" class="btn  btn-lg Paw_button" style="background-color: #fff; outline-color:#fff;">
										<span class="glyphicon glyphicon-trash"></span>
										</button>
									</td>
								</tr>
								<tr>
									<td>
										<img src="../img/1.jpg">
									</td>
									<td>
										<span>原野優越農場-低敏無穀犬火雞肉+鮭魚+蘋果</span>
									</td>
									<td>
										<span>5</span>
									</td>
									<td>
										<span>$600</span>
									</td>
									<td>
										<button type="button" class="btn  btn-lg Paw_button" style="background-color: #fff; outline-color:#fff;">
										<span class="glyphicon glyphicon-trash"></span>
										</button>
									</td>
								</tr> -->
						<!-- <div class="page">
							<a href="">1</a>
							<a href="">2</a>
							<a href="">3</a>
							<a href="">4</a>
							<a href="">5</a>
						</div> -->
					</div>
					<hr>
					<div class="shoppingcar_way">
						<div class="way_transport">
							<div class="">
								<!-- <span class="transport_text">
									請輸入優惠代碼
								</span>
								<div class="discount_button">
									<input type="text" name="">
									<input type="button" name="" value="更改價格">
								</div> -->
							</div>
						<!-- 	<div class="transport_content">
								<span class="transport_text">
									運送方式與運費
								</span>
								<div class="content_select">
									<select name="payway">
										<option value="select">請選擇</option>
										<option value="1">7-11取貨付款</option>
										<option value="2">全家取貨付款</option>
										<option value="3">宅配貨到付款</option>>
									</select>
								</div>	
							</div> -->
							<div class="content_total" style="margin-top: -300px;">
								<!-- <div style="margin-bottom: 10px; margin-top: 10px;">
									<span>總金額：</span>
									<span style="font-size: 28px; color: red; font-weight: bold;">$777</span>
									<span>元</span>
								</div> -->
								<br>
								<input type="button" onclick="Paw_index();" value="繼續購物">
								<input type="button" onclick="Paw_car_2();" value="前往結帳">
							</div>
							<div class="shoppingcar_notice">
								<h2>網路購物注意事項</h2>
								<span class="notice_title">
									1.&nbsp;&nbsp;&nbsp;七天猶豫鑑賞期
								</span>
								<p>
									依照消費者保護法的規定，商品到貨日起七天猶豫期（含例假日，逾期恕無法換退貨）的權益僅限線上 <br>購物之消費者，且猶豫期並非試用期，因此您退換的商品必須為全新狀態且完整包裝，否則恕不接受退 <br>換貨。亦不接受商品顏色或款式之退換貨。
								</p>
								<span class="notice_title">
									2.&nbsp;&nbsp;&nbsp;請保持商品完整性
								</span>
								<p>
									您所退回的商品必須保持商品本體、附件、內外包裝、配件、贈品、保固卡、原廠包裝及所有隨附文 <br>
									件、發票或資料的完整性，切勿缺漏任何配件或損毀原廠外盒。請您以送貨使用之原包裝紙箱將退貨商 <br>品包裝妥當，若原紙箱已遺失，請另使用其他紙箱包覆於商品原廠包裝之外，切勿直接於原廠包裝上黏 <br>
									貼紙張或書寫文字。
								</p>
								<span class="notice_title">
									3.&nbsp;&nbsp;&nbsp;商品鑑賞範圍
								</span>
								<p>
									辦理退換貨時，若商品有下列情形者，可能會被認定為已逾越檢查商品之必要程度，而將影響退貨權利 <br>
									的行使，翔盛將有權拒絕退貨或要求負擔毀壞之費用。因此若您在訂購商品前或收到商品後，希望更進 <br>一步了解商品的使用方式，或對該產品有任何疑慮，請先來函或來電與客服人員連絡： <br>
									(1)&nbsp;退回之商品未依指示操作之人為損壞<br>
									(2)    退回之商品已拆封(即除運送用之包裝外一切包裝、包括但不限於瓶蓋、封口、封膜等接觸商品內 <br>
									容之包裝部分)或已非全新狀態(外觀不得有刮傷、破損、受潮…等)與完整包裝(商品、附件、原廠外盒<br>、保護袋、配件紙箱、保麗龍、隨貨文件、贈品等)。<br>
									(3)    商品上有不可清除的髒污或痕跡。<br>
									(4)    布料類商品之吊牌拆除或經水洗。<br>
									(5)    推車類商品之輪胎磨損(請於平坦之室內先行試推使用，輪胎經落地於室外道路一概不予退貨)<br>
								</p>
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