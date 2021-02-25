import 'package:pwa_mobx/store/counter/counter.dart';

class UtilityClass {

  UtilityClass._privateConstructor();
  Counter _counter = Counter();

  static final UtilityClass _instance = UtilityClass._privateConstructor();

  factory UtilityClass() {
    return _instance;
  }

  Counter getCounter (){
    return _counter;
  }
}