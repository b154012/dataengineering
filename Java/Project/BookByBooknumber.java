package evydtech;

import java.util.Comparator;

public class BookByBooknumber implements Comparator<Book> {

	@Override
	/*public int compare(Book book1, Book book2) {
		// TODO Auto-generated method stub
		/*
		if(book1.getBookNumber() == book2.getBookNumber()) {
			return 0;
		} else if (book1.getBookNumber() > book2.getBookNumber()) {
			return 1;
		} else {
			return -1;
		}*/
		
	public int compare(Book book1, Book book2) {
		return book1.getBookNumber() - book2.getBookNumber();
	}
	
}
