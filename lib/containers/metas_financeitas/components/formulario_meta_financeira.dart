import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CadastroMetaFinanceira extends StatelessWidget {
  static const route = "/cadastro-meta-financeira";

  const CadastroMetaFinanceira({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Meta Financeira")),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastre sua nova meta!',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    const MetaFinanceiraForm(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Define a custom Form widget.
class MetaFinanceiraForm extends StatefulWidget {
  const MetaFinanceiraForm({super.key});

  @override
  MetaFinanceiraFormState createState() {
    return MetaFinanceiraFormState();
  }
}

class MetaFinanceiraFormState extends State<MetaFinanceiraForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeMetaController = TextEditingController();
  final TextEditingController _descricaoMetaController =
      TextEditingController();
  final TextEditingController _valorMetaController = TextEditingController();
  final TextEditingController _prazoMetaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nomeMetaController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome da meta',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nome Obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descricaoMetaController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Descrição da meta',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Descrição da meta obrigatória';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}'))
            ],
            controller: _valorMetaController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'valor da meta',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'valor da meta obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
              keyboardType: TextInputType.datetime,
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(3000),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    _prazoMetaController.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  }
                });
              },
              controller: _prazoMetaController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Prazo para a meta',
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Salvando sua nova meta!')),
                  );
                }
              },
              child: const Text('Gravar'),
            ),
          ),
        ],
      ),
    );
  }
}
