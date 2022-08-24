import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/meta_financeira.dart';
import 'formulario_meta_financeira.dart';

class ListaMetasFinanceiras extends StatefulWidget {
  static const route = "/lista-meta-financeira";
  const ListaMetasFinanceiras({Key? key}) : super(key: key);

  @override
  State<ListaMetasFinanceiras> createState() => _ListaMetasFinanceirasState();
}

class _ListaMetasFinanceirasState extends State<ListaMetasFinanceiras> {
  bool isDarkMode = false;
  final _metas = <MetaFinanceira>[];

  final numberFormat = NumberFormat("#.##0,00", "pt_BR");
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    void _pushCreate() {
      Navigator.pushNamed(context, CadastroMetaFinanceira.route);
    }

    /*Logica para buscar as metas financeiras*/
    _metas.add(MetaFinanceira(
        id: 1,
        descricao: 'Investimentos para a chave do apartamento',
        nome: 'Chave da Casa',
        prazo: DateTime(2025, 6, 1),
        valorMeta: 15000.85));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Minhas Metas Financeiras'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _pushCreate,
              tooltip: 'cadastre suas metas',
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (_, i) {
            return Container(
              decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xff242424) : Colors.white,
                  borderRadius: BorderRadius.circular(0)),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      icon(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      name(_metas[i].nome.toString()),
                                      const Spacer(),
                                      percentual("0%"),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  // Row(
                                  //   children: <Widget>[
                                  //     detalhes(_metas[i].descricao.toString())
                                  //   ],
                                  // ),
                                  Row(
                                    children: <Widget>[
                                      valores(_metas[i].valorMeta, 0)
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            );
          },
          itemCount: _metas.length,
          separatorBuilder: (_, __) => const SizedBox(
            height: 16,
          ),
        ));
  }

  Widget icon() {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.key,
            color: Color.fromRGBO(54, 115, 45, 45),
            size: 32,
          )),
    );
  }

  Widget name(String name) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: name,
          style: const TextStyle(
              color: Color.fromRGBO(43, 67, 43, 26), fontSize: 20),
        ),
      ),
    );
  }

  Widget detalhes(String name) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: "Descrição: $name",
              style: const TextStyle(
                  color: Color.fromRGBO(43, 67, 43, 26), fontSize: 12),
            ),
          ),
        ));
  }

  Widget percentual(String percentual) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: percentual,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(54, 115, 45, 45),
              fontSize: 20),
        ),
      ),
    );
  }

  Widget valores(double meta, double valorAtual) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'R\$ ${numberFormat.format(valorAtual)}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\nR\$ ${numberFormat.format(meta)}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
