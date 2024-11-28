enum Genre{Roman, Fantastique, Fiction, Biographie}

class Book{
  late String titre, auteur;
  late int date, page;
  late Genre genre;

  Book(this.titre, this.auteur, this.genre, this.date, this.page);
}


class Emprunt{
  late String nom;
  late Book book;
  late Duration BorrowDuration;
  
  Emprunt(this.nom, this.book, this.BorrowDuration);

  DateTime get retour => DateTime.now().add(BorrowDuration);
  String get info => "$nom a emprunté ${book.titre} le ${DateTime.now().toString().split(":${DateTime.now().second}")[0]}h et a jusqu'à le ${retour.toString().split(":")[0]}h pour le rendre";
}


void main(){
  var livre = Book("Harry Potter", "J. K. Rowling", Genre.Fantastique, 1997, 320);
  var client1 = Emprunt("Zeid", livre, Duration(days: 1, hours: 1));
  print(client1.info);
}

