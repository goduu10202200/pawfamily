<%@ page import = "java.sql.*, java.util.*"%>
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
           sql="select * from member ";
           ResultSet rs=con.createStatement().executeQuery(sql);
           String id_check=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
            
          
                //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1",)編碼
           String new_id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
           String new_pwd=new String(request.getParameter("pwd").getBytes("ISO-8859-1"),"UTF-8");
           String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");      
           String new_mail=request.getParameter("mail");
           String new_phone=request.getParameter("phone");
           String new_address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");  
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
          //判斷id有沒有重複
            while(rs.next()){
               //if(new_id==new_id){
                  out.print("<script>alert('"+new_id+"');location.href='signup.jsp'; </script>");   
               //}
            }
//Step 4: 執行 SQL 指令 
           sql="insert member (id, pwd, name, mail, phone,address,putdate) ";
           sql+="value ('"+new_id+"', ";
           sql+="'"+new_pwd+"', ";
           sql+="'"+new_name+"', ";
           sql+="'"+new_mail+"', ";  
           sql+="'"+new_phone+"', ";
           sql+="'"+new_address+"', ";
           sql+="'"+new_date+"')";    
        con.createStatement().execute(sql);   
             
          
         
           
           
//out.println(sql);
          
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("login.jsp");
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