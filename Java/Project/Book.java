package evydtech;

import java.util.Objects;

@SuppressWarnings("serial")
public class Book implements java.io.Serializable, Comparable<Book> {
	Book[] book;
	private int bookNumber;
	private String author;
	private String title;
	private int year;
	private double price;
	
	public Book() {
		this.bookNumber = 0;
		this.author = "";
		this.title = "";
		this.year = 0;
		this.price = 0.0;
	}
	
	public Book(int booknumber, String author, String title, int year, double price) {
		this.bookNumber = booknumber;
		this.author = author;
		this.title = title;
		this.year = year;
		this.price = price;
	}
	
	public Book[] getBook() {
		return book;
	}

	public void setBook(Book[] book) {
		this.book = book;
	}

	public int getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	// two objects' book numbers are different, so override equals() and hashCode()
	@Override
	public boolean equals(Object book) {
		if(book == this) {
			return true;
		}
		
		if (book == null || getClass() != book.getClass()) {
			return false;
		}
		
		Book thebook = (Book) book;
		return this.bookNumber == thebook.bookNumber;
	}
	
	//@return an integer representation of the object memory address and it is unique.
	@Override
	public int hashCode() {
		return Objects.hash(this.bookNumber);
	}

	@Override
	public int compareTo(Book book) {

		return this.author.compareTo(book.author);
	}
	
	public String toString() {
		return "[Book Number: " + this.bookNumber + ", Author: " + this.author + ", Title: " + this.title + ", Year: " + this.year 
				+ ", Price: $" + this.price + "]\n";
	}
	
}
