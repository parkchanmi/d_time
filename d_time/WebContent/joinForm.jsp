<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<h1>회원가입 페이지</h1>

		<form method="post" action="index.do" name="userinput" onsubmit="return checkIt()">
			<table>
			
			<tr>
			<td>구분</td>
				<td>		
				<input type="radio" name="mem_type" value="직영">직영
				<input type="radio" name="mem_type" value="가맹">가맹

				</td>
			</tr>
				
				<tr>
					<td>아이디</td>
				<td>
					<input type="text" name="mem_id" size="50"/></td>
					<td>
                     <input type="button" name="confirmid" value="중복확인"   class="btn_confirm01" OnClick="openConfirmid(this.form)">   
                           <input type="hidden" name="idcheck" value="0">
                           </td>
				</tr>
				
                
                
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mem_pwd" size="50"></td>
				</tr>

				<tr>
					<th scope="row"><label for="pwd_chk">비밀번호 확인 </label></th>
					<td><input type="password" name="pwd_chk" id="pwd_chk" size="50" maxlength="12" onkeyup="chkPwd()">
			      	<span id="checkPwd"></span></td>
				</tr>
				

				<tr>
					<td>이름</td>
					<td><input type="text" name="mem_name" size="50"></td>
				</tr>


				<tr>
					<td>연락처</td>
					<td><input type="text" name="mem_hp" size="50"></td>
				</tr>

				
				
				
				<tr>
					<td>지점코드</td>
				<td>
					<input type="text" name="s_code" size="50"/></td>
					
					<td>
                     <input type="button" name="confirms_code" value="코드확인"   class="btn_confirm01" OnClick="openConfirm_code(this.form)">   
                           <input type="hidden" name="s_codecheck" value="0">
                           </td>
				</tr>
				
				


				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="가입하기"> 
					<input type="button" value="취소" onclick="window.location='/d_time/index.jsp'"></td>
				</tr>

			</table>
 <input type="text" name="s_no" value="1"/> 
		</form>
	</center>
</body>
</html>