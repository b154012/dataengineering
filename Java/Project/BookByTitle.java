package evydtech;

import java.util.Comparator;

public class BookByTitle implements Comparator<Book>{

	@Override
	public int compare(Book book1, Book book2) {
		// TODO Auto-generated method stub
		return book1.getTitle().compareTo(book2.getTitle());
	}

}
