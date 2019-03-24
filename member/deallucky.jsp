<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%	
		String id = (String)session.getAttribute("id");
		String lucky = request.getParameter("lucky");
		Integer award = Integer.parseInt(lucky);

		try {
				if("".equals(session.getAttribute("id"))){
					response.sendRedirect("login.jsp");
				}
				Class.forName("com.mysql.jdbc.Driver");   //載入sql驅動程式
				try {
					String url="jdbc:mysql://localhost?useUnicode=true&characterEncoding=utf-8";
					String sql="";

					Connection con=DriverManager.getConnection(url,"root","1234");   //sql連線
					if(con.isClosed())
						out.println("連線建立失敗");
					else
					{
						sql="use pawfamily";										//選擇資料庫
						con.createStatement().execute(sql);

						switch(award){
							case 0:
								//var angle = [26, 88, 137, 185, 235, 287, 337];
								//7折優惠//未中獎是0  o337(-20) n340
								sql = "update member set lucky="+0.7+" where id='"+id+"'";					
								break;
							case 1:
								//var angle = [88, 137, 185, 235, 287];
								//9折優惠//7折是1 o26(-25) n20
								sql = "update member set lucky="+0.9+" where id='"+id+"'";
								break;
							case 2:
								//var angle = [137, 185, 235, 287];
								//1折優惠 //1折是2 o88(-20) n70
								sql = "update member set lucky="+0.1+" where id='"+id+"'";
								break;
							case 3:
								//var angle = [137, 185, 235, 287];
								//未中獎//未中獎是3 o133(-20) n115
								sql = "update member set lucky="+1+" where id='"+id+"'";
								break;
							case 4:
								//var angle = [185, 235, 287];
								//5折優惠//5折是4(錯誤) o185(-20) n160
								sql = "update member set lucky="+0.5+" where id='"+id+"'";
								break;
							case 5:
								//var angle = [185, 235, 287];
								//7折優惠//5折是5 o185(-70) n155
								sql = "update member set lucky="+0.7+" where id='"+id+"'";
								break;
							case 6:
								//var angle = [235, 287];
								//未中獎//7折是6 o235 n200
								sql = "update member set lucky="+1+" where id='"+id+"'";
								break;
							case 7:
								//var angle = [287];
								//未中獎//未中獎是7 o287 n250
								sql = "update member set lucky="+1+" where id='"+id+"'";
								break;							
						}
						Integer rs = con.createStatement().executeUpdate(sql);
						
						if(rs>0){
							response.sendRedirect("member_information.jsp");
						}
						else{
							out.print("failed");
						}
					}
					con.close();
				}
				catch (SQLException sExec) {
					out.println("SQL錯誤");
					out.println(sExec.toString());
					//response.sendRedirect("login.html");
				}
			}
			catch (ClassNotFoundException err) {
				out.println("class錯誤");      //mysql-connector 沒放進lib裡
			} 
%>