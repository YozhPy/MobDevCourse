import 'package:nikishenko_yehor_lab1/first_lab.dart';
import 'package:test/test.dart';

void main() {
  test('Check_factory_constructor', () {
    var obj = Drink.build(true);
    assert(obj.drinkName == "Coke");
    assert(obj.volume == 500);
    assert(obj.getPrice == 30.0);
  });

  test('Check_Closure', () {
    var tmp = createMysteriousMenu();
    var obj = tmp(1000, 2000);
    assert(obj.getFullPrice == 666.666 * 2);
    assert(obj.getFullCallories == 1000);
  });
}
