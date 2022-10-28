import 'package:bytebank_app/database/app_database.dart';
import 'package:bytebank_app/models/contact.dart';
import 'package:bytebank_app/screen/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Contatos'),
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          final List<Contact>? contacts = snapshot.data;
          return ListView.builder(
            itemCount: contacts?.length,
            itemBuilder: ((context, index) {
              final Contact contato = contacts![index];
              return _ContactItem(contato);
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then((contato) => debugPrint(contato.toString()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.payment,
          color: Colors.green,
        ),
        title: Text(
          contact.name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.blueGrey,
          ),
        ),
        subtitle: Text(
          contact.conta.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   setState();
  // }
}
