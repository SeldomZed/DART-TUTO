import 'dart:async';
import 'dart:io';
import 'dart:math';


void readLineTuto(){
print('Donne un premier nombre : ');
String? input1 = stdin.readLineSync();
print('Donne un deuxieme nombre : ');
String? input2 = stdin.readLineSync();

print("La somme de $input1 + $input2 est : ${double.parse(input1!) + double.parse(input2!)}");

}

void SplitMapToListParseTuto() {
  print('Donne une liste de nombres :');
  String? input1 = stdin.readLineSync(); 

  if (input1 != null && input1.isNotEmpty) {
    List<double> numbers = input1
        .split(' ')     //  print(numbers.runtimeType); // List<String>
        .map((e) => double.parse(e)) //  print(result.runtimeType); // MappedListIterable<String, String> (ITERABLE c'est la liste travaillé en gros)
        .toList(); //  print(numbers.runtimeType); // List<String>

    double somme = numbers.reduce((a, b) => a + b); 
    double moyenne = somme / numbers.length;

    print("Les nombres donnés sont : $numbers");
    print("La moyenne est : $moyenne");
  }
}
// splitt : return une liste (meme si on lui donne un String) avec les elements espacé par le parametre indiqué (un regex aussi)
// mapt : return un iterable qu'on lui donné en ayant appliqués la fonctions a tous ces elements
// toListt : transforme un iterable en liste 

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}
void ReduceTuto() {
  List<Person> people = [
    Person("Alice", 25),
    Person("Bob", 30),
    Person("Charlie", 39)
  ];

  Person oldest = people.reduce((a, b) => a.age > b.age ? a : b);
  print("La personne la plus âgée est ${oldest.name}, ${oldest.age} ans.");
}
// reducet : approche gloutonne, car il parcourt etape par etape() et applique l'action , il ne return qu'UN seul element final, doit être du même type que les éléments.
// a = Person("Alice", 25) et b = Person("Bob", 30) -> 25>30 = false -> b devient a -> a = Person("Bob", 30) et b = Person("Charlie", 28) -> 30>28 -> a = a return a


void ContainsWhereAnyTuto(List<String> liste, {String? OneOption, List<String>? ManyOption}){
  
if (OneOption != null) liste.where((element) => element.contains(OneOption)).forEach(print);
if (ManyOption != null) liste.where((elementListe) => ManyOption.any((lesOptions) => elementListe.contains(lesOptions))).forEach(print);
}
// wheret : return uniquement les elements qui sont true aux conditions
// containst: return un bool si le truc contient l'option
// forEacht : fait l'action sur chaque elements (permet de parcourir aussi ducoup)

// ||
// ||  Version long chiant
// \/
void ContainsTutoEz(List<String> liste, {String? OneOption, List<String>? ManyOption}){
 
 if (OneOption != null) {
  for (String i in liste){
    if (i.contains(OneOption)) {
      print(i);
    }
  }
 }

 if (ManyOption != null){
  for (String i in liste){
    for (String j in ManyOption){
      if (i.contains(j)) {
      print(i);
    }
    }
  
  }
 }  

}

void FoldTuto() {
  List<String> words = ["Dart", "is", "fun", "isnt", "it ?"];

  String sentence = words.fold("Message : ", (a, b) => a + b + " ");
  print(sentence);
}
// foldt : =reduce mais nécessite une valeur initiale, e.g Message ici, marche si la collection est vide contrairement à reduce et peut être différent du type des éléments 


class GetterDateTimeTuto {
  String name;
  int birthYear;

  GetterDateTimeTuto(this.name, this.birthYear);

  int get age => DateTime.now().year - birthYear;  // Gettert : c'est = methode mais plus fluide et intuitif car appelé comme une propriété contrairement aux methode
    
  int aged() => DateTime.now().year - birthYear; // methode classique
    // =>t : permet de supprimer les { } et le return 
  

} 
void getter(){
    var guy = GetterDateTimeTuto("Pere", 1972);
    print(guy.age); // Getter
    print(guy.aged()); // Methode
  }

class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year; // ?.t : verifie si launchDate est null, si false => return launchDate.year

  Spacecraft(this.name, this.launchDate) {
  }

  Spacecraft.unlaunched(String name) : this(name, null); // constructeur nommé

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365; // A.differencet(B) : A = diminué B = diminuant et ~/ division euclidienne (avec reste)
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void main() {
}






