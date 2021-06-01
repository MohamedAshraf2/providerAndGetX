import 'package:compare_app/gitX.dart';
import 'package:compare_app/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<counterProvider>(
          create: (_)=>counterProvider(),
          child: MyHomePage()),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    var provuder = Provider.of<counterProvider>(context);
    var controller =Get.put(CounterController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Provider : ' ,style: TextStyle(color: Colors.teal,fontSize: 30)),
            SizedBox(height: 5),
            Text(provuder.c.toString() ,style: TextStyle(color: Colors.purple,fontSize: 25)),

            SizedBox(height: 30),
            Text('GetX : ' ,style: TextStyle(color: Colors.teal,fontSize: 30)),
            SizedBox(height: 5),
            Obx(()=>Text(controller.c.toString(),style: TextStyle(color: Colors.purple,fontSize: 25)),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          provuder.inc();
          controller.incr();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
