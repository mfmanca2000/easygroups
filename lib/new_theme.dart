import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewThemeScreen extends StatelessWidget {
  static const String routeName = '/new-theme';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _responsableController = TextEditingController();

  NewThemeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuovo tema'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Inserisci nome'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _responsableController,
                decoration: InputDecoration(hintText: 'Inserisci responsabile'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Add'),
                color: Colors.red,
                onPressed: () async {
                  // DocumentReference ref =
                  await Firestore.instance.collection('themes').add({
                    'name': _nameController.text,
                    'responsable': _responsableController.text
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
