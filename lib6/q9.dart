// Create a system to manage books in a library.
// Implement a Book class with properties like title, author, isbn, and isAvailable.
// Implement a Library class with methods:
// - addBook(Book book): Adds a book to the library.
// - borrowBook(String isbn): Marks a book as borrowed if available.
// - returnBook(String isbn): Marks a book as available again.
// - searchByTitle(String title): Returns books matching the title.
// Ensure that the system correctly updates the book's availability

class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable = true;

  Book(this.title, this.author, this.isbn);
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void borrowBook(String isbn) {
    for (var book in books) {
      if (book.isbn == isbn && book.isAvailable) {
        book.isAvailable = false;
        print('Book borrowed: ${book.title}');
        return;
      }
    }
    print('Book not available');
  }

  void returnBook(String isbn) {
    for (var book in books) {
      if (book.isbn == isbn && !book.isAvailable) {
        book.isAvailable = true;
        print('Book returned: ${book.title}');
        return;
      }
    }
    print('Book not found or already available');
  }

  void searchByTitle(String title) {
    for (var book in books) {
      if (book.title.toLowerCase().contains(title.toLowerCase())) {
        print('Found: ${book.title} by ${book.author}');
      }
    }
  }
}

void main() {
  Library library = Library();

  library.addBook(Book('1984', 'George Orwell', '12345'));
  library.addBook(Book('Brave New World', 'Aldous Huxley', '67890'));

  library.borrowBook('12345');
  library.returnBook('12345');
  library.searchByTitle('Brave');
}
