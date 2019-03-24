<%@page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <html>
<head>
<title>add</title>
</head>
<body>

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
            sql="use pawfamily";
            con.createStatement().execute(sql);
            //String receiver_name=request.getParameter("receiver_name");
            String receiver_name = new String(request.getParameter("receiver_name").getBytes("ISO-8859-1"),"UTF-8");
            String buyer_phone= request.getParameter("buyer_phone");
              //String buyer_phone = new String(request.getParameter("buyer_phone").getBytes("ISO-8859-1"),"UTF-8");
            //String receiver_addr= request.getParameter("receiver_addr");
            String receiver_addr = new String(request.getParameter("receiver_addr").getBytes("ISO-8859-1"),"UTF-8"); 
              //String payway= request.getParameter("payway");
            String payway = new String(request.getParameter("payway").getBytes("ISO-8859-1"),"UTF-8");
            String product_total= request.getParameter("product_total");
            java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
              //String product_total = new String(request.getParameter("product_total").getBytes("ISO-8859-1"),"UTF-8");
            //Step 4: 執行 SQL 指令 
            sql="insert order_form(id, receiver_name, buyer_phone, receiver_addr, total, pay_way ,order_id,order_date) ";
            sql+="value ('" + session.getAttribute("id") + "', ";
            sql+="'"+receiver_name+"', ";
            sql+="'"+buyer_phone+"', ";
            sql+="'"+receiver_addr+"', ";
            sql+="'"+product_total+"', ";
            sql+="'"+payway+"', ";
            sql+="'"+session.getAttribute("shoppingcar_id")+"', ";
            sql+="'"+new_date+"')";     
            con.createStatement().execute(sql);
            //shopping insert order_form_product
            sql="select * from shoppingcar where id='" +session.getAttribute("id")+"'";
            ResultSet rs=con.createStatement().executeQuery(sql);
            while(rs.next())
            {
            sql="insert order_form_product(product_id, product_name,product_amount,product_total,order_id,id,order_date) ";
            sql+="value ('" + rs.getString("product_id") + "', ";
            sql+="'"+rs.getString("product_name")+"', "; 
            sql+="'"+rs.getString("product_amount")+"', "; 
            sql+="'"+rs.getString("product_total")+"', ";
            sql+="'"+session.getAttribute("shoppingcar_id")+"', ";
            sql+="'"+session.getAttribute("id")+"', ";
            sql+="'"+new_date+"')";
            con.createStatement().execute(sql); 
            }
       
      %>
          <%
           sql = "delete from shoppingcar where id='"+session.getAttribute("id")+"'";;
                con.createStatement().execute(sql); 
            con.close();
            out.print("<script>location.href='../shoppingcar/shoppingcar_end.jsp'; </script>");   
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
</body>
</html>