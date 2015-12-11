<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${context}/css/common.css" /> 


<div id="header" style="border: 1px solid black"></div>
<div id="box">
<div class="list-group" id="main_left" style="border: 1px solid black">
    <h1>관리자 기능</h1>
  <a href="#" class="list-group-item" id="admin_home">홈</a><br>
  <a href="#" class="list-group-item" id="mgmt_member">회원관리</a><br>
  <a href="#" class="list-group-item" id="mgmt_book">책관리</a><br>
</div>

<div id="main_right" style="border: 1px solid black">

<div id="linechart_material"></div> 

</div>
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
/*  	$('#header').load('${context}/admin/Admin.do?page=header'); */
	$('#main_left').css("float","left").css('width','300px').css('text-align','center');
	$('#main_right').css("float","left").css("margin-left","150px").css('width','50%');
	$('#tab_member').css('width','100%');

	$('#mgmt_member').click(function() {
		Admin.memberList("${context}");
	});
	$('#mgmt_book').click(function() {
		Admin.bookList("${context}");
	});
	$('#admin_home').click(function() {
		Admin.home();
	});
	
});	
 $('#btn_admin_table').click(function() {
    $('#btn_admin_table').submit();
  });
 
 
 var Admin = {
	home : function() {
			location.href ="${context}/admin/Admin.do";
		},
			
	memberList : function(project) {
		 $.getJSON('${context}/admin/Admin.do?page=member_list', function(data) {
			 var arr = [];
			 var table = '<div id="member_list"><h1>회원목록</h1>'
					+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th><th>이름</th>'
					+'<th>생년월일</th><th>성별</th><th>이메일</th>'
					+'<th>전화번호</th><th>주소</th></tr>';
					$.each(data, function() {
						arr.push(this.userid);
						table +='<tr><td><button id="' + this.userid + '" href=#>'+this.userid+'</button></td>'
							+'<td>'+this.password+'</td>'
							+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
							+'<td>'+this.gender+'</td><td>'+this.email+'</td>'
							+'<td>'+this.phone+'</td><td>'+this.addr+'</td></tr>';
					});
					table += '</table></div>';
					$(table).appendTo($('#main_right').empty());
					// 아이디별로 버튼 달기
					$.each(data, function(index) {
						$("#"+this.userid).click(function() {
							Bom.popup(project,arr[index]);
						});
					});
					
					$("#member_list").css({
						"padding-top" : "50px",
						"padding-left" : "0px",
						"background":"white",
						"height":"1000px"
						});
					$("#member_list button").css({
						"border":"none",
						"background":"none"
						
					});
					$("#tab_member").css("width","100%");
					$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
						"border" : "1px solid black",
						"border-collapse" : "collapse",
						"text-align" : "center",
					});
					});
	},

	bookList : function(project) {
		 $.getJSON('${context}/admin/Admin.do?page=book_list', function(data) {
			 var arr = [];
			 var table = '<div id="book_list"><h1>책목록</h1>'
					+'<table id="tab_book"><tr><th>책아이디</th><th>책이름</th>'
					+'<th>책가격</th><th>작가</th></tr>';
					$.each(data, function() {
						arr.push(this.bookId);
						table +='<tr><td><button id="' + this.bookId + '" href=#>'+this.bookId+'</button></td>'
							+'<td>'+this.bookName+'</td>'
							+'<td>'+this.bookPrice+'</td><td>'+this.writer+'</td></tr>';
					});
					table += '</table></div>';
					$(table).appendTo($('#main_right').empty());
					// 아이디별로 버튼 달기
					$.each(data, function(index) {
						$("#"+this.bookId).click(function() {
							Bom2.popup(project,arr[index]);
						});
					});
					$("#book_list").css({
						"padding-top" : "50px",
						"padding-left" : "0px",
						"background":"white",
						"height":"1000px"
						});
					$("#book_list button").css({
						"border":"none",
						"background":"none"
						
					});
					$("#tab_book").css("width","100%");
					$("#tab_book").add("#tab_book tr").add("#tab_book th").add("#tab_book td").css({
						"border" : "1px solid black",
						"border-collapse" : "collapse",
						"text-align" : "center",
					});
					});
	}	
 };
 
 /* ============================================================================================== */
 
 var Bom = {
	 		popup : function(project,userid) {
	 			alert("팝업 입장");
	 			var url = "${context}/admin/Admin.do?";
	 			var name = "팝업";
	 			var style = "toolbar=no, status=no, directories=no, scrollbars=yes, location=no, resizable=no, border=0, menubar=no";
	 			var param = "page=member_profile&userid="+userid;
	 			var width = 400;
	 			var height = 500;
	 			var xpos = (screen.availWidth - width) / 2;
	 			var ypos = (screen.availHeight - height) / 2;
	 			style = style + ",top=" + ypos + ",left=" + xpos + ",width=" + width + ",height=" + height;
	 			url = url + param;
	 			window.open(url,"",style);
	 			}
	 		};

	  /*=======================================================================================================*/

var Bom2 = {
		popup : function(project,bookId) {
			var url = "${context}/admin/Admin.do?";
			var name = "팝업";
			var style = "toolbar=no, status=no, directories=no, scrollbars=yes, location=no, resizable=no, border=0, menubar=no";
			var param = "page=book_profile&bookId="+bookId;
			var width = 400;
			var height = 500;
			var xpos = (screen.availWidth - width) / 2;
			var ypos = (screen.availHeight - height) / 2;
			style = style + ",top=" + ypos + ",left=" + xpos + ",width=" + width + ",height=" + height;
			url = url + param;
			window.open(url,"",style);
			}
		};

</script>















