import 'package:flutter/material.dart';
import 'models/contact.dart'; 
import 'screens/add_contact_screen.dart';
import 'screens/contact_list_screen.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contactos',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.teal,
        ),
        scaffoldBackgroundColor: Colors.blueGrey[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.blueGrey[900], fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.blueGrey[800]),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ContactHomePage(),
    );
  }
}

class ContactHomePage extends StatefulWidget {
  @override
  _ContactHomePageState createState() => _ContactHomePageState();
}

class _ContactHomePageState extends State<ContactHomePage> {
  List<Contact> _contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda de Contactos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContactListScreen(_contacts, _deleteContact),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(_addContact),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add),
      ),
    );
  }
}
