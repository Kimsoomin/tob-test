<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src= "${context}/js/global.js"></script>

<script type="text/javascript">
	$(function() {/* (document).ready 를 지워도됨. */
		Global.init();
		$('#header').load('${context}/main.do?page=header');
		$('#box').load('${context}/main.do?page=jumbotron');
		$('#footer').load('${context}/main.do?page=footer');
		//$('#footer') => 들어갈 장소를 지정해놈. id가 footer인 곳으로 지정.
		//class
	});
	
</script>