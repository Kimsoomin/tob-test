<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(function() {
	$("#joinBtn").click(function() {
		if($("#name").val() == "") {
			alert("이름을 입력하세요ddd.");
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
			url:"${context}/member/Member.do?page=mypage_act",
			success: function(data) {
				if(data.result == "success") { 
					alert("회원정보가 수정되었습니다.");
					location.reload();
				} else { 
					alert("회원정보 수정중 오류가 발생했습니다.");
					return false;
				}
			},
			error: function(e) {
				//alert(e);
			}
		});
		
	});	
	
	
	$("#chgPwdBtn").click(function() {
		if($("#password").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false;			
		}
		if($("#password").val() != $("#repassword").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#password").val("");
			$("#repassword").val("");
			$("#password").focus();
			return false;			
		}
		
		$.ajax({
			type:"post",
			data:{userid:$("#userid").val(), password:$("#password").val(), mode:"pwd"},
			dataType:"json",
			url:"${context}/member/Member.do?page=mypage_act",
			success: function(data) {
				if(data.result == "success") { 
					alert("비밀번호가 변경되었습니다.");
					location.reload();
				} else { 
					alert("비밀번호 변경중 오류가 발생했습니다.");
					return false;
				}
			},
			error: function(e) {
				//alert(e);
			}
		});
	});
	
	$("#joinOutBtn").click(function() {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			$.ajax({
				type:"post",
				data:{userid:$("#userid").val()},
				dataType:"json",
				url:"${context}/member/Member.do?page=join_out",
				success: function(data) {
					if(data.result == "success") { 
						alert("회원 탈퇴가 처리되었습니다.");
						location.replace("${context}/");
					} else { 
						alert("회원 탈퇴중 오류가 발생했습니다.");
						return false;
					}
				},
				error: function(e) {
					//alert(e);
				}
			});
		}				
	});
	
});
</script>
<h3>회원정보상세페이지</h3>
<form name="joinForm" id="joinForm">
<input type="hidden" name="userid" id="userid" value="${member.userid}" />
<input type="hidden" name="mode" id="mode" value="member" />
<table border="1" style="width:500px;">
	<tr>
		<th>아이디</th>
		<td>${member.userid}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="password" id="password" size="10" value="" /> 
			확인<input type="password" name="repassword" id="repassword" size="10" value="" />
			<input type="button" value="비밀번호변경" id="chgPwdBtn" />
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${member.name}</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${member.birth}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email" value="${member.email}" /></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" id="phone" value="${member.phone}" maxlength="15" /></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" id="addr" value="${member.addr}" style="width:100%;" /></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" id="joinBtn" value="회원정보수정" /> 
			<input type="button" value="취소" onclick="form.reset();" />
			<input type="button" value="회원탈퇴" id="joinOutBtn" />
		</td>
	</tr>
</table>
</form>
	