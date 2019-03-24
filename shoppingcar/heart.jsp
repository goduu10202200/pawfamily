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
		<link href="../css/heart.css" rel="stylesheet">
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
				<div class="heart">
					<div class="heart_content">
						<div class="heart_title">
							<p>追蹤清單</p>
						</div>
						<div class="heart_hr">
							<hr>
						</div>
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
								sql="select * from heart where id='" +session.getAttribute("id")+"'"; //算出共幾筆資料
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
								sql="select * from heart where id='" +session.getAttribute("id")+"' ORDER BY no DESC LIMIT ";//LIMIT是限制傳回筆數
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
						<table width="100%" border="0">
							<thead>
								<tr>
									<th style="width: 277px;">
										<a href="javascript: return false" onclick="Paw_index();">繼續購物</a>
									</th>
									<th>商品資訊</th>
									<th>價錢</th>
									<th style="width: 277px;">取消追蹤</th>
								</tr>
							</thead>
							<%while(rs.next()){%>
							<tbody>
								<tr>
									<td>
										<%out.println("<img src='../img/product/manager/"+rs.getString("product_id")+"_1.jpg'>");%>
									</td>
									<td>
										<%out.println("<span>"+rs.getString("product_name")+"</span>");%>
									</td>
									<td>
										<%out.println("<span>"+rs.getString("product_price")+"</span>");%>
									</td>
									<td>
										<form name="checkbox" method="post" action="heart_delete.jsp">
											<input type="hidden" name="delete" value="<%=rs.getString("product_id")%>">
											<button type="submite"  class="btn  btn-lg Paw_button" style="background-color: #fff; outline-color:#fff;">
												<span class="glyphicon glyphicon-heart-empty"></span>
											</button>
										</form>
									</td>
								</tr>
							</tbody>
							<%}%>
						</table>
						<%
							sql="select * from heart where id='" +session.getAttribute("id")+"'";
							ResultSet rs2=con.createStatement().executeQuery(sql);
						%>
						<%
							rs2.last();
							int total_content2=rs2.getRow();  //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
							//每頁顯示9筆, 算出共幾頁
							int page_num2=(int)Math.ceil((double)total_content2/5.0); //無條件進位
							if (page_num2==0) //無留言時將頁數指標訂為1
							page_num2=1;
							out.println("<div class='page'>");
								for(int i=1;i<=page_num2;i++) //使用get傳輸方式,建立1,2,...頁超連結
								{
									out.print("<a href='heart.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
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
						<!-- <div class="page">
							<a href="">1</a>
							<a href="">2</a>
							<a href="">3</a>
							<a href="">4</a>
							<a href="">5</a>
						</div> -->
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