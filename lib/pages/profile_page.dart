import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Créé votre CV'),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Nom *', icon: Icon(Icons.person)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty || value.contains('@')) {
                  return 'Empty value or @ caracter detected';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Prenom *', icon: Icon(Icons.person)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty || value.contains('@')) {
                  return 'Empty value or @ caracter detected';
                }
                return null;
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Age', icon: Icon(Icons.person)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'email *', icon: Icon(Icons.mail)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Numéro de téléphone *',
                  icon: Icon(Icons.mobile_friendly_outlined)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Dernier diplôme *',
                  icon: Icon(Icons.school_outlined)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Poste recherché *',
                  icon: Icon(Icons.home_max_outlined)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}