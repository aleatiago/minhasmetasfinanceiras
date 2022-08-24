import 'package:flutter/material.dart';
import 'package:minhasmetasfinanceiras/containers/metas_financeitas/components/formulario_meta_financeira.dart';
import 'package:minhasmetasfinanceiras/containers/metas_financeitas/components/lista_meta_financeira.dart';
import 'containers/home/components/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const ColorScheme _customColorScheme = ColorScheme(
    primary: Color.fromRGBO(54, 115, 45, 45),
    secondary: Color.fromRGBO(242, 207, 102, 95),
    surface: Color.fromRGBO(242, 241, 240, 95),
    background: Color.fromRGBO(242, 241, 240, 95),
    error: Color.fromRGBO(242, 76, 61, 95),
    onPrimary: Color.fromRGBO(242, 241, 240, 95),
    onSecondary: Color.fromRGBO(54, 115, 45, 45),
    onSurface: Color.fromRGBO(54, 115, 45, 45),
    onBackground: Color.fromRGBO(54, 115, 45, 45),
    onError: Colors.white,
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metas Financeiras',
      theme: ThemeData(
        colorScheme: _customColorScheme,
      ),
      routes: {
        Home.route: (BuildContext context) => (const Home()),
        CadastroMetaFinanceira.route: (BuildContext context) =>
            (const CadastroMetaFinanceira()),
        ListaMetasFinanceiras.route: (BuildContext context) =>
            (const ListaMetasFinanceiras())
      },
      home: const ListaMetasFinanceiras(),
    );
  }
}
