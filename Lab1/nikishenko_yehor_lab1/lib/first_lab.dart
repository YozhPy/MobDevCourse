class Burger {
  late final String burgerName;
  late double _price;
  late bool hasDiscount;
  late final int _callories;

  //getter and setter; Fat-Arrow-Notation, example of Sytactic Sugar (SS)
  String get name =>
      "Bon Appetit! Your menu:\n$burgerName with $_callories callories ";
  int get callories => _callories;
  set newPrice(double val) => _price = val;
  set newDiscountStatus(bool disc) => hasDiscount = disc;

  //default constructor; Example of SS
  Burger(this.burgerName, this._price, this.hasDiscount, this._callories);

  //named constructor
  Burger.namedConstruct(this._price, this._callories,
      {this.burgerName = "Unknown", this.hasDiscount = false});
}

class Drink {
  late final String drinkName;
  late double _price;
  late int volume;

  String get name => "and $drinkName with $volume volume ";
  double get getPrice => _price;
  //Example of SS; Initializer list
  Drink(drinkName, price, volume)
      : drinkName = drinkName,
        _price = price,
        volume = volume;

  //factory construct
  factory Drink.build(bool isCoke) {
    return isCoke ? Drink("Coke", 30.0, 500) : Drink("Sprite", 35.0, 500);
  }
}

class Menu {
  late Burger burger;
  late Drink drink;
  late String sauce;
  late dynamic fullPrice;
  String get getDrink => drink.drinkName;
  dynamic get getFullPrice => fullPrice;
  dynamic get getFullCallories => burger.callories;
  dynamic get isDiscount => burger.hasDiscount;
  Menu(burgName, burgPrice, burgCal, drinkName, drinkPrice, drinkVolume,
      [sauceName = "None", disc = false]) {
    burger = Burger.namedConstruct(burgPrice, burgCal,
        burgerName: burgName, hasDiscount: disc);
    drink = Drink(drinkName, drinkPrice, drinkVolume);
    sauce = sauceName;
    Function f1 = (num i) => i * 0.8;
    Function f2 = (num j) => j += 10;
    fullPrice = findFullPrice(burgPrice, drinkPrice, disc, sauce, f1, f2);
  }

  @override
  String toString() {
    var tmp = sauce == "None" ? "without sauce" : "with $sauce sauce";
    return ("${burger.name}${drink.name}$tmp for $fullPrice UAH!\n\n");
  }
}

//closure
Function createMysteriousMenu() {
  var price = 666.666;
  var name = "Top secret";
  return (int Callories, int Volume) =>
      Menu(name, price, Callories, name, price, Volume);
}

//lambda-function as parameter
dynamic findFullPrice(
    double bPrice, double dPrice, bool disc, String sName, var f1, var f2) {
  //example of SS
  var fullPrice = disc == false ? bPrice + dPrice : f1(bPrice) + dPrice;
  if (sName != "None") {
    fullPrice = f2(fullPrice);
  }
  return fullPrice;
}
