
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

/* Important Note :
1-Create 'abstract class'
2-Write In Terminal : flutter packages pub run build_runner watch
3-Create 'class Counter'
*/
abstract class _Counter with Store{
  @observable
  int count = 0;

  @action
  void increment(){
    count++;
    save();
  }

  @action
  void decrement(){
    count--;
    save();
  }

  @action
  void save()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);
  }

  @action
  load()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    count= prefs.getInt('counter')??0;
  }

}