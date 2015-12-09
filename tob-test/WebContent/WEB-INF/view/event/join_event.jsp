<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<div id="temp">
<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
  <TR BGCOLOR=#A0A0A0>
    <TD ALIGN=CENTER><FONT SIZE=4><B>이벤트 등록</B></FONT></TD>
  </TR>
</TABLE>

<FORM NAME="evt_join" id="evt_join" ACTION="">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER ><B>이벤트 이름</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="evtName" id="evtName" SIZE=30 MAXLENGTH=10 style="ime-mode:inactive">
		</TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER ><B>이벤트 기한</B></TD>
		<TD WIDTH=500>
			<input name="fromDt" type="text" id="fromDt" size="8" maxlength="8" title="시작일자"> ~ 
			<input name="toDt" type="text" id="toDt" size="8" maxlength="8" title="종료일자">		
		</TD>
	</TR>
	<!-- <TR>
		<TD WIDTH=120 ALIGN=CENTER ><B>이미지</B></TD>
		<TD WIDTH=500>
			<form action="">
				이미지 선택: <input type="file" name="img" multiple> 
			</form>
		</TD>
	</TR> -->
	<TR ALIGN=CENTER>
		<TD colspan="2">		
			<IMG SRC="${context}/images/btn_id_confirm.gif" STYLE=CURSOR:HAND id="join">&nbsp;&nbsp;
			<IMG SRC="${context}/images/btn_cancel.gif" STYLE=CURSOR:HAND id="cancel">
		</TD>
	</TR>
</TABLE>
</FORM>
</div>


<script type="text/javascript">
$(function() {
	$('#join').click(function() {
		Join.join();
	});
});

var Join = {
		join : function() {
			alert("이벤트 클릭함")
			$('#evt_join').submit(function(e) {
				e.preventDefault(); 
				alert("이벤트조인 서브밋 통과했음")
				
				$.ajax('${context}/event/Event.do',{
					 data :{
						evtName : $('#evtName').val(),
						fromDt : $('#fromDt').val(),
						toDt : $('#toDt').val(),
						page : 'join_event1' 
					},
					dataType : 'json',
					success : function(data) {
						alert("success 들어감")
						if (data.result == "success") {
							alert(data.evtName+"을 등록 하시겠습니까?")
							  $("<div id='make' style='height:100%; width:100%; background:white;'> </div>").appendTo($('#temp').empty());
			                  $("#make").html('<div id ="" style="padding-top : 50px; padding-left : 50px;   width: 900px;height: 100%;   margin: auto;background: rgba(232, 183, 183, 0.14);"><h1>'+data.evtName+'의 <br/> 책 등록이 완료 되었습니다</h1><br/></div>');
						}else{
							alert("실패")
						}
						
					},
					error : function(xhr,status,msg) {
						alert("상태"+status+", 내용"+msg);
					}
					
				});
						
			});
						$('#evt_join').submit();
		},
}; 
 

	$(document).ready(function() {
		var clareCalendar = {
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd', //형식(2012-03-03)
		autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
		changeMonth: true, //월변경가능
		changeYear: true, //년변경가능
		showMonthAfterYear: true, //년 뒤에 월 표시
		buttonImageOnly: true, //이미지표시
		buttonText: '달력선택', //버튼 텍스트 표시
		buttonImage: '${context}/event/event/calendar.png', //이미지주소
		showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
		yearRange: '1990:2020' //1990년부터 2020년까지
		};
		$("#fromDt").datepicker(clareCalendar);
		$("#toDt").datepicker(clareCalendar);
		$("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
		$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
		});
</script>