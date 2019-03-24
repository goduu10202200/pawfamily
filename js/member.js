 function checkEmail(email){
					index = email.indexOf ('@', 0);		
					if (email.length==0) {
						alert("請輸入電子郵件地址！");
						return (false);
					} else if (index==-1) {
						alert("錯誤：必須包含「@」。");
						return (false);
					} else if (index==0) {
						alert("錯誤：「@」之前不可為空字串。");
						return (false);
					} else if (index==email.length-1) {
						alert("錯誤：「@」之後不可為空字串。");
						return (false);
					} else
						return (true);
				}
function datacheck(form)
			{
				var msg;
				if (document.user.id.value=="")
				{
					msg="帳號不得為空白！";
    				// document.getElementById("fname1").style.color = "red";
    				// document.getElementById("fname1").value= msg;
    				document.getElementById("test").innerHTML ="<span class='error_id'  >"+msg+"</span>";
    				document.getElementById("account").style.borderColor = "red";
    				document.getElementById("account").style.borderWidth = "medium";
    				// document.getElementById("fname").style.color = "#ff0000";
    				// document.getElementById("fname").innerText= msg;
    				// x.appendChild(msg);
    				// document.body.appendChild(x);
					// window.alert(msg);
					user.id.focus();
					return false;
				}
				if (document.user.pwd.value=="")
				{
					msg="密碼不得為空白！";
					document.getElementById("test").innerHTML ="<span class='error_password' style='color:red' >"+msg+"</span>";
    				document.getElementById("password").style.borderColor = "red";
    				document.getElementById("password").style.borderWidth = "medium";
					// window.alert(msg);
					user.pwd.focus();
					return false;
				}
				if (document.user.name.value=="")
				{
					msg="會員姓名不得為空白！";
					document.getElementById("test").innerHTML ="<span class='error_name' style='color:red' >"+msg+"</span>";
    				document.getElementById("name").style.borderColor = "red";
    				document.getElementById("name").style.borderWidth = "medium";
					// window.alert(msg);
					user.name.focus();
					return false;
				}
								
				if (document.user.mail.value=="")
				{
					msg="email不得為空白！";
					document.getElementById("test").innerHTML ="<span class='error_email' style='color:red' >"+msg+"</span>";
    				document.getElementById("email").style.borderColor = "red";
    				document.getElementById("email").style.borderWidth = "medium";
					// window.alert(msg);
					user.mail.focus();
					return false;
				}
	
				if (document.user.phone.value=="")
				{
					msg="電話不得為空白！";
					document.getElementById("test").innerHTML ="<span class='error_phone' style='color:red' >"+msg+"</span>";
    				document.getElementById("phone").style.borderColor = "red";
    				document.getElementById("phone").style.borderWidth = "medium";
					// window.alert(msg);
					user.gender.focus();
					return false;
				}
				if (document.user.address.value=="")
				{
					msg="住址不得為空白！";
					document.getElementById("test").innerHTML ="<span class='error_address' style='color:red' >"+msg+"</span>";
    				document.getElementById("address").style.borderColor = "red";
    				document.getElementById("address").style.borderWidth = "medium";
					// window.alert(msg);
					user.gender.focus();
					return false;
				}	
				if (!checkEmail(document.user.mail.value)){
					// alert("email 資料有誤！");
					return(false);	
				}													
				user.submit();
			}