


<%@page import = "java.sql.*, java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>


<html>
<head>
<title>Product</title>
</head>
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
        font-size: 20px;
    }

    ul.drop-down-menu li {
        position: relative;
        white-space: nowrap;
        border-left: #ccc 1px solid;        
    }

    ul.drop-down-menu > li:last-child {
        border-left: none;
    }

    ul.drop-down-menu > li {
        float: left; 
    }  
    
     ul.drop-down-menu a {
        background-color: #fff;
        color: #333;
        display: block;
        padding: 0 100px;
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

<body>

	<center>
		<a href="manager_center.jsp"><input type="button" class="button alt" value="返回選擇列"></a><p>

	

	
	<ul class="drop-down-menu">
        <li><a target="bot" href="food.jsp">食物</a>
        </li>
		
        <li><a target="bot" href="home.jsp">寵物窩</a>
        </li>
		
        <li><a target="bot" href="toy.jsp">玩具</a>
        </li>
		
        <li><a target="bot" href="bowl.jsp">寵物碗</a>
        </li>
		
        <li><a target="bot" href="customized.jsp">客製化</a>
        </li>
		
    </ul>

</center>


</body>
</html>