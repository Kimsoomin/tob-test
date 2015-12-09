<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(function() {
	
	$("#findIdBtn").click(function() {
		if($("#name").val() == "") {
			alert("이름을 입력하세요s.");
			$("#name").focus();
			return false;
		}
		
		if($("#birth").val() == "") {
			alert("생년월일을 입력하세요.");
			$("#birth").focus();
			return false;
		}
		
		$.ajax({
			type:"post",
			data:{name:$("#name").val(), birth:$("#birth").val(), mode:"id"},
			dataType:"json",
			url:"${context}/member/Member.do?page=find_act",
			success: function(data) {
				if(data.result == "success") { 
					$("#userid_txt").text(data.userid);
				} else {
					alert("가입되지 않은 회원정보입니다.");
					return false;
				}
			},
			error: function(e) {
				//alert(e);
			}
		});		
	});
	
	
	$("#findPwdBtn").click(function() {
		if($("#userid").val() == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		
		if($("#email").val() == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}
		
		$.ajax({
			type:"post",
			data:{userid:$("#userid").val(), email:$("#email").val(), mode:"pwd"},
			dataType:"json",
			url:"${context}/member/Member.do?page=find_act",
			success: function(data) {
				if(data.result == "success") { 
					alert("비밀번호가 가입된 이메일로 발송되었습니다.(비밀번호:"+data.password+")");
					$("#password_txt").text(data.password);
				} else {
					alert("가입되지 않은 회원정보입니다.");
					return false;
				}
			},
			error: function(e) {
				//alert(e);
			}
		});		
	});
	
});
</script>
<h3>아이디 찾기</h3>
<form name="joinForm" id="joinForm">
<table border="1" style="width:500px;">
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" value="" /></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" name="birth" id="birth" value="" /></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;"><input type="button" id="findIdBtn" value="아이디찾기" /></td>
	</tr>
	<tr>
		<th>검색된 아이디</th>
		<td><span id="userid_txt"></span></td>
	</tr>
</table>

<h3>비밀번호 찾기</h3>
<table border="1" style="width:500px;">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="userid" id="userid" value="" /></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email" value="" /></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;"><input type="button" id="findPwdBtn" value="비밀번호찾기" /></td>
	</tr>
</table>
</form>
	