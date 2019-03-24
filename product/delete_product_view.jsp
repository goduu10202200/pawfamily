<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<head>

	<title>管理者 觀看刪除商品</title>
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



	<script type="text/javascript">
	  function an(){
		if(document.send.dele.value=='')
			{
			   alert('尚未輸入欲刪除之商品編號');
			   document.send.dele.focus();
			   return false;
			}
			return true;
	  }
	</script>

	<center>

	<form method="post" name="send" action="delete_product.jsp" onsubmit="return an();">
		
			<h3>商品刪除</h3>
			<div class="delete">
				<input type="text" name="dele" size="10" placeholder="請輸入欲刪除商品之編號"><p>
				<input type="submit" name="submit" class="button alt" value="確認刪除">
			</div>
	</form>


	</center>
</body>
</html>
