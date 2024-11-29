
enum Genre { Roman, Fantastique, Fiction, Biographie }

class Book {
  late String titre, auteur;
  late int date, page;
  late Genre genre;

  Book(this.titre, this.auteur, this.genre, this.date, this.page);

  String get details => "$titre de $auteur, publié en $date, $page pages, Genre: $genre";
}

class Emprunt {
  late String nom;
  late Book book;
  late Duration borrowDuration;

  Emprunt(this.nom, this.book, this.borrowDuration);

  DateTime get retour => DateTime.now().add(borrowDuration);
  String get info => "$nom a emprunté ${book.titre} le ${DateTime.now().toString().split(":${DateTime.now().second}")[0]}h et a jusqu'à le ${retour.toString().split(" ")[0]} pour le rendre";
  bool get isLate => DateTime.now().isAfter(retour);
}

class Library {
  List<Book> books = [];
  List<Emprunt> emprunts = [];

  void addBook(Book book) => books.add(book);

  void addEmprunt(Emprunt emprunt) => emprunts.add(emprunt);

  void listBooks() => books.forEach((i) => print("Livre n°${books.indexOf(i)+1} : ${i.details}"));
  
  void listEmprunts() => emprunts.forEach((j) => print("Emprunt n°${emprunts.indexOf(j)+1} : ${j.info}"));
  
  void listLateReturns() => emprunts.where((e) => e.isLate).forEach((e) => 
  print("Emprunt en retard n°${emprunts.indexOf(e)} : ${e.nom} est en retard sur son emprunt du livre : ${e.book.titre}"));
  
}

void main() {
  var livre1 = Book("Harry Potter", "J. K. Rowling", Genre.Fantastique, 1997, 320);
  var livre2 = Book("1984", "George Orwell", Genre.Fiction, 1949, 328);
  
  var library = Library();
  library.addBook(livre1);
  library.addBook(livre2);

  var client1 = Emprunt("Zeid", livre1, Duration(days: -5));
  var client2 = Emprunt("Timo", livre2, Duration(days: 10)); 

  library.addEmprunt(client1);
  library.addEmprunt(client2);


  library.listBooks();
  print("\n");
  library.listEmprunts();
  print("\n");
  library.listLateReturns(); 
}


