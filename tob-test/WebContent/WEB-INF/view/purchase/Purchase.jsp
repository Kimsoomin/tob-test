<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id = "box">
	<a href="#" class="list-group-item" id="pur_purNum">전체주문목록 보기</a>
	<a href="#" class="list-group-item" id="pur_accNum">날짜별 주문목록 보기</a>
	<a href="#" class="list-group-item" id="pur_userid">사용자 아이디에 따른 주문목록</a>
</div>

<script type="text/javascript">
	$(function() {
		$('#pur_purNum').click(function() {
			Purchase.purList();
		});
		$('#pur_accNum').click(function() {
			Purchase.accList();
		});
		$('#pur_userid').click(function() {
			Purchase.useridList();
		});
	});

	
	var Purchase = {
			purList : function() {
				$.getJSON('${context}/order/Order.do?page=pur_list', function() {
					var table = '<h1> 전체주문 목록</h1>'
						+'<table id="tab_list"><tr><th>주문번호</th><th>총 금액</th><th>accountNum</th>'
						+'<th>유저 아이디</th></tr>';
						$.each(data, function() {
							
						});
						table += '</table>';
						
						$('')
				});
			},
			accList : function() {
				$.getJSON('${context}/order/Order.do?page=acc_list&', function(data) {
					var table = '<h1> 주문번호에 따른 목록</h1>'
						+'<table id="tab_list"><tr><th>주문번호</th><th>총 금액</th><th>accountNum</th>'
						+'<th>유저 아이디</th></tr>';
						$.each(data, function() {
							table += '<tr><td>'+this.purNum+'</td>'
							+'<td>'+this.sum+'</td><td>'+this.accNum+'</td>'
							+'<td>'+this.userid;
						});
						table += '</table>';
						$(table).appendTo($('#box').empty());	
						
				});
			},
			
			useridList : function() {
				$.getJSON('${context}/order/Order.do?page=user_list&userid=???', function() {
					var table = '<h1> 유저아이디에 따른 목록</h1>'
						+'<table id="tab_list"><tr><th>주문번호</th><th>총 금액</th><th>accountNum</th>'
						+'<th>유저 아이디</th></tr>';
						$.each(data, function() {
							table += '<tr><td>'+this.purNum+'</td>'
							+'<td>'+this.sum+'</td><td>'+this.accNum+'</td>'
							+'<td>'+this.userid;
						});
						table += '</table>';
						$(table).appendTo($('#box').empty());
				});
			}
			
	};
</script>

