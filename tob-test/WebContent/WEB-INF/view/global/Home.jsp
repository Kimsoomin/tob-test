<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src= "${context}/js/global.js"></script>
<script type="text/javascript">
	$(function() {
		Global.init();
		$('#box').load('${context}/main/Home.do?page=header');
		$('#footer').load('${context}/main/Home.do?page=footer');
	});
	
</script>