<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
 <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 
<!-- Custom fonts for this template -->
<!-- <link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
 -->
<!-- Custom styles for this template -->
<!-- <link href="resources/bootstrap/css/business-casual.css"
	rel="stylesheet"> -->
<title>회원가입</title>
	<script>
   
   function checkIt(){
      
      var userinput = eval("document.userinput");
      if(!userinput.mem_id.value){
          alert("아이디를 입력하세요");
          return false;
       }
      
      if(!userinput.mem_pwd.value){
         alert("비밀번호를 입력하세요");
         return false;
      }
      if(userinput.mem_pwd.value != userinput.pwd_chk.value){
         alert("비밀번호를 동일하게 입력하세요");
         return false;
      }
   
      if(!userinput.mem_name.value){
          alert("이름을 입력하세요");
          return false;
       }
      
      if(!userinput.mem_hp.value){
          alert("전화번호를 입력하세요");
          return false;
       }
     
   
      return true;
   }
   
   //id중복여부 판단
   function openConfirmid(userinput) {//userinput에 this.form 저장되어있다.
       // id를 입력했는지 검사
       if (userinput.mem_id.value == "") {//빈문자열이랑 같다, 입력안했다.
           alert("아이디를 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "/d_time/confirmid.do?mem_id=" + userinput.mem_id.value ;
      
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200"); 
   }
   
  //코드중복여부 판단
   function openConfirm_code(userinput) {//userinput에 this.form 저장되어있다.
       // id를 입력했는지 검사
       if (userinput.s_code.value == "") {//빈문자열이랑 같다, 입력안했다.
           alert("코드를 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "/d_time/confirm_code.do?s_code=" + userinput.s_code.value ;
      
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200"); 
   } 
   
   </script>
   
</head>
<body>

<center>

</center>
<center>
		<form method="post" action="index.do" name="userinput" onsubmit="return checkIt()">
			 <div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-user"></i></span> <strong> 회원가입</strong>
			</div>
			
			<table>
			
			
				
				<tr>
					<td height="60">아이디</td>
				<td>
					<input class='col-lg-12 form-control input-sm' type="text" name="mem_id" size="50" style="height:30px;"/></td>
					<td>
                     <input type="button" name="confirmid" value="중복확인"   class="btn btn-default btn-block m-t-md" OnClick="openConfirmid(this.form)">   
                           <input type="hidden" name="idcheck" value="0">
                           </td>
				</tr>
				
                
                
				<tr>
					<td height="60">비밀번호</td>
					<td><input class='col-lg-12 form-control input-sm' type="password" name="mem_pwd" size="50" style="height:30px;"></td>
				</tr>

				<tr>
					<th scope="row" height="60"><label for="pwd_chk">비밀번호 확인 </label></th>
					<td ><input class='col-lg-12 form-control input-sm' type="password" name="pwd_chk" id="pwd_chk" size="50" maxlength="12" onkeyup="chkPwd()" style="height:30px;">
			      	<span id="checkPwd"></span></td>
				</tr>
				

				<tr>
					<td height="60">이름</td>
					<td><input class='col-lg-12 form-control input-sm' type="text" name="mem_name" size="50" style="height:30px;"></td>
				</tr>


				<tr>
					<td height="60">연락처</td>
					<td><input class='col-lg-12 form-control input-sm' type="text" name="mem_hp" size="50" style="height:30px;"></td>
				</tr>

				
				
				
				
				<tr>
					<td height="60">지점코드</td>
				<td>
					<input class='col-lg-12 form-control input-sm' type="text" name="s_code" size="50" style="height:30px;"/></td>					
				<td>					
                     <input type="button" name="confirms_code" value="코드확인"   class="btn btn-default btn-block m-t-md"
                      OnClick="openConfirm_code(this.form)">   
                     <input type="hidden" name="s_codecheck" value="0">
                </td>
			</tr>
			<tr>
			<td height="100">구분</td>
				<td>		
				<input type="radio" name="mem_typeR" value="직영" id="j_type" disabled>직영
				<input type="radio" name="mem_typeR" value="가맹" id="g_type" disabled>가맹
				<input type="hidden" name="mem_type"/>
				<input class='col-lg-12 form-control input-sm' type="text" id="s_name" disabled/>
				</td>
			</tr>
			
				
</table>
<table>
				<tr>
					<td colspan="2" align="center">
					
					<div class="form-group">
						<input type="submit"  class="btn btn-primary btn-block m-t-md" value="가입하기">	
					</div>
					
					<td colspan="2" align="center">

					<div class="form-group">
						<input type="button"  class="btn btn-default btn-block m-t-md" 
 							value="취소" onclick="window.location='/d_time/index.jsp'">	
					</div>
					</td>
				</tr>

			</table>
<input type="hidden" name="s_no" value="1"/>

</div>
<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
		</form>
	
	</center>
</body>
</html>