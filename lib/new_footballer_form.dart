import 'package:digimon_2324/footballer_model.dart';
import 'package:flutter/material.dart';


class AddFootballerFormPage extends StatefulWidget {
  const AddFootballerFormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddFootballerFormPageState createState() => _AddFootballerFormPageState();
}

class _AddFootballerFormPageState extends State<AddFootballerFormPage> {
  TextEditingController nameController = TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('You forgot to insert the footballer name'),
      ));
    } else {
      var newFootballer = Footballer(nameController.text);
      Navigator.of(context).pop(newFootballer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new footballer'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        color: Color.fromARGB(255, 5, 194, 55),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: nameController,
                style: const TextStyle(decoration: TextDecoration.none),
                onChanged: (v) => nameController.text = v,
                decoration: const InputDecoration(
                  labelText: 'Footballer Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () => submitPup(context),
                    child: const Text('Submit Footballer'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
