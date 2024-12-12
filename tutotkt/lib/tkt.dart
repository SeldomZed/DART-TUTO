import 'dart:async';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/* VAR :
int : Représente des nombres entiers (ex. 1, 42).
double : Représente des nombres à virgule flottante (ex. 3.14, 0.5).
num : Supertype pour int et double (peut contenir les deux).
String : Représente du texte ou une chaîne de caractères (ex. "Bonjour").
bool : Représente une valeur vraie ou fausse (true, false).
List : Représente une liste ordonnée d'éléments (ex. [1, 2, 3]).
Set : Représente une collection d'éléments uniques, non ordonnée (ex. {1, 2, 3}).
Map : Représente une collection de paires clé-valeur (ex. {‘clé’: valeur}).
Runes : Représente des caractères Unicode (pour travailler avec des symboles ou emojis).
Symbol : Représente un identifiant, souvent utilisé en réflexion pour symboliser des noms.
dynamic : Peut contenir n'importe quel type, vérification de type désactivée.
Object : Supertype de tous les types, toute valeur Dart est un Object.
void : Utilisé pour indiquer qu'une fonction ne renvoie aucune valeur.
Null : Représente la valeur null, utilisé pour indiquer qu'une variable ne pointe vers rien.
Never : Indique qu'une fonction ne retournera jamais (ex. une fonction qui lance une erreur).
Future : Représente une valeur asynchrone qui sera disponible dans le futur.
Stream : Représente une série de valeurs asynchrones émises sur une période.
Function : Représente une fonction (ex. int add(int a, int b)).
Enum : Utilisé pour représenter un ensemble de valeurs constantes (ex. enum Color { red, green, blue }).

MOD :
var : Permet à Dart d'inférer automatiquement le type de la variable en fonction de sa valeur initiale.
final : Variable assignée une seule fois, sa valeur ne peut plus être modifiée après initialisation.
const : Déclare une constante immuable dont la valeur est fixée à la compilation.
late : Permet de déclarer une variable non initialisée qui sera initialisée plus tard. Elle doit être initialisée avant son utilisation.
static : Attribut de classe, partagé par toutes les instances. Utilisé dans le contexte des classes.
external : Indique que la méthode ou la variable est définie ailleurs, souvent utilisée avec des bibliothèques natives.
dynamic : Utilisé pour des variables qui peuvent contenir n'importe quel type. Dart ne fera pas de vérification stricte de type à la compilation.
covariant : Utilisé dans l'héritage pour permettre à un paramètre d'accepter des sous-types dans une sous-classe.
abstract : Utilisé pour déclarer une classe abstraite ou une méthode qui doit être implémentée par une sous-classe. Elle ne peut pas être instanciée directement.
required : Utilisé avec des paramètres nommés pour indiquer qu'ils sont obligatoires lors de l'appel d'une fonction ou d'un constructeur.
getter / setter : Utilisés pour créer des propriétés calculées dans une classe.
typedef : Utilisé pour créer un alias de type, souvent pour des signatures de fonctions complexes.
factory : Utilisé pour déclarer un constructeur qui peut renvoyer une instance existante ou appliquer des règles spéciales de création d'instances.
async / await : Utilisés pour gérer des opérations asynchrones dans des fonctions. async marque une fonction qui retourne une Future, et await suspend l'exécution jusqu'à ce que le résultat soit prêt.
sync* / yield : Utilisés pour créer des itérateurs paresseux ou des fonctions génératrices. sync* retourne un itérateur synchronisé, et yield émet des valeurs une par une.
async* / yield : Similaire à sync*, mais pour des fonctions génératrices asynchrones, qui émettent des valeurs au fil du temps via un Stream.
@override : Utilisé pour indiquer que la méthode redéfinie dans une sous-classe remplace la méthode d'une classe parent.
@deprecated : Annotations pour indiquer qu'une méthode ou une classe est obsolète et ne devrait plus être utilisée.
@required (Flutter) : Utilisé dans Flutter pour indiquer qu'un paramètre est obligatoire. Il est maintenant remplacé par required directement en Dart avec Null Safety. */

void readLineTuto() {
  print('Donne un premier nombre : ');
  String? input1 = stdin.readLineSync();
  print('Donne un deuxieme nombre : ');
  String? input2 = stdin.readLineSync();

  print(
      "La somme de $input1 + $input2 est : ${double.parse(input1!) + double.parse(input2!)}");
}

