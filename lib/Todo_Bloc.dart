import 'dart:async';




class TodoBloc implements DisposeTodo {


  List<String> todoList = [];



  StreamController todoStreamController = StreamController<List<String>>();

  get todoSink => todoStreamController.sink;

  get todoStream => todoStreamController.stream;

  void addTodo(String todo){

    todoList.add(todo);

    todoSink.add(todoList);

  }





  @override
  void dispose() {

    todoStreamController.close();

  }

}


abstract class DisposeTodo {
  void dispose();
}

final todoBloc = TodoBloc();