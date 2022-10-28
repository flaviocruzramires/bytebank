import 'package:bytebank_app/database/dao/contact_dao.dart';
import 'package:bytebank_app/models/contact.dart';
import 'package:bytebank_app/ui/styles/colors_app.dart';
import 'package:bytebank_app/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../ui/styles/button_styles.dart';
import '../ui/styles/text_styles.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Informe os dados bancários.'),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      label: Text(
                    'Nome do Contato *',
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _accountController,
                  decoration: const InputDecoration(
                    label: Text(
                      'Nº da Conta *',
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  width: MediaQuery.of(context).size.height * .9,
                  onPressed: () {
                    const int id = 0;
                    final String name = _nameController.text;
                    final int account = int.tryParse(_accountController.text)!;

                    final Contact contato =
                        Contact(id: id, name: name, accountNumber: account);

                    _dao.save(contato).then((value) => Navigator.pop(context));
                  },
                  style: ButtonStyles.i.yellowOutLineButton,
                  labelStyle: TextStyles.i.textPrimaryFontBold
                      .copyWith(color: ColorsApp.i.yellow),
                  label: 'Confirma',
                  outline: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
