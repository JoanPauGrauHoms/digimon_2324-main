import 'package:flutter/material.dart';
import 'dart:async';
import 'footballer_model.dart';
import 'footballer_list.dart';
import 'new_footballer_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My fav football players',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(
        title: 'My fav football players',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Footballer> initialFootballers = [Footballer('Messi'), Footballer('Gavi'), Footballer('Araujo')];

  Future _showNewFootballerForm() async {
    try {
      Footballer newFootballer = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return const AddFootballerFormPage();
      }));
      print(newFootballer);
      initialFootballers.add(newFootballer);
      setState(() {});
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showNewFootballerForm,
          ),
        ],
      ),
      body: Container(
          color: const Color.fromARGB(255, 5, 194, 55),
          child: Center(
            child: FootballerList(initialFootballers),
          )),
    );
  }
}