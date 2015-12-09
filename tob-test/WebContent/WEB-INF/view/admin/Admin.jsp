<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="header"></div>

<div class="list-group" id="main_left">
  <a href="#" class="list-group-item active">
    관리자 기능
  </a>
  <a href="#" class="list-group-item" id="admin_home">홈</a>
  <a href="#" class="list-group-item" id="mgmt_member">회원관리</a>
  <a href="#" class="list-group-item" id="mgmt_prod">책관리</a>
  <a href="#" class="list-group-item" id="search">이벤트관리</a>
</div>

<div id="main_right">

<div id="linechart_material"></div> 

</div>


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
google.load('visualization', '1.1', {packages: ['line']});
google.setOnLoadCallback(drawChart);

function drawChart() {

  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Day');
  data.addColumn('number', '판매수량');
  data.addColumn('number', '판매금액');
  data.addColumn('number', '방문자수');

  data.addRows([
    [1,  3, 80.8, 41.8],
    [2,  30.9, 69.5, 32.4],
    [3,  25.4,   57, 25.7],
    [4,  11.7, 18.8, 10.5],
    [5,  1, 17.6, 10.4],
    [6,   8.8, 13.6,  7.7],
    [7,   7.6, 12.3,  9.6],
    [8,  12.3, 29.2, 10.6],
    [9,  16.9, 42.9, 14.8],
    [10, 12.8, 30.9, 11.6],
    [11,  5.3,  7.9,  4.7],
    [12,  6.6,  8.4,  5.2],
    [13,  41.8,  6.3,  3.6],
    [14,  48.2,  6.2,  3.4]
  ]);

  var options = {
    chart: {
      title: 'Admin TEST',
      subtitle: '에혀'
    },
    width: 700,
    height: 500
  };

  var chart = new google.charts.Line(document.getElementById('linechart_material'));

  chart.draw(data, options);
} 

$(function() {
	$('#header').load('${context}/admin.do?page=header');
	$('#main_left').css("float","left").css('width','300px').css('text-align','center');
	$('#main_right').css("float","left").css("margin-left","150px").css('width','50%');
	$('#tab_member').css('width','100%');
	$('#mgmt_member').click(function() {
		Admin.memberList("${context}");
	});
	$('#search').click(function() {
		$('#main_right').load('${context}/admin.do?page=search');
	});
});	
 $('#btn_admin_table').click(function() {
    $('#btn_admin_table').submit();
  });
 
 
 var Admin = {
	memberList : function(project) {
		 $.getJSON('${context}/admin/Admin.do?page=member_list', function(data) {
			 var arr = [];
			 var table = '<div id="member_list"><h1>회원목록</h1>'
					+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th><th>이름</th>'
					+'<th>생년월일</th><th>성별</th><th>이메일</th>'
					+'<th>전화번호</th><th>주소</th></tr>';
					$.each(data, function() {
						arr.push(this.id);
						table +='<tr><td><button id="' + this.id + '" href=#>'+this.id+'</button></td>'
							+'<td>'+this.password+'</td>'
							+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
							+'<td>'+this.gender+'</td><td>'+this.email+'</td>'
							+'<td>'+this.phone+'</td><td>'+this.addr+'</td></tr>';
					});
					table += '</table></div>';
					$(table).appendTo($('#main_right').empty());
					// 아이디별로 버튼 달기
					$.each(data, function(project) {
						$("#"+this.id).click(function() {
							Bom.popup(project,arr[index]);
						});
					});
					$("#member_list").css({
						"padding-top" : "50px",
						"padding-left" : "150px",
						"background":"white",
						"height":"1000px"
						});
					$("#member_list button").css({
						"border":"none",
						"background":"none"
						
					});
					$("#tab_member").css("width","90%");
					$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
						"border" : "1px solid black",
						"border-collapse" : "collapse",
						"text-align" : "center",
					});
					});
	}	
 };
 /* ======================================================================= */
 var Admin2 = {
			 	home : function(project) {
					$("#box").load(project + "/member/Member.do?page=admin_home");
				},
				member : function(project) {
					 $.getJSON(project + '/admin/Admin.do?page=member_list', function(data) {
						 var arr = [];
						 var table = '<div id="member_list"><h1>회원목록</h1>'
								+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th>'
								+'<th>이름</th><th>생년</th><th>성별</th>'
								+'<th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th></th>';
								$.each(data, function() {
									arr.push(this.id);
									table +='<tr><td><button id="' + this.id + '" href=#>'+this.id+'</button></td>'
										+'<td>'+this.password+'</td>'
										+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
										+'<td>'+this.gender+'</td><td>'+this.phone+'</td>'
										+'<td>'+this.addr+'</td><td>'+this.email+'</td>'
										+'<td>'+this.regdate+'</td></tr>'
								});
								table += '</table></div>';
								$(table).appendTo($('#box').empty());
								// 아이디별로 버튼 달기
								$.each(data, function(index) {
									$("#"+this.id).click(function() {
										Bom.popup(project,arr[index]);
									});
								});
								
								// css 부분
								$("#member_list").css({
														"padding-top" : "50px",
														"padding-left" : "150px",
														"background":"white",
														"height":"1000px"
														});
								$("#member_list button").css({
									"border":"none",
									"background":"none"
									
								});
								$("#tab_member").css("width","90%");
								$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
									"border" : "1px solid black",
									"border-collapse" : "collapse",
									"text-align" : "center",
								});
					});
				},
				movie : function(project) {
					 $.getJSON(project + '/admin/Admin.do?page=movie_list', function(data) {
						 var arr = [];
						 var table = '<div id="movie_list"><h1>영화목록</h1>'
						 	 	   + '<table id="tab_movie"><tr><th>영화번호</th><th>영화이름</th>'
						 	       + '<th>감독</th><th>배우</th><th>등급</th><th>런타임</th><th>가격</th>'
						 	       + '<th>장르</th><th>개봉일</th><th>종료일</th><th>줄거리</th>'
						 	       + '<th>스틸컷</th><th>트레일러</th></tr>';
							 $.each(data, function() {
								arr.push(this.filmNumber);
								table +='<tr><td><button id="'+this.filmNumber+'">'+this.filmNumber+'</button</td><td>'+this.filmName+'</td>'
									+'<td>'+this.director+'</td><td>'+this.actor+'</td>'
									+'<td>'+this.rate+'</td><td>'+this.runtime+'</td>'
									+'<td>'+this.price+'</td><td>'+this.genre+'</td>'
									+'<td>'+this.releaseDate+'</td><td>'+this.endDate+'</td>'
									+'<td>'+this.story+'</td><td><div>'+this.cut+'</div></td>'
									+'<td><div>'+this.trailer+'</div></td></tr>'
								});
								table += '</table>';
								$(table).appendTo($('#box').empty());
								// 아이디별로 버튼 달기
								$.each(data, function(index) {
									$("#"+this.filmNumber).click(function() {
										Bom2.popup(project,arr[index]);
									});
								});
								$("#movie_list div").css({
														"width":"150px",
														"overflow":"auto"
														});
								$("#movie_list").css({
									"padding-top" : "20px",
									"padding-left" : "20px",
									"padding-right" : "20px",
									"background":"white",
									"height":"1000px",
									});
								$("#movie_list button").css({
									"background":"none",
									"border":"none"
								});
								$("#tab_movie").css("width","100%");
								$("#tab_movie tr").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
								$("#tab_movie th").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
								$("#tab_movie td").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
					});
				}
	 };
 
</script>