// un iterable est une collection d'éléments qui peuvent être parcourus un par un(itérés) avec 'for in', '.forEach()' etc List et Set
// c'est l'element de la liste par ex : a = [(1,2,3),(4,5,6)]  (1,2,3) est un iterable
void SplitMapToListParseTuto() {
  print('Donne des nombres :');
  String? input1 = stdin.readLineSync();
  Set<String> name = {"zed", "victor", "laurent"}; // Setts PAS DE DUPLICATION
  if (input1 != null && input1.isNotEmpty) {
    List<double> numbers = input1
        .split(' ') //  print(numbers.runtimeType); => List<String>
        .map((e) => double.parse(
            e)) //  print(result.runtimeType); /=> MappedListIterable<String, double> (ITERABLE c'est la liste travaillé en gros)
        .toList(); //  print(numbers.runtimeType); => List<String>

    double somme = numbers.reduce((a, b) => a + b);
    double moyenne = somme / numbers.length;

    print("Les nombres donnés sont : $numbers");
    print("La moyenne est : $moyenne");
  }
}
// splitt : return une liste (meme si on lui donne un String) avec les elements espacé par le parametre indiqué (un regex aussi)
// mapt : return l'iterable qu'on lui a donné en ayant appliqués la fonction sur tous ces elements
// toListt : transforme un iterable en liste

void mapTuto() {
  Set<Map> mySet = {
    // set de dictionnaire, dla merde for(i in)/ firstWhere/ for each etc pour acceder a name par ex
    {'name': 'Zed', 'age': 30, 'city': 'Paris'},
    {'name': 'victor', 'age': 10, 'city': 'New York'},
    {'name': 'palmer', 'age': 47, 'city': 'Australie'}
  };
  List<Map> myMap = [
    // dicitionnaire de dictionnaire index marche
    {'name': 'Zed', 'age': 30, 'city': 'Paris'},
    {'name': 'victor', 'age': 10, 'city': 'New York'},
    {'name': 'palmer', 'age': 47, 'city': 'Australie'}
  ];

  print(myMap[1]["name"]);
  print(mySet.firstWhere((element) => element['name'] == 'Zed')[
      // return {name: Zed, age: 30, city: Paris} puis ['name'] comment en haut ou 1 represente le Map
      'name']);
}

void pointSuite() {
  var a = '12 18 89 85';
  print(a.runtimeType);
  var b = a.split(' ');
  print("$b = e ${b.runtimeType}");
  var c = b.map((i) => int.parse(i));
  print("$c ${c.runtimeType}");
  var d = c.toList();
  print("$d ${d.runtimeType}");
// ||
// || Same
// \/

  var ez = '12 18 89 85'.split(' ').map((i) => int.parse(i)).toList();
  print(ez);
// ||
// || Same
// \/

  var ez2 = '12 18 89 85'.split(' ').map((i) => int.parse(i)).toList();
  print(ez);
}

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

void ContainsWhereAnyTuto(List<String> liste,
    {String? OneOption, List<String>? ManyOption}) {
  if (OneOption != null)
    liste.where((element) => element.contains(OneOption)).forEach(print);
  if (ManyOption != null)
    liste
        .where((elementListe) =>
            ManyOption.any((lesOptions) => elementListe.contains(lesOptions)))
        .forEach(print);
}
// wheret : return uniquement les elements qui sont true aux conditions, ex : si element est true à : element.contains(OneOption) alors il return element
// containst: return un bool si le truc contient l'option
// forEacht : fait l'action sur chaque elements (permet de parcourir aussi ducoup)

