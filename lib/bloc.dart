

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterProvider {
  int count = 0;

  void increaseCount(){
      count++;
  }
}
class MyBloc implements BlockBase {

  final streamController = StreamController();

  Stream get counterStream => streamController.stream;


  final CounterProvider provider = CounterProvider();

  void updateCount() {
    provider.increaseCount();

    streamController.sink.add(provider.count);
  }
  
  

  void dispose(){
    streamController.close();
  }


}

abstract class BlockBase {

  dispose();


}
final bloc = MyBloc();
