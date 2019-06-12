

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterProvider {
  int count = 0;

  void increaseCount(){
      count++;
  }
}
class NewBloc implements BlockBase {

  

  final streamController = StreamController();

  Stream get counterStream => streamController.stream;

  int myCount = 0;


  final CounterProvider provider = CounterProvider();

  void updateCount() {
    myCount++;

    streamController.sink.add(myCount);
  }
  
  

  void dispose(){
    streamController.close();
  }


}

abstract class BlockBase {

  dispose();


}
final newBloc = NewBloc();