// ||
// ||  Version long chiant
// \/
void ContainsTutoEz(List<String> liste,
    {String? OneOption, List<String>? ManyOption}) {
  if (OneOption != null) {
    for (String i in liste) {
      if (i.contains(OneOption)) {
        print(i);
      }
    }
  }

  if (ManyOption != null) {
    for (String i in liste) {
      for (String j in ManyOption) {
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
// foldt : = reduce mais nécessite une valeur initiale, e.g Message ici, marche si la collection est vide contrairement à reduce et peut être différent du type des éléments

class GetterTuto {
  String name;
  int birthYear;

  GetterTuto(this.name, this.birthYear);

  int get age =>
      DateTime.now().year -
      birthYear; // gett : c'est = methode mais plus fluide et intuitif car appelé comme une propriété contrairement aux methode, fait office de variable aussi

  int aged() => DateTime.now().year - birthYear; // methode classique
  // =>t : permet de supprimer les { } et le return
}

void getter() {
  var guy = GetterTuto("Pere", 1972);
  print(guy.age); // Getter
  print(guy.aged()); // Methode
}

class DifferenceDateTime {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate
      ?.year; // ?.t : verifie si launchDate est null, si pas null => return launchDate.year

  DifferenceDateTime(this.name, this.launchDate) {}

  DifferenceDateTime.unlaunched(String name) : this(name, null);
  // SAME =>  : this.name = name , launchDate = null;
  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int annee = DateTime.now().difference(launchDate).inDays ~/
          365; // A.differencet(B) : A = diminué B = diminuant et ~/ division euclidienne (avec reste)
      int mois = DateTime.now().difference(launchDate).inDays % 365 ~/ 30;
      int jour = DateTime.now().difference(launchDate).inDays % 365 % 30;
      print(
          'Launched in $launchYear ($annee years, $mois months and $jour days ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void DifferenceDT() {
  var Nasa = DifferenceDateTime("SpaceX", DateTime(2002, 10));
  var Nasa2 = DifferenceDateTime.unlaunched("WooW");
  Nasa.describe();
  Nasa2.describe();
}

class ConstruNommeEz {
  String owner;
  double balance;

  ConstruNommeEz(
      this.owner, this.balance); // Constructeur principal de ConstruNommeeEz

  ConstruNommeEz.empty(String owner)
      : this(owner,
            0); // Constructeur nommé qui permet d'eviter d'inclurer {} etc et auto documente le code empty/premium = Clair Intuitif
  // il redirige les parametres .ConstucteurNommé(PARAMETRES) au constructeur principal avec le ' : this()' il lui passe un parametre immuable (ici 0) une valeur par defaut

  void showInfo() {
    print('Owner: $owner, Balance: $balance');
  }
}

class ConstruNomme {
  String owner;
  double balance;

  ConstruNomme(this.owner, {double? initialBalance})
      : balance = initialBalance ??
            0; // Initializer List : tous ce qui suit le ':' est exécuté avant le corps du constructeur
  // opérateur de coalescence des nuls, A ?? B : return A si pas A est n'est pas null, return B si null
  void showInfo() {
    print('Owner: $owner, Balance: $balance');
  }
}

void Constru() {
  var normalAccountEz = ConstruNommeEz('Alice', 500);
  var emptyAccountEz =
      ConstruNommeEz.empty('Bob'); // plus rapide et intuitif grâce à "empty"

  normalAccountEz.showInfo();
  emptyAccountEz.showInfo();

  var normalAccount = ConstruNomme('Alice', initialBalance: 500);
  var emptyAccount =
      ConstruNomme('Bob', initialBalance: 0); //  t'as capté le bail

  normalAccount.showInfo();
  emptyAccount.showInfo();
}

enum PlanetType { terrestrial, gas, ice }

enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);
  // enumt : collection de valeurs constantes; pas d'instance dcp, on cree des modeles ici direct et seuls les valeurs definit peuvent etre utilisé (terrestrial, gas, ice)
  // utile pour représenter des choix fixes, un ensemble de données immuables, planètes, états, couleurs, voitures etc

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  String get printInfo =>
      ("Info : ${planetType}, Moons : ${moons}, HasRings : ${hasRings}");
  bool get isGiant =>
      planetType == PlanetType.gas ||
      planetType == PlanetType.ice; // ||t : OR, un des deux ou les deux
}

void EnumName() {
  var planet1 = Planet.uranus;
  print(
      "Name : ${planet1.name}, ${planet1.printInfo}"); // .namet avec Enum renvoie le nom des membres enrichis, ici => mercury, venus etc
  print(planet1.isGiant);
}

// ||
// ||   Same sans Enum et dcp instantiable
// \/
enum PlanetTypeSansEnum { terrestrial, gas, ice }

class PlanetSansEnum {
  final String name;
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  const PlanetSansEnum._(this.name, this.planetType, this.moons,
      this.hasRings); // ._t : Constructeur nommée privé

  // Instances prédéfinies comme dans un enum, faut utiliser des constante CONST
  static const PlanetSansEnum mercury =
      PlanetSansEnum._('Mercury', PlanetType.terrestrial, 0, false);
  static const PlanetSansEnum venus =
      PlanetSansEnum._('Venus', PlanetType.terrestrial, 0, false);
  static const PlanetSansEnum neptune =
      PlanetSansEnum._('Neptune', PlanetType.ice, 14, true);

  String get Info =>
      ("Info : Name : ${this.name}, ${this.planetType}, Moons : ${this.moons}, HasRings : ${this.hasRings}");
}

void EnumNameSansEnum() {
  var planet01 = PlanetSansEnum.neptune;
  print(planet01.Info);
  var planet02 = PlanetSansEnum._("Earth", PlanetType.terrestrial, 1,
      false); // on peut instancier un nouvelle objet
  print(planet02.Info);
}

class PointConst {
  final int x,
      y; // finalt : immuable, une fois que la variable ou propriété est assignée, sa valeur ne peut plus être changée (mais pas à la compilation comme const)
  const PointConst(this.x,
      this.y); // si le constructeur est un const il exige que toutes les propriétés de l'objet soient déclarées avec final
}

void ConstTuto() {
  const p1 = PointConst(0,
      0); // constt : il est calculé et crée au moment de la compilation, gain de memoire car si a = 0 et b = 0 alors il va juste mettre a = b/b = a
  const p2 = PointConst(0,
      0); // pour ca qu'on peut plus changé la valeur apres, car a et b pointent vers la même instance en mémoire
  var p3 = PointConst(0, 0);

  print(p1 ==
      p2); // true (p1 = p2, pointent vers même instance en memoire, car const)
  print(p1 ==
      p3); // false (2 instance differentes car non const, meme si ils ont la meme valeur ici)
}

class InheritanceTuto extends DifferenceDateTime {
  // Heritage : extendst :  InheritanceTuto herite de DifferenceDateTime, ces propriétés et methodes publiques etc

  double altitude; //  Nouvelle Attribut/Propriété

  InheritanceTuto(super.name, DateTime super.launchDate,
      this.altitude); // super.t pour les proprietés de la class herités et this.t les nouveaux de la classe qui herite
}

mixin Flyer {
  // mixint : classe spéciale qui permet de partager du code entre plusieurs classes sans recourir à l'héritage, pas de constructeur
  void fly() => print('I can fly!');
}

mixin class Swimmer {
  // mixin classt : au besoin d’une structure hybride avec un constructeur pouvant aussi être utilisée comme un mixin !NON
  void swim() => print('I can swim!');
}

class Bird with Flyer {}

class Fish with Swimmer {}

class Duck with Flyer, Swimmer {}

void MixinTuto() {
  var bird = Bird();
  bird.fly();
  var duck = Duck();
  duck.fly();
  duck.swim();
}

abstract class Animal {
  // abstractt : conçue pour être héritée par d'autres classes, sert à fournir une base de comportement commun (bark et meow) = makeSound
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() => print('Bark!');
}

class Cat implements Animal {
  @override
  void makeSound() => print('Meow!');
}

void ImplementsTuto() {
  List<Animal> animals = [Dog(), Cat()];

  for (var animal in animals) {
    animal.makeSound();
  }
}

Future<void> printWithDelay(String message, Duration delay) async {
  await Future.delayed(delay);
  print(message);
}

Future<void> printWithDelay2(String message, Duration delay) {
  return Future.delayed(delay).then((_) {
    print(message);
  });
}

void throwTuto(var a, b) {
  // throwt
  if (a < b)
    throw StateError("Non a < b");
  else
    print(a - b); // if elset en une ligne
}

void throwTutoEz(var a, var b) =>
    (a < b ? throw StateError("Non, doit etre a < b") : print(a - b));
// ?t : operateur ternaire  ( condition A ? B : C ) => (return B si A true) (return C si A false)

void exceptionTuto(int number) {
  if (number < 0) {
    throw ArgumentError(
        "Le nombre ne peut pas être négatif."); // Lancer une exception
  }
  if (number == 0) {
    throw Exception(
        "Le nombre ne peut pas être zéro."); // Autre type d'exception
  }
  print("Nombre valide : $number");
}

void tryTuto() {
  try {
    int myNumber = 0; // Remplacez par des valeurs différentes pour tester
    exceptionTuto(myNumber);
  } on ArgumentError catch (e) {
    // Capture une exception spécifique
    print("Erreur d'argument : $e");
  } catch (e) {
    // Capture toutes les autres exceptions
    print("Une erreur est survenue : $e");
  } finally {
    // Code qui s'exécute toujours
    print("Bloc finally : Fin de la vérification.");
  }
}

// Future<Post> fetchPost() {
//   const delay = Duration(seconds: 2);

//   return Future.delayed(delay, () => Post("my post", 123));
// }

// void thenTuto() {
//   // same
//   fetchPost().then((p) {
//     print(p.title);
//     print(p.userId);
//   });
// }

// void AsyncAwaitTuto() async {
//   // same
//   final post1 = await fetchPost();
//   print(post1.title);
// }

class Post {
  String api;
  bool blabla;

  Post(this.api, this.blabla);
}

Future<Post> tutoApi() async {
  var url = Uri.https('noda-dm.enodea-prd.com', '/test38.json');
  final response = await http.get(url);
  Map<String, dynamic> data = convert.jsonDecode(response.body);
  return Post(data['ApiUrl'], data["uneNouvelleVarable"]);
}

void main() async {
  final urlApi = await tutoApi();
  print(urlApi.api);
  print(urlApi.blabla);
}
