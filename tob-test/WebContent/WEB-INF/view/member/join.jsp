<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(function() {
	$("#joinBtn").click(function() {
		if($("#userid").val() == "") {
			alert("아이디를 입력하세요s.");
			$("#userid").focus();
			return false;
		}
		if($("#passowrd").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#passowrd").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false;
		}
		if($("#birth").val() == "") {
			alert("생년월일을 입력하세요.");
			$("birth").focus();
			return false;
		}
		if($("#email").val() == "") {
			alert("이메일을 입력하세요.");
			$("email").focus();
			return false;
		}
		if($("#phone").val() == "") {
			alert("전화번호를 입력하세요.");
			$("phone").focus();
			return false;
		}
		if($("#addr").val() == "") {
			alert("주소를 입력하세요.");
			$("addr").focus();
			return false;
		}

		
		

		
		$.ajax({
			type:"post",
			data:$("#joinForm").serialize(),
			dataType:"json",
			url:"${context}/member/Member.do?page=join_act",
			success: function(data) {
				//console.log(data);
				if(data.result == "success") { 
					alert(data.name+"님 회원가입 가입되었습니다.");
					//location.replace(""); // 로그인 페이지 이동
				} else if(data.result == "chk") { 
					alert("이미 가입된 아이디입니다.");
					return false;
				} else { 
					alert("회원가입 중 오류가 발생했습니다.");
					return false;
				}
			},
			error: function(e) {
				//alert(e);
			}
		});
		
	});	
	
	
	$("#dupBtn").click(function() {
		if($("#userid").val() == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}	
		
		$.ajax({
			type:"post",
			data:{userid:$("#userid").val()},
			dataType:"json",
			url:"${context}/member/Member.do?page=join_chk",
			success: function(data) {
				if(data.result == "fail") { 
					alert("이미 가입된 아이디입니다.");
					return false;
				} else {
					alert("회원가입 가능한 아이디입니다.");
					$("#password").focus();
				}
			},
			error: function(e) {
				//alert(e);
			}
		});
		
		
	});
});
</script>
<h3>회원 가입</h3>
<form name="joinForm" id="joinForm">
<table border="1" style="width:500px;">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="userid" id="userid" value="" /> <input type="button" value="중복체크" id="dupBtn" /></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" value="" /></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" value="" /></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" name="birth" id="birth" value="" /></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<label><input type="radio" name="gender" id="gender1" value="남" checked />남</label>
			<label><input type="radio" name="gender" id="gender2" value="여" />여</label>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email" value="" /></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" id="phone" value="" maxlength="15" /></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" id="addr" value="" style="width:100%;" /></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;"><input type="button" id="joinBtn" value="확인" /><input type="button" value="취소" onclick="form.reset();" /></td>
	</tr>
</table>
</form>
	