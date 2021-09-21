import 'package:nikishenko_yehor_lab1/first_lab.dart';
import 'package:nikishenko_yehor_lab1/show_mixin.dart';

void main() {
  Menu bigTasty =
      Menu("Big tasty", 140.0, 800, "Coke", 30.0, 500, "Cheese sauce", false);
  Menu bigMac =
      Menu("Big mac", 100.0, 500, "Fanta", 35.0, 750, "Tartarus", false);
  Menu doubleCheese =
      Menu("Double Cheese", 95.0, 570, "Sprite", 35.0, 750, "Tartarus", true);

  var strangeMenu = createMysteriousMenu();
  var currentOrders = [
    {'callories': 1000, 'volume': 1000},
    {'callories': 1500, 'volume': 500},
    {'callories': 2000, 'volume': 750},
    {'callories': 4000, 'volume': 1500},
  ];

  var futureOrders = [bigTasty, bigMac, doubleCheese];
  var menu = [bigTasty, ...futureOrders];

  for (var order in currentOrders) {
    menu.add(strangeMenu(order['callories'], order['volume']));
  }

  print("Finding all menu with Sprite\n");
  for (var spriteMenu in menu.where((Menu) => Menu.getDrink == "Sprite")) {
    print(spriteMenu);
  }
  print("Finding all fat menu with more than 1500 Callories\n");
  for (var fatMenu in menu.where((Menu) => Menu.getFullCallories > 1500)) {
    print(fatMenu);
  }

  print("Check if any menu with discount are available\n");
  var isAnyDiscount = menu.any((Menu) => Menu.isDiscount);
  print(isAnyDiscount);

  print("\nCheck ??= operator");
  var checkOperator;
  print("checkOperator = $checkOperator");
  checkOperator ??= isAnyDiscount;
  print("checkOperator = $checkOperator");
  checkOperator ??= !isAnyDiscount;
  print("checkOperator = $checkOperator");

  //show how mixin works
  print("\nHow mixin works:\n");
  var tmb = TwoManBand();
  var jazz = JazzPlayer();
  jazz.myMusicIsTheBest();
  tmb.myMusicIsTheBest();
}
