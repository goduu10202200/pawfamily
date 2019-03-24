<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../member/config.jsp" %>
<%

    sql = "SELECT * FROM paw_goods WHERE product_id='" +session.getAttribute("product_id")+"';"; //選擇資料表
	ResultSet rs =con.createStatement().executeQuery(sql);
	String product_id="",product_class="",product_name="",product_price="",product_stock="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
		product_id=rs.getString("product_id");
		product_class=rs.getString("class_id");
	    product_name=rs.getString("product_name");
		product_price=rs.getString("product_price");
		product_stock=rs.getString("product_stock");		
	}
	

%>
<html>
	<head>
	<title>管理者 商品修改查看</title>
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

	<script type="text/javascript">
	  function chk(){
		if(document.send.product_class.value=='')
			{
			   alert('商品類別請勿空白');
			   document.send.product_class.focus();
			   return false;
			}
		if(document.send.product_logo.value=='')
			{
			   alert('商品品牌請勿空白');
			   document.send.product_logo.focus();
			   return false;
			}		
		if(document.send.product_name.value=='')
			{
			   alert('商品名稱請勿空白');
			   document.send.product_name.focus();
			   return false;
			}
		if(document.send.product_color.value=='')
			{
			   alert('商品顏色請勿空白');
			   document.send.product_color.focus();
			   return false;
			}
		if(document.send.product_price.value=='')
			{
			   alert('商品價格請勿空白');
			   document.send.product_price.focus();
			   return false;
			}
		if(isNaN(document.send.product_price.value))
			{
			   alert('價格請填正整數');
			   document.send.product_price.focus();
			   return false;
			}			
		if(document.send.product_stock.value=='')
			{
			   alert('庫存量請勿空白');
			   document.send.product_stock.focus();
			   return false;
			}					
			 return true;		 
	  }
	</script>
	  
	</head>
	<body>
		<center>

           <a href="product.jsp"><input type="button" class="button alt" value="返回商品資料"></a><p>
	
		
	<form method="post" name="send" action="revise_product.jsp" onsubmit="return chk();">
	
	<h3>商品資料</h3>
	<div class="design1">
	<table>
		<tr>
			<th rowspan="6">
				<img src="img/lipstick-Dior_<%=product_id%>.jpg" width="100%" height="50%">
			</th>
			<th><font color="red">編號</font></th>   <td><input type="text" name="product_id" value="<%=product_id%>" readonly="readonly"></td>
		</tr>
		<tr><th>商品分類</th>   <td><input type="text" name="product_class"  size="20" value="<%=product_class%>"></td></tr>
		<tr><th>商品名稱</th>   <td><input type="text" name="product_name"  size="20" value="<%=product_name%>"></td></tr>
		<tr><th>商品價格</th>   <td><input type="text" name="product_price"  size="20" value="<%=product_price%>"></td></tr>
		<tr><th>商品庫存</th>   <td><input type="text" name="product_stock"  size="20" value="<%=product_stock%>"></td></tr>	
	</table><p>
	</div>
	<input type="submit" name="submit" class="button alt" value="送出修改">
	</form>	
</center>
   
</body>
</html>