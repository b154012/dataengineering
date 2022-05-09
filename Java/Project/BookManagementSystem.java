/*
 * /*
 * Copyright (c) 2021. Abd Zulmi bin Yahya
 * 
 * */

package evydtech;

import java.io.*;
import java.util.*;

/*
 * Programming to achieve a book management system. 
 * The system has a welcome interface and functions to add books, 
 * view book list, delete books, modify book information, 
 * save book information as a file and other functions.
 * 
 * @author Zulmi Yahya
 * @EVYD Data Engineering Trainee
 * */

public class BookManagementSystem {
	
	/**
	 * The Book Management system is executed in the main function.
	 * 
	 * @throws InputMismatchException if the input does not match with the expected type.
	 * @throws Exception if other operations that the system might want to catch errors.
	 */
	public static void main(String[] args) {
		
		//Creates a Book object
		Book book = new Book();
		
		// Contructs an LinkedHashSet class, extends hashset, uses Set interface 
		// purpose is to avoid duplicate elements
		// maintains insertion order
		Set<Book> bookList = new LinkedHashSet<Book>();
		
		Scanner input = new Scanner(System.in);
		
		try {
			menu(bookList, book, input);
		} catch (InputMismatchException e) {
			//resets data
			System.out.println("Please try again. Enter a number between 1 and 8.\nError is " + e.toString() + ".");
			if(bookList.isEmpty()) {
				System.out.println("Booklist is empty.");
			}
			//call main to display a new menu
			main(args);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//close after exiting the system
				if (input != null) {
					input.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * menu provides a User Interface to perform book management system. 
	 * It will be executed until a user enters a zero or inputs chracters.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements 
	 *                 the booklist of type Book
	 * @param book the Book object
	 * @param input scan and parse input
	 * @throws IOException occurs if failed or interrupted I/O operations haved occured
	 */
	public static void menu(Set<Book> bookList, Book book, Scanner input) throws IOException {
		int num = -1;
		
		while(num != 0) {
			
			System.out.println("\n--------------------WELCOME TO THE BOOK INTERFACE---------------\n");
			System.out.println("                      Book Management System                    ");
			System.out.println("|==============================================================|");
			System.out.println("|                                                              |");
			System.out.println("|                   1) Adding Book                             |");
			System.out.println("|                   2) Deleting Book                           |");
			System.out.println("|                   3) Viewing Book List                       |");
			System.out.println("|                   4) Modifying Book Information              |");
			System.out.println("|                   5) Searching Book                          |");
			System.out.println("|                   6) Sorting Book Information                |");
			System.out.println("|                   7) Reading Book File                       |");
			System.out.println("|                   8) Help                                    |");
			System.out.println("|                   0) Exit                                    |");
			System.out.println("|                                                              |");
			System.out.println("|==============================================================|\n");
			
			System.out.print("\nPlease select your choice: ");
			
			if(input.hasNextInt()) {
				num = input.nextInt();
			} else {
				throw new InputMismatchException();
			}
			
			switch(num) {
				case 0:
					System.out.println("Exiting Book Interface...");
					System.exit(0);
				case 1:
					addBook(bookList, book);
					saveBook(bookList, book);
					break;
				case 2:
					deleteBook(bookList);
					break;
				case 3:
					viewBook(bookList);
					break;
				case 4:
					if (bookList.isEmpty()) {
						System.out.println("No book has been added, thus unable to modify.");
					} else {
						modifyBook(bookList, book);
						saveBook(bookList, book);
					}
					break;
				case 5:
					searchBook(bookList);
					break;
				case 6:
					sortMenu(bookList, book, input);
					break;
				case 7:
					readSavedBook();
					break;
				case 8:
					System.out.println("\nA brief description of each choice: \n" 
							+ "\nEnter 1 will add a book. Enter info about book number, author, price, etc."
							+ "\nEnter 2 will remove a book. Enter the book number to remove it."
							+ "\nEnter 3 will view the book list."
							+ "\nEnter 4 will modify the book information. Book list must be not empty."
							+ "\nEnter 5 will search a particular book. Enter the book number to search it."
							+ "\nEnter 6 will sort the book information. It will prompt another menu."
							+ "\nEnter 7 will read the saved booklist in .ser format. Enter the saved filename."
							+ "\nEnter 8 will provide a brief description of the function of each choice."
							+ "\nEnter 0 will exit the book interface at once.\n"
							+ "\nAdditional functions are shown in the following:\n"
							+ "\nEnter 9 will display the newly added book list."
							+ "\nEnter 10 will display the very first added book list.\n"
							+ "\nOther functions in another menu, sortMenu():\n"
							+ "\nEnter 1 will show a list of the sorted book by book number."
							+ "\nEnter 2 will show a list of the sorted book by price."
							+ "\nEnter 3 will show a list of the sorted book by author."
							+ "\nEnter 4 will show a list of the sorted book by title."
							+ "\nEnter 5 will show a list of the sorted book by year."
							+ "\n\n*Data will reset if a user enters a character or integers not between 0 and 8.");
					break;
				case 9:
					firstAddedBooklist(bookList);
					break;
				case 10:
					newlyAddedBooklist(bookList);
					break;
				default:
					System.out.println("Enter a different number between 0  and 8.");
					continue;
			}
		}
	}

	/**
	 * sort menu provides a User Interface to sort book information such as number, price,
	 * author, title, year, etc. Also, it includes exit and menu.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * @param book the Book object
	 * @param input scan and parse input
	 * 
	 * @throws IOException occurs if failed or interrupted I/O operations haved occured
	 */
	public static void sortMenu(Set<Book> booklist, Book book, Scanner input) throws IOException {
		int num = -1;
		
		while(num != 0) {
			
			System.out.println("\n                    Sorting Book Information                 ");
			System.out.println("|=============================================================|");
			System.out.println("|                                                             |");
			System.out.println("|                     1) By Book Number                       |");
			System.out.println("|                     2) By Price                             |");
			System.out.println("|                     3) By Author                            |");
			System.out.println("|                     4) By Title                             |");
			System.out.println("|                     5) By Year                              |");
			System.out.println("|                     6) Menu                                 |");
			System.out.println("|                     0) Exit                                 |");
			System.out.println("|                                                             |");
			System.out.println("|=============================================================|\n");
			
			System.out.print("\nPlease select your choice: ");
			
			if(input.hasNextInt()) {
				num = input.nextInt();
			} else {
				throw new InputMismatchException();
			}
			
			switch(num) {
				case 0:
					System.out.println("Exiting Book Interface...");
					System.exit(0);
				case 1:
					List<Book> booklist1 = convertSetToList(booklist);
					Collections.sort(booklist1, new BookByBooknumber());
					System.out.println("Sort By Book Number:\n" + booklist1);
					break;
				case 2:
					List<Book> booklist2 = convertSetToList(booklist);
					Collections.sort(booklist2, new BookByPrice());
					System.out.println("Sort By Book Price:\n" + booklist2);
					break;
				case 3:
					List<Book> booklist3 = convertSetToList(booklist);
					Collections.sort(booklist3);
					System.out.println("Sort By Book Author:\n" + booklist3 + "\n");
					break;
				case 4:
					List<Book> booklist4 = convertSetToList(booklist);
					Collections.sort(booklist4, new BookByTitle());
					System.out.println("Sort by Book Title:\n" + booklist4);
					break;
				case 5:
					List<Book> booklist5 = convertSetToList(booklist);
					Collections.sort(booklist5, new BookByYear());
					System.out.println("Sort by Book Year:\n" + booklist5);
					break;
				case 6:
					menu(booklist, book, input);
				default:
					System.out.println("Enter a different number between 0  and 8.\n");
					continue;
			}
		}
	}
	
	/** 
	 * Adds a book set with the unspecified initial capacity. Adding book requires no duplicate
	 * book number. Create an instance of Book to update the new book that will be added.
	 * Checks if number is not duplicated, then adds in the set.
	 * Calls itself if user entered characters instead of an integer value.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * @param book the book object
	 * 
	 * @throws InputMismatchException if the input does not match with the expected type.
	 * @throws Exception if other conditions that the system might want to catch. 
	 */
	public static void addBook(Set<Book> booklist, Book book) {
		
		boolean flag = false;
		//update new book object
		Book b1 = new Book();
		
		try {
			@SuppressWarnings("resource")
			Scanner input = new Scanner(System.in);	
			int booknumber, year;
			String author, title;
			double price;
				
			System.out.print("\nEnter the book number: ");
			booknumber = input.nextInt();
			b1.setBookNumber(booknumber);
			
			input.nextLine();
			System.out.print("Enter the author name: ");
			author = input.nextLine();
			b1.setAuthor(author);
						
			System.out.print("Enter the title of the book: ");
			title = input.nextLine();
			b1.setTitle(title);
						
			System.out.print("Enter the year of the published book: ");
			year = input.nextInt();
			b1.setYear(year);
						
			System.out.print("Enter the price of the book: ");
			price = input.nextDouble();
			b1.setPrice(price);
			
			// check if book number should be unique
			while(!flag) {
				if(flag == !checkNotDuplicate(booklist, b1)) {
					break;
				} else {
					//if unique, add the book 
					addBook(booklist, book);
					break;
				}
			}
			
		} catch (InputMismatchException e) {
			System.out.println(e.fillInStackTrace() + "\nPlease input integer values for number, year and price\n");
			addBook(booklist, book);
		} catch (Exception e) {
			e.printStackTrace();
		}
					
	}
	
	/**
	 * Checks if the booklist is not empty, then
	 * Displays the first added book list in the set using an iterator. 
	 * 
	 *@param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 */
	public static void firstAddedBooklist(Set<Book> booklist) {
		
		if(booklist.isEmpty()) {
			System.out.println("No book has been added yet. Enter 1 to add book.");
		} else {
			Iterator<Book> bitr = booklist.iterator();
			
			while(bitr.hasNext()) {
					System.out.println("First Added Booklist: " + bitr.next());
					break;
			}
		}
	}
	
	/**
	 * Checks if the booklist is not empty, then
	 * Displays the latest added book in the set using the ListIterator.
	 * Converts Set to List and uses the hasPrevious() to start01 from the last element.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 */
	public static void newlyAddedBooklist(Set<Book> booklist) {
		
		//convert to list
		List<Book> booklist1 = new ArrayList<Book>(booklist);

		if(booklist.isEmpty()) {
			System.out.println("No book has been added yet. Enter 1 to add book.");
		} else {
			ListIterator<Book> bitr = booklist1.listIterator(booklist.size());
			
			while(bitr.hasPrevious()) {
				if(bitr.previousIndex() == booklist.size()-1) {
					System.out.println("Newly Added Booklist: " + bitr.previous());
					break;
				}
			}
		}
	}
	
	/**
	 * Checks if the booklist is not empty, then
	 * Iterates over the elements to look for a specified book number. If found, it will be removed.
	 * Calls itself if user entered characters instead of an integer value.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * 
	 * @throws InputMismatchException if the input does not match with the expected type.
	 * @throws Exception if other conditions that the system might want to catch.
	 */
	public static void deleteBook(Set<Book> booklist) {
		
		@SuppressWarnings("resource")
		Scanner input = new Scanner(System.in);
		
		try {
			if(booklist.isEmpty()) {
				System.out.println("There is no book to be deleted");
			} else {
				Iterator<Book> bookItr = booklist.iterator();
				boolean found = false;
				
				System.out.print("Enter the book number to remove: ");
				int no = input.nextInt();
				
				while(!found && bookItr.hasNext()) {
					if(bookItr.next().getBookNumber() == no) {
						found = true;
					}
				}
				
				if(found) {
					bookItr.remove();
					System.out.println("Found and successfully removed the book number [" + no + "].");
				} else {
					System.out.println("The book number [" + no + "] is not found.");
				}
			}
		} catch (InputMismatchException e) {
			System.out.println(e.fillInStackTrace() + "\nPlease input an integer value only.\n");
			deleteBook(booklist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * Displays a list of book in the LinkedHashSet using for-each loop. 
	 * Iterates over the elements in the set and uses @toString() to display;
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * 
	 * @return false if the set is empty, otherwise true will display.
	 */
	public static boolean viewBook(Set<Book> booklist) {
		
		if(booklist.isEmpty()) {
			System.out.println("No book has been added.");
			return false;
		} else {
			for (Book b : booklist) {
				System.out.println(b.toString() + " ");
			}
			return true;
		}
	}
	
	/**
	 * Iterates over the elements to compare with the modified book number.
	 * Updates all info, but book number. It remains unique and unchanged.
	 * Replaces the new book into the set. 
	 * 
	 * Calls itself if user entred characters instead of an integer value.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * @param the Book object
	 * 
	 * @throws InputMismatchException if the input does not match with the expected type.
	 * @throws Exception if other conditions that the system might want to catch.
	 */
	public static void modifyBook(Set<Book> booklist, Book book) {
		
		@SuppressWarnings("resource")
		Scanner input = new Scanner(System.in);
		try {
			System.out.print("Enter the book number to modify: ");
			int no = input.nextInt();
			boolean flag = false;
				
			for (Book bx : booklist) {
					
				if(bx.getBookNumber() == no) {
					int year;
					String author, title;
					double price;
						
					bx.setBookNumber(no);
						
					input.nextLine();
					System.out.print("Enter the author name: ");
					author = input.nextLine();
					bx.setAuthor(author);
									
					System.out.print("Enter the title of the book: ");
					title = input.nextLine();
					bx.setTitle(title);
									
					System.out.print("Enter the year of the published book: ");
					year = input.nextInt();
					bx.setYear(year);
									
					System.out.print("Enter the price of the book: ");
					price = input.nextDouble();
					bx.setPrice(price);
						
					//replace it with new Book info
					booklist.add(bx);
					System.out.println("New Book has successfully been modified.");
						
					flag = true;
						
					break;
				}			
			}
				
			if(flag != true) {
				System.out.println("Not found");
			}
									
		} catch (InputMismatchException e) {
			System.out.println(e.fillInStackTrace() + "\nPlease input integer values for number, year and price.\n");
			modifyBook(booklist, book);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 *Checks if the set is not empty, then iterates over the elements in the set to compare with the specified book number.
	 *If found, displays using toString(). Calls itself if user entered characters instead of an integer value.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * @param booklist the Book object
	 * 
	 * @throws InputMismatchException if the input does not match with the expected type.
	 * @throws Exception if other conditions that the system might want to catch.
	 */
	public static void searchBook(Set<Book> booklist) {
		@SuppressWarnings("resource")
		Scanner input = new Scanner(System.in);
		List<Book> booklist1 = new ArrayList<Book>(booklist);
		
		try {
			if (booklist.isEmpty()) {
				System.out.println("There is no book to be found.");
			} else {
				//ListIterator<Book> bitr = booklist1.listIterator();
				boolean found = false;
				
				System.out.print("Enter your book number: ");
				int no = input.nextInt();
				
				for(Book bk : booklist1) {
					if (bk.getBookNumber() == no) {
						System.out.println(bk.toString());
						found = true;
						break;
					}
				}
				
				if(!found) {
					System.out.println("Book with an ID " + no + " is not found.");
				}
			}
		} catch (InputMismatchException e) {
			System.out.println(e.fillInStackTrace() + "\nPlease enter an integer value again\n");
			searchBook(booklist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * Saves a book set in a file. Uses FileOutStream to write the book set in the byte stream.
	 * Implements Serializable in the Book class to allow writing the Book object.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * @booklist book the Book object
	 * 
	 * @throws InputMismatchException if the input does not match with the expected type.
	 * @throws Exception if other conditions that the system might want to catch.
	 */
	public static void saveBook(Set<Book> booklist, Book book) {
		
		@SuppressWarnings("resource")
		Scanner input = new Scanner(System.in);
		
		try {

			System.out.print("\nWould you like you to save your data in a file? [y/n]: ");
			String answer = input.nextLine();
			
			if (answer.equalsIgnoreCase("y")) {
				System.out.print("Enter filename (eg. file1 without file format): ");
				String name = input.nextLine();
				
				String filename = name + ".ser";
				String filedirectory = "C:\\Users\\Lenovo\\Documents\\" + filename;
				
				File file = new File(filedirectory);
				
				if(!file.exists()) {
					file.createNewFile();
				}
					
				FileOutputStream fileoutput = new FileOutputStream(file);
				ObjectOutputStream output = new ObjectOutputStream(fileoutput);
				
				//add booklist of type LinkedHashSet
				output.writeObject(booklist);
				output.close();
				fileoutput.close();
					
				System.out.println("Serialization done! File has been written as " + filename);
				
			} else if (answer.equalsIgnoreCase("n")) {
			} else {
				throw new InputMismatchException();
			}
			
		} catch(InputMismatchException e) {
			System.out.println("Please input string [y/n] only. Error is " + e.toString());
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 
	 * Reads a specified file that is saved through FileOutStream.
	 * Uses FileInputStream to read the specified file.
	 * 
	 * @throws ClassNotFoundException if the class could not be found.
	 * @throws FileNotFoundException if the file could be retrieved/found.
	 */
	public static void readSavedBook() throws IOException {
		
		@SuppressWarnings("resource")
		Scanner inputs = new Scanner(System.in);
		FileInputStream fileinput;
		ObjectInputStream input;
		String filedirectory = null, filename = null;
		
		try {
			System.out.print("Enter your filename: ");
			filename = inputs.nextLine();
			filedirectory = "C:\\Users\\Lenovo\\Documents\\" + filename + ".ser";
			
			fileinput = new FileInputStream(filedirectory);
			input = new ObjectInputStream(fileinput);
			
			//reconstitutes the LinkedHashSet<Book> instance from a stream, to deserialize it
			@SuppressWarnings("unchecked")
			Set<Book> readbook = (LinkedHashSet<Book>) input.readObject();
			
			System.out.println("\nThe content:\n" + readbook.toString());
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (FileNotFoundException e) {
			System.out.println(e.toString());
		}
		
	}
	
	/**
	 * Checks if the booklist does not contain any duplicate element in the set. Two methods are created in Book Class
	 * such as equals() and hashCode() to ensure that any duplicate book number will not happen.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * @booklist the Book object
	 * 
	 * @return true if the book number is not duplicated, then will be added.
	 * @return false if the book number is duplicated then keep asking until it becomes true.
	 */
	
	public static boolean checkNotDuplicate(Set<Book> booklist, Book book) {
		
		if (!booklist.contains(book)) {
			booklist.add(book);
			System.out.println("New Book has successfully been added.");
			return true;
		} else {
			System.out.println("Duplicate Book. Enter A Different Book Number!");
		    return false;
		}
		
	}
	
	/**
	 * Convert Set to List in order to use a list iterator, or to sort objects.
	 * 
	 * @param bookList the LinkedHashSet class implements set interface to remove duplicate elements of type Book
	 * 
	 * @return a list of type Book.
	 */
	
	public static List<Book> convertSetToList(Set<Book> booklist) {
		List<Book> booklist1 = new ArrayList<Book>(booklist);
		
		return booklist1;
		
	}

}
