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
		<link href="../css/product.css" rel="stylesheet">
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
			</section>
		</div>
		<section>
			<div class="product">
				<div class="product_title_picture">
					<img src="../img/product_title/A31(2).jpg">
					<span class="product_title">食物</span>
				</div>
				<div class="product_titlebar">
					<div class="titlebar_left">
						<span>首頁/商品專區/食物</span>
					</div>
					<form method="post" action="product_search.jsp">
						<div class="titlebar_right">
							<div class="search">
								<input type="text" name="product" id="product" placeholder="請輸入想搜尋的商品">
								<input type="submit" class="button alt" name="search" value="搜尋">
							</div>
						</div>
					</form>
				</div>
				<div class="product_info">
					<div class="info_left">
						<h3>食物</h3>
						<ul class="list">
							<li>
								<a href="javascript: return false"  onclick="food_staple();" style="font-size:20px; font-weight:bold;">主食</a>
								<ul class="b">
									<li>
										<a href="javascript: return false" onclick="logo('原野優越');">原野優越</a>
										<a href="javascript: return false" onclick="logo('烘焙客');">烘焙客</a>
										<a href="javascript: return false" onclick="logo('Go');">Go</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="javascript: return false" onclick="food_can();" style="font-size:20px; font-weight:bold;">罐頭</a>
								<ul class="b">
									<li>
										<a href="javascript: return false" onclick="logo('西莎餐盒');">西莎餐盒</a>
										<a href="javascript: return false" onclick="logo('CoCo');">CoCo</a>
										<a href="javascript: return false" onclick="logo('貴族餐盒');">貴族餐盒</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="javascript: return false" onclick="food_desert();" style="font-size:20px; font-weight:bold;">點心</a>
								<ul class="b">
									<li>
										<a href="javascript: return false" onclick="logo('日本MU');">日本MU</a>
										<a href="javascript: return false" onclick="logo('活力零食');">活力零食</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<%
					try {
					//Step 1: 載入資料庫驅動程式
					Class.forName("com.mysql.jdbc.Driver");
					try {
					if(con.isClosed())
					out.println("連線建立失敗");
					else {
						//Step 3: 選擇資料庫
						sql="use pawfamily";
						con.createStatement().execute(sql);
						String class_id= request.getParameter("class_id");
						//String class_id=new String(request.getParameter("class_id").getBytes("ISO-8859-1"),"UTF-8");
						//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
						//sql="select * from paw_goods AS t1, paw_goods_class AS t2 WHERE  t1.class_id=t2.class_id  AND t2.class_id='0'"; //算出共幾筆資料
						sql="select * from paw_goods AS t1 where t1.class_id='D1' OR t1.class_id='D2'";
						ResultSet rs=con.createStatement().executeQuery(sql);
						//先移到檔尾, getRow()後, 就可知道共有幾筆記錄
						rs.last();
						int total_content=rs.getRow();
						//out.println("<font face='Microsoft JhengHei' size='4'>共"+total_content+"筆留言<p>");
							
							//每頁顯示6筆, 算出共幾頁
							int page_num=(int)Math.ceil((double)total_content/6); //無條件進位
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
							int start_record=(int)Math.ceil((double)(current_page-1)*6);
							//遞減排序, 讓最新的資料排在最前面
							sql="select * from paw_goods AS t1 where t1.class_id='D1' OR t1.class_id='D2' ORDER BY t1.class_id DESC LIMIT ";
							//sql="SELECT * FROM paw_goods AS t1, paw_goods_class AS t2 WHERE  t1.class_id=t2.class_id  AND t2.class_id='0' ORDER BY no DESC LIMIT ";//LIMIT是限制傳回筆數
							//sql+=start_record;
							sql+=start_record+",6";
							//上述語法解讀如下:
							// current_page... select * from guestbook order by no desc limit
							//      current_page=1: select * from guestbook order by no desc limit 0, 5 //從第0筆顯示5筆
							//      current_page=2: select * from guestbook order by no desc limit 5, 5 //從第5筆顯示5筆
							//      current_page=3: select * from guestbook order by no desc limit 10, 5//從第10筆顯示5筆
							rs=con.createStatement().executeQuery(sql);
							
							//  逐筆顯示, 直到沒有資料(最多還是5筆)
							%>
							<div class="info_right">
								<div class="right_container">
									<% while(rs.next()){
									out.println("<ul>");
										out.println("<li>");
											out.println("<span class='right_picture'>");
												out.println("<img src='../img/product/food/"+rs.getString("product_id")+"_2.jpg'>");
											out.println("</span>");
											out.println("<span class='right_product'>");
												out.println("<a href='food-staple-cesar"+rs.getString("product_id")+".jsp'>"+rs.getString("product_name")+"</a>");
											out.println("</span>");
											out.println("<span class='right_price'>");
												out.println("<a href='food-staple-cesar"+rs.getString("product_id")+".jsp'>$"+rs.getString("product_price")+"</a>");
											out.println("</span>");
										out.println("</li>");
									out.println("</ul>");
									}
									%>
								</div>
							</div>
							<%
							sql="select * from paw_goods AS t1 where t1.class_id='D1' OR t1.class_id='D2'";
							//sql="select * from paw_goods AS t1 where t1.class_id='D1' OR t1.class_id='D2' OR  t1.class_id='" +class_id+"'";
							ResultSet rs2=con.createStatement().executeQuery(sql);
							%>
							<%
							rs2.last();
							int total_content2=rs2.getRow();  //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
							//每頁顯示9筆, 算出共幾頁
							int page_num2=(int)Math.ceil((double)total_content2/6.0); //無條件進位
							if (page_num2==0) //無留言時將頁數指標訂為1
							page_num2=1;
							out.println("<div class='right_page' style='color: #000;'>");
								for(int i=1;i<=page_num2;i++) //使用get傳輸方式,建立1,2,...頁超連結
								{
								out.print("<a href='food_staple.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
								}
							out.println("</div>");
							//Step 6: 關閉連線
							con.close();
						}
						}
						catch (SQLException sExec) {
						out.println("SQL錯誤"+sExec.toString());
						}
						}
						catch (ClassNotFoundException err) {
						out.println("class錯誤"+err.toString());
						}
						%>
						<!-- <li>
								<span class="right_picture">
										<img src="../img/1.jpg">
								</span>
								<span class="right_product">
										<a href="">商品名稱和介紹</a>
										
								</span>
								<span class="right_price">
										<a href="">這邊放價錢</a>
								</span>
						</li>
						<li> -->
							
							<!-- 	<div class="right_page" style="color: #000; ">
									<a href="">1</a>
									<a href="">2</a>
									<a href="">3</a>
									<a href="">4</a>
									<a href="">5</a>
							</div> -->
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