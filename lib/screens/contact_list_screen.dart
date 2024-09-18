import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDeleteContact;

  ContactListScreen(this.contacts, this.onDeleteContact);

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? Center(
            child: Text(
              'No hay contactos agregados.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        : ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    contact.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  subtitle: Text('${contact.category} - ${contact.phoneNumber}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      onDeleteContact(index);
                    },
                  ),
                ),
              );
            },
          );
  }
}
