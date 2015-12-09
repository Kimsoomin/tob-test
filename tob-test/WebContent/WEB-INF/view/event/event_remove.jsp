<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src= "${context}/js/global.js"></script>
<script type="text/javascript">
      $(function() {
            Global.init();
            $( '#header').load( '${context}/main.do?page=header');
            $( '#footer').load( '${context}/main.do?page=footer');
            Event.detail();
            });
            
             var Event = {
             detail : function() {
                  $.getJSON('${context}/event,do?page=detail&evtName=${event.evtName}' ,
                               function(data) {
                                     var table = '<table><tr><td rowspan="7" id="td_profile"><img id="progile" src="${context}/images/${event.img}" width="70%" height="80%" /></td>'
                                                      + '<th id="item">항목</th><th>빈 칸</th></tr>'
                                                      + '<tr><td>이벤트이름</td><td>${event.evtName}</td></tr>'
                                                      + '<tr><td>이벤트기간</td><td>${event.term}</td></tr>'
                                                      + '<tr><td><button id="changeImage">사진변경</button></td>'
                                                      + '<td><button id="changeInfo">정보수정</button><button id="remove">이벤트취소</button></td>'
                                                      + '<td><button id="confirm">확인</button></td></tr></table>'
                                                      $( '#box').html(table);
                                                            Event.style();
                                                      $( '#changeInfo').click( function() {
                                                            Event.updateForm();
                                                      });
                                                      $( '#remove').click( function() {
                                                            Event.remove( '${event.evtName}');
                                                      });
                  									});               
          									  },
           eventForm : function() {
                  $.getJSON( '${context}/event.do?page=detail&evtName=${event.evtName}' ,function(data){
                        $( '<form action ="${context}/event/update" id="evt">').appendTo($('#box').empty());
                         var table = '<table><tr><td rowspan="7" id="td_profile"><img id="progile" src="${context}/images/${event.img}" width="70%" height="80%" /></td>'
                              + '<th id="item">항목</th><th>빈 칸</th></tr>'
                              + '<tr><td>이벤트이름</td><td>${event.evtName}</td></tr>'
                              + '<tr><td>이벤트기간</td><td>${event.term}</td></tr>'
                              + '<tr><td><button id="changeImage">사진변경</button></td>'
                              + '<td><button id="changeInfo">정보수정</button><button id="remove">이벤트취소</button></td>'
                              + '<td><button id="confirm">확인</button></td></tr></table>'
                              $( 'evt').html(table);
                              Event.style();
                                    $( '#confirm').click( function() {
                                          $( '#evt').submit( function(e) {
                                                e.preventDefault(); /* 기본 폼태그의 서브밋을 막아라 자스의 서브밋을 실행해라 */ //데이터를 던져야 해서 ajax
                                                $.ajax( '${context}/event.do',{
                                                      type : 'get',
                                                      data : {
                                                            evtName : $('#evtName').val(),
                                                            term : $('term').val,
                                                            page : 'update'
                                                      },
                                                      async : true, // 비동기로 할 지 여부, 기본값 true, 생략가능
                                                      dataType : 'json',
                                                      success : function(data) {
                                                            location.href= "${context}/event.do?page=event_remove&userid=" +data.userid;
                                                      },    
                                                      error : function(xhr,status,msg) {
                                                      alert( '에러발생상태' +status+'내용:' +msg);
                                                }
                                          });
                                    });
                              });
                      });                             
                  },
                  update : function() {
                              $.ajax( '',{
                                    data:{},
                                    dataType : 'json',
                                    success : function(data) {
                                          Event.detail();
                                    },
                                    error : function(e) {
                                          
                                    }
                              });
                        },
                        style : function() {
                              $( 'td').css( 'text-align', 'center');
                              $( 'tr').add( 'th').add( 'td').css( 'float', 'center');
                              $( '#box').css( 'clear', 'both').css( 'margin', '20px');
                              $( '#item').css( 'width', '400px');
                              $( '#profile').css( 'width', '300px');
                              $( '#td_profile').css( 'width', '400px');
                        },
                        remove : function(userid) {
                              $.ajax( '${context}/event.do',{
                                    data : {
                                          evtName :evtName,
                                          page : 'remove'
                                    },
                                    dataType : 'json',
                                    success : function(data) {
                                          alert( '삭제되었습니다.' );
                                          location.href= "${context}/event.do?page=event_remove" ;
                                    },
                                    error : function(xhr,status,msg) {
                                          alert( '에러발생상태' +status+'내용:' +msg);
                                    }
                              });
                        }
            };
</script>
