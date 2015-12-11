package book;

import java.io.Serializable;

public class BookVO implements Serializable{
	private static final long serialVersionUID = 1L;

	private String bookId;		//고유번호
	private String bookName;	//이름
	private String bookPrice;	//가격
	private String writer;		//지은이
	private String grade;		// 평점
	private String stockseq; 	//재고량
	private String optionBook; 	//옵션
	private String genreId; 	//장르

	
	
	public BookVO(){}
	
	
	public BookVO(String bookId, String bookName, String bookPrice, String writer,
			String grade, String optionBook, String genreId, String bookstock, String stockseq) {
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.writer = writer;
		this.grade = grade;
		this.stockseq = stockseq;
		this.optionBook = optionBook;
		this.genreId = genreId;
	}


	public String getBookId() {
		return bookId;
	}


	public String getBookName() {
		return bookName;
	}


	public String getBookPrice() {
		return bookPrice;
	}


	public String getWriter() {
		return writer;
	}


	public String getGrade() {
		return grade;
	}




	public String getStockSeq() {
		return stockseq;
	}


	public String getOptionBook() {
		return optionBook;
	}


	public String getGenreId() {
		return genreId;
	}


	public void setBookId(String bookId) {
		this.bookId = bookId;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public void setBookPrice(String bookPrice) {
		this.bookPrice = bookPrice;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}




	public void setStockSeq(String stockseq) {
		this.stockseq = stockseq;
	}


	public void setOptionBook(String optionBook) {
		this.optionBook = optionBook;
	}


	public void setGenreId(String genreId) {
		this.genreId = genreId;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "BookVO [bookId=" + bookId + ", bookName=" + bookName + ", bookPrice=" + bookPrice + ", writer=" + writer
				+ ", grade=" + grade + ", bookstock="  + ", optionBook=" + optionBook
				+ ", genreId=" + genreId + "]";
	}


	
	
	
	
	
}