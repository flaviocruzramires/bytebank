// import 'package:bytebank_app/models/contact_model.dart';
// import 'package:bytebank_app/screen/contact_form.dart';
// import 'package:bytebank_app/ui/styles/colors_app.dart';
// import 'package:flutter/material.dart';

// import '../database/app_database.dart';

// class ContatoListaPage extends StatelessWidget {
//   ContatoListaPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: const Text('Contatos'),
//       ),
//       body: FutureBuilder(
//         initialData: [
//           // ContactModel vazio = ContactModel(
//           //   id: 0,
//           //   name: 'Sem contato cadastrador',
//           //   conta: 0
//           // ),
//           ListTile(
//             leading: Icon(
//               Icons.error,
//               color: ColorsApp.i.white,
//             ),
//             title: const Text(
//               'Sem conta',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             subtitle: const Text(
//               'Cadastre um novo',
//               style: TextStyle(color: Colors.white, fontSize: 14),
//             ),
//           )
//         ],
//         future: findAll(),
//         builder: (context, snapshot) {
//           final List<ContactModel> contatoss = snapshot.data;
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: contatoss.length,
//             itemBuilder: (BuildContext context, int index) {
//               final ContactModel ocontato = contatoss[index];
//               return ContactItem(ocontato);
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         onPressed: () {
//           Navigator.of(context)
//               .push(
//                 MaterialPageRoute(
//                   builder: (context) => const ContactForm(),
//                 ),
//               )
//               .then((contato) => debugPrint(contato.toString()));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class ContactItem extends StatelessWidget {
//   final ContactModel contact;
//   ContactItem(this.contact);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(contact.name),
//         subtitle: Text(contact.conta.toString()),
//       ),
//     );
//   }
// }
