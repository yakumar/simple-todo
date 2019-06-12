import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import './bloc.dart';
import './New_Bloc.dart';
import './Todo_Bloc.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController todoController = TextEditingController();


  void _incrementCounter() {

    print('clicked');

   newBloc.updateCount();

    
  }
  void _onSaved(){
    print('${todoController.text}');

    todoBloc.addTodo(todoController.text);

    todoController.text = '';

  

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    todoController.dispose();
  }
 

  @override
  Widget build(BuildContext context) {


   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(

            children: <Widget>[
              Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Type Todo'),
                        onSubmitted: (str){
                          print(' from text form: $str');
                        },
                        controller: todoController,

                      ),
                    ),
                    RaisedButton(
                      child: Text('Save'),
                      color: Colors.green,
                      onPressed: _onSaved,
                    )
                  ],
                ),


              ),
              StreamBuilder(
                stream: todoBloc.todoStream,
                initialData: todoBloc.todoList,
                builder: (BuildContext context, AsyncSnapshot snapshot){

                  snapshot.hasData ? print('snapshot ${snapshot.data}') : print('not coming Data');
                  List<String> todoList = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index){

                      return 
                          Card(
                          


                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 10.0,
                            borderOnForeground: true,
                            color: Colors.teal,
                            child: ListTile(
                              title: Text('${todoList[index]}', style: TextStyle(fontWeight: FontWeight.w700),)),
                              
                               
                          );

                    },

                  );


                },

              ),
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  
}






/////
// ///
// StreamBuilder(
//         stream: newBloc.counterStream,
//         initialData: newBloc.myCount,
//         builder: (context, AsyncSnapshot snapshot) {
//           // if(snapshot.hasData){
//           //   print('from streamBuilder: ${snapshot.data}');
//           //   print(newBloc.counterStream.listen(
//           //     (data){
//           //       print('stream: ${data}');
//           //     }

//           //   ));
//           // } else {
//           //   print('error');
//           // }
          
          
          
//           return Center(
            
//             child: Column(
              
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   snapshot.hasData ? '${snapshot.data}' : 'no data coming',
//                   style: Theme.of(context).textTheme.display1,
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), 