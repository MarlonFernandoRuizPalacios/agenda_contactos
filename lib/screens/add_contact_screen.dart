import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../components/contact_form.dart';

class AddContactScreen extends StatelessWidget {
  final Function(Contact) onAddContact;

  AddContactScreen(this.onAddContact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Contacto'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ContactForm(onAddContact),
          ),
        ),
      ),
    );
  }
}
