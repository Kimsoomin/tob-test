package book;

import java.util.List;

public class BookServiceImpl implements BookService{
private static BookService instance = new BookServiceImpl();
public static BookService getInstance(){return instance;}

BookDAO dao =BookDAOImpl.getInstance();

@Override
public int registration(BookVO o) {
	return dao.registration(o);
}




@Override
public int amountBook(String book) {
	return dao.amountBook();
}


@Override
public int delete(String book) {
	return dao.delete(book);
}



@Override
public BookVO serachByBook(String book) {
	return dao.searchByBook(book);
}



@Override
public List<BookVO> getList() {

	return dao.selectAll();
}





@Override
public int change(BookVO book) {
	return dao.update(book);
}





}
