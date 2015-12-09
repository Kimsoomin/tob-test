<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${context}/css/common.css" /> 





<script src="${context}/js/global.js"></script>
<script type="text/javascript">


$(function() {
	Global.init();
	$('#header').load('${context}/main/Home.do?page=header');
	$('#footer').load('${context}/main/Home.do?page=footer');
	
	
	$('#box').html('<input type="button" value="등록페이지" id="join"/><br /><br />'
			+'<input type="button" value="전체목록 페이지" id="all"/><br /><br /><input type="button" value="수정 페이지"id="equip"/><br /><br />'
			+'<input type="button" value="삭제 페이지" id="remove"/><br /><br />');
			
			$('#join').click(function() { /*등록페이지*/
				bookCate.boxEmpty();  
				bookCate.joinform();
			});
			$('#all').click(function() { /*전체 페이지*/
				bookCate.boxEmpty();
				bookCate.all();
			});
			$('#equip').click(function() { /*수정 페이지*/
				bookCate.boxEmpty();
				bookCate.equip();
			});
			$('').click(function() { /*삭제 페이지*/
				bookCate.boxEmpty();
			});
			$('').click(function() { /*조회 페이지*/
				bookCate.boxEmpty();
			});
});



var bookCate = { 
		all : function() {/*책 전체목록*/
			$('#box').html('<div class="wrap auto"><div class="header"></div><div class="alpha"><font color="red"><strong>국내도서</strong></font><br /><p><p>'
					+'<a href="#" id="social"><font>소설</font></a><br /><p><a href=""><font>자기계발</font></a><br /><p><a href=""><font>컴퓨터</font></a><br /><p>'
					+'<font>베스트셀러</font><br /><p><font>이달의 책</font><br /><p><font>키위밍</font><br /><p><font>월페이퍼</font><br /><p><font>이벤트</font><br />'
					+'<p><font>예약판매</font><br /><p></div>'
					+'<div class="alpha"><font color="red"><strong>외국도서</strong></font><br /><p><p><a href=""><font>인문</font></a><br /><p><a href=""><font>과학</font></a><br />'
					+'<p><a href=""><font>생활</font></a><br /><p><font>베스트셀러</font><br /><p><font>이달의 책</font><br /><p><font>월페이퍼</font><br /><p><font>일본신간잡지'
					+'</font>'
					+'<br /><p><font>일본정지구독잡지</font><br /><p></div><div class="alpha"><font color="red"><strong>eBook</strong></font><br /><p><p><a href=""><font>베스트'
					+'</font></a><br /><p><a href=""><font>신간</font></a><br /><p><a href=""><font>추천</font></a><br /><p><font>무료</font><br /><p><font>이벤트</font><br /><p>'
					+'<font>연재</font><br /><p><font>논문</font><br /><p></div><div class="alpha"><font color="red"><strong>sam</strong></font><br /><p><p><a href=""><font>오늘의'
					+'sam</font></a><br /><p><a href=""><font>신간</font></a><br /><p><a href=""><font>추천</font></a><br /><p><font>베스트셀러</font><br /><p><font>이달의 책</font>'
					+'<br /><p><font>월페이퍼</font><br /><p></div><div class="alpha"><font color="red"><strong>북모닝CEO</strong></font><br /><p><p><font>회원가입안내</font><br />'
					+'<p><font>과학</font><br /><p><font>생활</font><br /><p><font>베스트셀러</font><br /><p><font>이달의 책</font><br /><p><font>월페이퍼</font><br /><p><font>경영학'
					+'원</font><br /><p><font>무료zone</font><br /><p></div><div class="alpha"><font color="red"><strong>음반</strong></font><br /><p><p><a href=""><font>베스트음반'
					+'</font></a><br /><p><a href=""><font>새로나온 음반</font></a><br /><p><a href=""><font>예약음반</font></a><br /><p></div><div class="alpha"><font color="red">'
					+'<strong>문화서비스</strong></font><br /><p><p><font>교보인문학석간</font><br /><p><font>낭독공감</font><br /><p><font>북모닝ceo특강</font><br /><p><font>길 위의 '
					+'인문학</font><br /><p><font>공모전</font><br /><p><font>공지사항</font><br /><p></div><div class="alpha"><font color="red"><strong>북뉴스</strong></font><br />'
					+'<p><p><font>오늘뉴스</font><br /><p><font>스페셜+</font><br /><p><font>인터뷰</font><br /><p><font>연재</font><br /><p><font>북tv</font><br /><p></div><div '
					+'class="alpha"><font color="red"><strong>북로그</strong></font><br /><p><p><font>리뷰</font><br /><p><font>연재</font><br /><p><font>리뷰릴레이</font><br /><p>'
					+'</div><div class="alpha"><font color="red"><strong>마이룸</strong></font><br /><p><p><font>마이리뷰</font><br /><p><font>마이리스트</font><br /><p><font>나의 보'
					+'관함</font><br /><p><font>스토리</font><br /><p></div><div class="alpha"><font color="red"><strong>기프트</strong></font><br /><p><p><font>오늘의 핫 딜</font>'
					+'<br /><p><font>베스트</font><br /><p><font>이벤트</font><br /><p></div><div class="alpha"><font color="red"><strong>주문&배송관리</strong></font><br /><p><p>'
					+'<font>주문/배송내역</font><br /><p><font>나의 문의내역</font><br /><p><font>이벤트 응모내역</font><br /><p><font>회원정보관리</font><br /><p></div><div '
					+'class="alpha"><font color="red"><strong>BLU-RAY/DVD</strong></font><br /><p><p><font>베스트 블루레이</font><br /><p><font>새로나온 블루레이</font><br /><p>'
					+'<font>공지사항</font><br /><p></div></div>'
					);
			$('#social').click(function() {
				bookCate.bookEmpty();
				bookCate.bookSampleAlert();
			})
		},
		
		
		/*책 등록하기*/
		joinform : function() {
			
			$('#box').html('<TABLE WIDTH=500 HEIGHT=90 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER><TR style="color: highlight;"><TD ALIGN=CENTER><FONT SIZE=4><B>책 등록</B></FONT>'
					+'</TD></TR></TABLE><FORM NAME="frm_join" id="frm_join" METHOD=get ACTION="${context}/book.do?page=book_join"><TABLE WIDTH=500 BORDER=1 CELLSPACING=0 '
					+'CELLPADDING=2 ALIGN=CENTER><TR><TD WIDTH=120 ALIGN=CENTER><B>책 고유번호</B></TD><TD WIDTH=500><INPUT TYPE=TEXT NAME="bookseq" id="bookseq" placeholder="책 번'
					+'호" SIZE=15 MAXLENGTH=7 style="color: red;"></TD></TR><TR><TD WIDTH=120 ALIGN=CENTER><B>책 이름</B></TD><TD WIDTH=500><INPUT TYPE=TEXT NAME="bookname" '
					+'id="bookname" placeholder="책 번호" SIZE=15 MAXLENGTH=7 style="border-color: green;"></TD></TR><TR><TD WIDTH=120 ALIGN=CENTER><B>책 가격</B></TD><TD WIDTH=500>'
					+'<INPUT TYPE=TEXT NAME="bookprice" id="bookprice" placeholder="가격" SIZE=15 MAXLENGTH=7 style="background: black; color: white;"></TD></TR><TR><TD WIDTH=120 '
					+'ALIGN=CENTER><B>저자</B></TD><TD WIDTH=500><input type="text" name="writer" placeholder="지은이" id="writer" size="15" maxlength="7" /></TR><TR><TD WIDTH=120 '
					+'ALIGN=CENTER><B>평점</B></TD><TD WIDTH=500><input type="text" placeholder="★" id="grade"/></TR><TR><TD WIDTH=120 ALIGN=CENTER><B>책 재고</B></TD><TD WIDTH=500>'
					+'<INPUT TYPE=TEXT NAME="bookstock" id="bookstock" placeholder="재고수량" SIZE=15 MAXLENGTH=7></TD></TR><TR><TD WIDTH=120 ALIGN=CENTER><B>옵션</B></TD><TD '
					+'WIDTH=500><input type="checkbox" name="option" value="md" />md <input type="checkbox" name="option" value="free" />free </TD></TR><TR><TD WIDTH=120 '
					+'ALIGN=CENTER><B>장르</B></TD><TD WIDTH=500><input type="radio" name="genre" value="fiction" />fiction <input type="radio" name="genre" value="essay" />essay '
					+'<input type="radio" name="genre" value="it" />it </TR><TR ALIGN=CENTER><TD colspan="2"><input type="button" value="등록" id="commit" style="border-bottom-color: '
					+'aqua;"/><input type="button" value="취소" id="cancel" style="border-color: green;"/></TD></TR></TABLE></FORM>'
					);
					$('#commit').click(function() {
						bookCate.join();	
						alert('책 등록 페이지로 이동합니다.');
					});
		
		},
		
		join : function() { 
			$('#frm_join').submit(function(e) {
				e.preventDefault();  //이거뭐임
				alert('조인 서브밋 다음으로');
				$.ajax('${context}/book/Book.do',{
				data : {
					bookid :$('#bookseq').val(),
					bookname : $('#bookname').val(),
					bookprice : $('#bookprice').val(),
					writer : $('#writer').val(),
					grade : $('#grade').val(),
					bookstock : $('#bookstock').val(),
					option :  function() {
						var arr = [];
						$('input:checkbox[name=option]:checked').each(function() {
							arr.push($(this).val());
						});
						return arr;
			},
					genre : $("input:radio[name=genre]:checked").val(),
					page : 'book_info'
				},
				dataType :'json',
				success : function(data) {
					alert('성공했을때 떠야하는 메시지');
					if (data.result === "success") {
						alert(data.bookname+'책등록을 하시겠습니까?');
						$("<div id='make' style='height:100%; width:100%; background:white;'> </div>").appendTo($('#temp').empty());
						$("#make").html('<div id ="join_Suc" style="padding-top : 50px; padding-left : 50px;	width: 900px;height: 100%;	margin: auto;background: rgba(232, 183, 183, 0.14);"><h1>'+data.bookname+'의 <br/> 책 등록이 완료 되었습니다</h1><br/></div>');
					} else {
						alert(data.result+'되었습니다.');
					}
					},
				error : function(xhr,status,msg) {
					alert("상태 : "+status+", 내용 :"+msg);
				}
				});
			});
			$('#frm_join').submit();
		}, 
		checkbox : function(addr) {
			   var arr = [];
	addr.each(function() {
		arr.push($(this).val());
	});
			   return arr;
},


	/*책 수정*/
	equip : function() { /*getJSON 경로 잡는법.*/
		$.getJSON('${context}/book/Book.do?page=detail&bookid=${book.bookid}',function(data){
		$('#box').html('<table><tr><td rowspan="9" id="td_profile"><img id="profile" src="${context}/images/${member.profile}" /></td>'
				+'<th id="item">항목</th><th id="item">빈 칸</th></tr><tr><td>책 번호</td><td>${book.bookid}</td></tr><tr><td>책 이름</td><td>${book.bookname}</td></tr>'
				+'<tr><td>가격</td><td>${book.bookprice}</td></tr><tr><td>지은이</td><td>${book.writer}</td></tr>'
				+'<tr><td>평점</td><td>${book.grade}</td></tr>'
				+'<tr><td>재고량</td><td>${book.bookstock}</td></tr>'
				+'<tr><td>옵션</td><td>${book.option}</td></tr>'
				+'<tr><td>장르</td><td>${book.genre}</td></tr><tr><td><button type="button" id="changeImg">사진변경</button></td>'
				+'<td><button type="button" id="changeInfo">정보수정</button></td><td><button type="button" id="congirm">확인</button></td></tr></table>'
			
		);
		$('#changeInfo').click(function() {
			alert('책 정보를 수정합니다');
			book.updateForm();
		});
		
		});
	},
	
	updateForm : function() { /*가격과 재고량만 변경하도록*/
		$.getJSON('${context}/book/Book.do?page=detail&bookid=${book.bookid}',function(data){
			$('#box').html('<table><tr><td rowspan="9" id="td_profile"><img id="profile" src="${context}/images/${member.profile}" /></td>'
					+'<th id="item">항목</th><th id="item">빈 칸</th></tr><tr><td>책 번호</td><td>${book.bookid}</td></tr><tr><td>책 이름</td><td>${book.bookname}</td></tr>'
					+'<tr><td>가격</td><td><input type ="text" id="price" value="${book.price}"></td></tr><tr><td>지은이</td><td>${book.writer}</td></tr>'
					+'<tr><td>평점</td><td>${book.grade}</td></tr>'
					+'<tr><td>재고량</td><td><input type ="text" id="bookstock" value="${book.bookstock}"></td></tr>'
					+'<tr><td>옵션</td><td>${book.option}</td></tr>'
					+'<tr><td>장르</td><td>${book.genre}</td></tr><tr><td><button type="button" id="changeImg">사진변경</button></td>'
					+'<td><button type="button" id="changeInfo">정보수정</button></td><td><button type="button" id="congirm">확인</button></td></tr></table>'
					+'<td><button id="remove">책 삭제</button></td>'
			);
			$('#congirm').click(function() {
				$('#box').submit(function(e) {
					e.preventDefault(); 
					$.ajax('${context}/book/Book.do',{
						
						type :'get',
						data : {
							price: $('#price').val(),
							bookstock: $('#bookstock').val(),
							page : 'update'
							},
						async :true, 
						dataType : 'json',
						success : function(data) {
							location.href="${context}/book/Book.do?page=mypage&bookid="+data.bookid;
						},
						error : function(xhr, status, msg) {
							alert('에러떴음.->'+status+', 내용 ->'+msg);
							//에러는 파라미터 갯수와 위치로 그역할을 결정하기 때문에              xhr  status  msg는 정해진값. 인자는 맘대로 바꿔도 됨 a,b,c 
							//xhr은 자리를 지키고 있어야, status 와 msg 가 작동한다.
						}
						
					});
				});
			});
			$('#remove').click(function() {
				alert('책 정보를 삭제합니다.');
				book.remove();
				
			});
			
		});
		
	},
	
	/*책 삭제*/
	remove : function(bookid) {
		$.ajax('${context}/book/Book.do',{
			data : {
				bookid : bookid,
				page : 'remove'
			},
			dataType : 'json',
			success : function() {
				alert('책정보 삭제완료');
				location.href = "";
			},
			error : function(xhr, status, msg) {
				alert('remove 에러떴음.'+status+', 내용 ->'+msg);
			}
		});
	},
	
	
	
	
	
	
	


		
		/*비우기*/
		boxEmpty : function() {
			$('').appendTo($('#box').empty());
		},
		
		
		/*실험용 알러트*/
		bookSampleAlert : function() {
			alert('넘어갔음')
		}
		
};







$(function() {
	$('#cancel').click(function() {
		alert('취소되었습니다.');
		location.href = "${context}/main.do";
	});
});
		
		
		
			
			
			
			
			
			

</script>



