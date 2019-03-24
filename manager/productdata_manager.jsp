<%@ page import = "java.sql.*, java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理者 商品修改</title>
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
	.a{
	  position: absolute;
	  top: 150px;
	  right: 570px;
	}
</style>
	</head>

	<body>		
		<center>
			
			<a href="manager_center.jsp"><input type="button" class="button alt" value="返回選擇列"></a><p>
			<div class="revise"><input type="submit" class="button alt" name="addcake" value="新增商品" onclick="window.location.href='add_product_view.jsp';"> <input type="submit" class="button alt" name="deletecake" value="刪除商品" onclick="window.open('delete_product_view.jsp', '刪除商品', config='height=400,width=400');"></div>
			<h3>修改商品</h3>
			<form method="post" name="send" action="revise_product_check.jsp">
				<div class="revise"><input type="text" name="product_id" placeholder="欲修改商品之編號"> <input type="submit" class="button alt" name="revise" value="前往修改"></div>
			</form>
			<h3>商品資料區</h3>
			<%
				try {
				//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
					try {
				//Step 2: 建立連線 	
						String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
						String sql="";
						Connection con=DriverManager.getConnection(url,"root","1234");
						if(con.isClosed())
						   out.println("連線建立失敗");
						else {
				//Step 3: 選擇資料庫   
						   con.createStatement().execute("use pawfamily");
				//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
						   sql="select * from paw_goods AS t1,paw_goods_class_feature_2 AS t4 where t1.class_id=t4.feature2_id "; //算出共幾筆留言
						   ResultSet rs=con.createStatement().executeQuery(sql);
						   rs=con.createStatement().executeQuery(sql);
						   
				//  逐筆顯示, 直到沒有資料(最多還是5筆)
			%>
			<%	   
				 while(rs.next())
            {
			%>
			<table>        
				<tr>
					<th rowspan="6">
						<img src="../img/product/manager/<%=rs.getString("t1.product_id")%>_2.jpg" width="50%" height="50%">
					</th>
					<td> 
						<b><font size="4" face="Dotum">商品編號： <font color="#FF0000"> ( <%=rs.getString("product_id") %> )</font></font></b>
					</td>
				</tr>
				<tr>
					<td>
						<b><font size="3" face="Dotum">商品類別： <font color="#FF0000"> <%=rs.getString(2) %></font></font></b>
					</td>
				</tr>
				<tr>
					<td>
						<b><font size="4" face="Dotum">商品品牌：<font size="4" face="Dotum"> <%=rs.getString(3)%></font></b>
					</td>
				</tr>
				<tr>
					<td>
						<b><font size="3" face="Dotum">商品名稱：<font color="#0000FF"><%=rs.getString(4)%></font></font></b>
					</td>
				</tr>
				<tr>
					<td> 
						<b><font size="4" face="Dotum">商品價格: </font><font size="5"><%=rs.getString(6)%>元</font></b>
					</td>
				</tr>
				<tr>
					<td> 
						<b><font size="4" face="Dotum">商品庫存: </font><font size="5"><%=rs.getString(7)%></font></b>
					</td>
				</tr>
 
			</table>
			<%
				}
				//Step 6: 關閉連線
						  con.close();
					  }
					}
					catch (SQLException sExec) {
						   out.println("SQL錯誤"+sExec.toString());
					}
				}
				catch (ClassNotFoundException err) {
					  out.println("class錯誤");
				}
			%>
		</center>

	</body>
</html>


	