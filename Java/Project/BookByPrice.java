package evydtech;

import java.util.Comparator;

public class BookByPrice implements Comparator<Book> {

	@Override
	public int compare(Book book1, Book book2) {
		// TODO Auto-generated method stub
		if (book2.getPrice() == book1.getPrice()) {
			return 0;
		} else if (book1.getPrice() > book2.getPrice()) {
			return 1;
		} else {
			return -1;
		}
	} 

}
