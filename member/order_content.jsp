<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		<link href="../css/member.css" rel="stylesheet">
		<link href="../css/font.css" rel="stylesheet">
		<!-- include individual files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script type="text/javascript" src="../js/slides.min.jquery.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<!--bootstrap js-->
		<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
		<!--theme js-->
		<script src="../js/member.js"></script>
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
											<a href="" class="toptitle">食物</a>
											<a href="" style="font-size:20px; font-weight:bold; ">主食</a>
											<a href="">原野優越</a>
											<a href="">烘焙客</a>
											<a href="">Go</a>
											<a href="" class="toptitle2" style="font-size:20px; font-weight:bold;">點心</a>
											<a href="">日本MU</a>
											<a href="">活力零食</a>
										</li>
										<li>
											<a href="" class="toptitle">寵物窩</a>
											<a href="" style="font-size:20px; font-weight:bold;">寵物窩</a>
											<a href="">蒙古屋</a>
											<a href="">寵物屋</a>
											<a href="" class="toptitle2" style="font-size:20px; font-weight:bold;">床墊</a>
											<a href="">方形吊床</a>
											<a href="">好夢墊</a>
										</li>
										<li>
											<a href="" class="toptitle">寵物玩具</a>
											<a href="">組合屋</a>
											<a href="">小玩具</a>
										</li>
										<li>
											<a href="" class="toptitle">寵物碗具</a>
											<a href="">寵物碗</a>
											<a href="">碗架</a>
										</li>
										<li>
											<a href="" class="toptitle">客製化</a>
											<a href="" style="font-size:20px; font-weight:bold;">項圈吊牌</a>
											<a href="">項圈</a>
											<a href="">吊牌</a>
											<a href="">領巾</a>
											<a href="" class="toptitle2" style="font-size:20px; font-weight:bold;">小物</a>
											<a href="">牽繩</a>
											<a href="">蝴蝶結</a>
											<a href="">寵物包</a>
											
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
									out.print("<p id='paw_car'>0</p></li></a>");							
									out.print("<a href='javascript: return false' onclick='Paw_heart();'>");				
									out.print("<li class='glyphicon glyphicon-heart gi-2x'>");	
									out.print("<p id='paw_heart'>0</p></li></a></div>");							
									//out.print("[<a href='User.jsp'><font face='Microsoft JhengHei' size='3'>會員專區</a>]</div>");
							}
						%>
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
				<div id="Paw_order">
					<div id="order">
						
						<div class="title">
							<p>Paw Family &nbsp; MEMBER</p>
						</div>
					</div>
					<div class="Paw_memberleft">
						<div class="memberleft">
							<a href="javascript: return false" onclick="Paw_order();">訂單查詢</a>
							<a href="javascript: return false" onclick="Paw_member_information();">會員資料</a>
							<a href="javascript: return false" onclick="Paw_member_sale();">Paw Family優惠折扣</a>
							<a href="javascript: return false" onclick="Paw_member_lucky();">Paw Family幸運抽獎</a>
							<a href="javascript: return false" onclick="Paw_index();">會員登出</a>
						</div>
					</div>
					<div class="Paw_memberright">
						<div class="memberright">
							<div class="orderinfo">
					<%
						try{
						Class.forName("com.mysql.jdbc.Driver");//載入資料庫驅動程式
						try{
							//Step 2: 建立連線
							String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
							String sql="";
							Connection con=DriverManager.getConnection(url,"root","1234");
							if(con.isClosed())
								out.println("連線建立失敗");
							else{
								//Step 3: 選擇資料庫
								sql="use pawfamily";
								con.createStatement().execute(sql);
								String order_id=request.getParameter("order_id");
								//讀取 選取的order_id
								//out.println("<script> alert('"+order_id+"')</script>");
								//if( order_id.equals(rs.getString(6)))
								//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
								sql="SELECT  * FROM order_form AS t1, order_form_product AS t2 WHERE t1.order_id=t2.order_id AND t2.order_id='"+order_id+"'"; //算出共幾筆資料
								ResultSet rs=con.createStatement().executeQuery(sql);
								//先移到檔尾, getRow()後, 就可知道共有幾筆記錄
								rs.last();
								int total_content=rs.getRow();
								//每頁顯示5筆, 算出共幾頁
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
					sql="SELECT * FROM order_form AS t1, order_form_product AS t2 WHERE  t1.order_id=t2.order_id  AND t2.order_id='"+order_id+"' ";
					//sql="SELECT distinct * FROM order_form AS t1, order_form_product AS t2 WHERE t1.order_id=t2.order_id AND t2.order_id='"+order_id+"' ORDER BY no DESC LIMIT ";
					//sql="SELECT  * FROM order_form AS t1, order_form_product AS t2 WHERE t1.order_id=t2.order_id AND t2.order_id='"+order_id+"'ORDER BY no DESC LIMIT "; //LIMIT是限制傳回筆數
								//sql+=start_record;
								//sql+=start_record+",5";
								//上述語法解讀如下:
								// current_page... select * from guestbook order by no desc limit
								//      current_page=1: select * from guestbook order by no desc limit 0, 5 //從第0筆顯示5筆
								//      current_page=2: select * from guestbook order by no desc limit 5, 5 //從第5筆顯示5筆
								//      current_page=3: select * from guestbook order by no desc limit 10, 5//從第10筆顯示5筆
								rs=con.createStatement().executeQuery(sql);

							
								//逐筆顯示, 直到沒有資料(最多還是5筆)
					%>
								<div class="order_content">
									<table width="100%" border="0">
										<thead>
											<tr>
												<th class="">訂貨日期</th>
												<th class="">訂單編號</th>
												<th class="">商品編號</th>
												<th class="">商品名稱</th>
												<th class="">價格</th>
												<th class="">數量</th>
												<!-- <th class="">付款方式</th>
												<th class="">地址</th> -->
											</tr>
										</thead>
										<% 
										while(rs.next()){
											out.println("<tbody>");
											out.println("<tr>");
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("order_date"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("order_id"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_id"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_name"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_total"));
													out.println("</span>");
												out.println("</td>");
												////
												out.println("<td>");
													out.println("<span>");
														out.println(rs.getString("product_amount"));
													out.println("</span>");
												out.println("</td>");
											out.println("</tr>");
										out.println("</tbody>");	 
									}%>
										<!-- <tbody>
											<tr class="content_special">
												<td >2017/05/20</td>
												<td>7777777</td>
												<td>A7777777</td>
												<td>原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)</td>
												<td>777</td>
												<td>7</td>
												<td>超商取貨</td>
												<td>桃園市平鎮區興埔路211巷11號</td>
											</tr>
										</tbody> -->
									</table>
									<%
										String  order_id2 = request.getParameter("order_id");
										//session.setAttribute("order_id2", order_id2);//設定session.order_id
										sql="SELECT  * FROM order_form AS t1, order_form_product AS t2 WHERE t1.order_id=t2.order_id AND t2.order_id='"+session.getAttribute("order_id")+"'";
										
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
												out.print("<a href='order_content.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
											}
										out.println("</div>");
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
									<!-- <div class="page">
										<a href="">1</a>
										<a href="">2</a>
										<a href="">3</a>
										<a href="">4</a>
										<a href="">5</a>
									</div> -->
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
								<a href="javascript: return false" onclick="Paw_shopinf();">管理者登入</a>
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
								<a href="" target="_blank"><img style="width:27px;height:2px no-repeat;" src="../img/index/icon_fb.png"></a>
							</li>
							<li>
								<a href="" target="_blank"><img style="width:35px;height:2px no-repeat;" src="../img/index/icon_ig.png"></a>
							</li>
							<li>
								<a href="" target="_blank"><img style="width:27px;height:2px no-repeat;" src="../img/index/icon_line.png"></a>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</footer>
	</body>
</html>