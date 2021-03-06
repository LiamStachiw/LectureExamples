import 'package:flutter/material.dart';

import 'model/person.dart';

class AddPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Person')),
      body: AddPersonForm(),
    );
  }
}

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPersonForm> {
  final _formKey = GlobalKey<FormState>();
  final _person = Person();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.assignment),
              title: Text('Person name:'),
              subtitle: TextFormField(
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                        _person.name = value;
                      })),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: RaisedButton(
                  child: Text('Add Person'),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();

                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Person "${_person.name}" added.')));

                      Navigator.pop(context, _person);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
