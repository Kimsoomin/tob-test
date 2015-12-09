package book;

import java.util.List;


public interface BookDAO {

	public int registration(BookVO o); //책 등록
	public int amountBook();  // 책 수량 <count>
	public int delete(String bookid); //등록된 책 삭제 책 번호로
	
	public BookVO searchByBook(String userid);
	
	public List<BookVO> selectAll();
	
	public int update(BookVO book);//책 수정
	
}
