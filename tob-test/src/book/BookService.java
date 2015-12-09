package book;

import java.util.List;

public interface BookService {
	
	//책등록
	public int registration(BookVO o);
	
	//삭제
	public int delete(String book);
	
	
	
	//책 검색 (책이름으로)
	public BookVO serachByBook(String book);
	
	
	//총 재고량.
	public int amountBook(String book);

	
	//옵션 ( 책에 관한, ex> md의 선택 , 무료배송 등등

	
	
	
	
	//카테고리
	
	
	// 전체 책 목록
	public List<BookVO> getList();

	//정보 수정
	public int change(BookVO book);
}
