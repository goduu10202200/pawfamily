<%@page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

	<head>
		<title>查看所有會員</title>
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
					out.print("[<a href='outManger.jsp'><font face='Microsoft JhengHei' size='3'>登出</a>]</div>");
				}
				else
				{
					out.println("<script language='javascript'>alert(\"你尚未登入 !!\");window.location.href='manager.jsp';</script>");
				}
			%>
			
		</div>
		<center>
			
				<a href="manager_center.jsp"><input type="button" class="button alt" value="返回選擇列"></a><br></br>
				<form name="send" method="post" action="delete_member_check.jsp">
	
					
					<div class="delete"><input type="text" name="dele" placeholder="刪除會員的編號"> <input type="submit" class="button alt" name="submit" value="確認刪除"></div>
				</form>
					
					
				<%		
					try {
							//Step 1: 載入資料庫驅動程式 
							Class.forName("com.mysql.jdbc.Driver");
								try {
										//Step 2: 建立連線 	
										String url="jdbc:mysql://?useUnicode=true&characterEncoding=utf-8";
										String sql="";
										Connection con=DriverManager.getConnection(url,"root","1234");
										if(con.isClosed())
											out.println("連線建立失敗");
										else {
												//Step 3: 選擇資料庫   
												sql="use pawfamily";
												con.createStatement().execute(sql);
												//con.createStatement().execute(sql);
												//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
												sql="select * from member"; //算出共幾筆留言
												ResultSet rs=con.createStatement().executeQuery(sql);

												//先移到檔尾, getRow()後, 就可知道共有幾筆記錄
												rs.last();
												int total_name=rs.getRow();
												out.println("<h3>共 <font color='#ff0000'>"+total_name+"</font> 個會員</h3>");
												out.println("<hr>");						   
												//每頁顯示5筆, 算出共幾頁
												int page_num=(int)Math.ceil((double)total_name/5.0); //無條件進位
													if (page_num==0) //無留言時將頁數指標訂為1
														page_num=1;
														out.println("<span class='word'>請選擇頁數：</span>");
														//使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
														for(int i=1;i<=page_num;i++) //使用get傳輸方式,建立1,2,...頁超連結
															{
																out.print("<a href='view_member.jsp?page="+i+"'><span class='word'>"+i+"</span></a>&nbsp;&nbsp;&nbsp;"); //&nbsp;html的空白
															}
															out.println("<p><p>");

														//讀取page變數
														String page_string = request.getParameter("page");
														   if (page_string == null) 
																page_string = "1";  //無留言時將頁數指標訂為1        
																Integer current_page=Integer.valueOf(page_string);//將page_string轉成整數
																//Integer current_page=Integer.valueOf(request.getParameter("page"));
																//計算開始記錄位置   
																//Step 5: 顯示結果 
																int start_record=(current_page-1)*5;
																//遞減排序, 讓最新的資料排在最前面
																sql="SELECT * FROM member ORDER BY no DESC LIMIT ";//LIMIT是限制傳回筆數
																sql+=start_record+",5";
																		   //上述語法解讀如下:
																		   // current_page... select * from member order by no desc limit
																		   //      current_page=1: select * from member order by no desc limit 0, 5 //從第0筆顯示5筆
																		   //      current_page=2: select * from member order by no desc limit 5, 5 //從第5筆顯示5筆
																		   //      current_page=3: select * from member order by no desc limit 10, 5//從第10筆顯示5筆
																		   //      current_page=4: select * from member order by no desc limit 15, 5//從第15筆顯示5筆
																		   //      current_page=5: select * from member order by no desc limit 20, 5//從第20筆顯示5筆
																			
																rs=con.createStatement().executeQuery(sql);
																		   
																//  逐筆顯示, 直到沒有資料(最多還是5筆)
																while(rs.next())
																{
																	
																		out.println("會員編號: "+rs.getString("no")+"<br>");
																		out.println("會員姓名: "+rs.getString("name")+"<br>");	
																		out.println("會員帳號: "+rs.getString("id")+"<br>");
																		out.println("會員電話: "+rs.getString("phone")+"<br>");		
																		out.println("E-mail: "+rs.getString("mail")+"<br><hr>");
																		//out.println("加入時間</th><td>"+rs.getString("date")+"<br>");
																	
																}
																//Step 6: 關閉連線
																		  con.close();
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
				
		</center>
	</body>
</html>