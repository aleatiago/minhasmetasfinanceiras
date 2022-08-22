import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import '../../metas_financeitas/components/formulario_meta_financeira.dart';

class Home extends StatefulWidget {
  static const route = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  bool isDarkMode = true;
  void _pushCreate() {
    Navigator.pushNamed(context, CadastroMetaFinanceira.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xff181818) : const Color(0xffF0F2F5),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.wb_sunny,
          color: Colors.white.withOpacity(isDarkMode ? 0.5 : 1),
        ),
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
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
          final delay = (i * 300);
          return Container(
            decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xff242424) : Colors.white,
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                FadeShimmer.round(
                  size: 60,
                  fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                  millisecondsDelay: delay,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      width: 150,
                      radius: 4,
                      millisecondsDelay: delay,
                      fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    FadeShimmer(
                      height: 8,
                      millisecondsDelay: delay,
                      width: 170,
                      radius: 4,
                      fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: 20,
        separatorBuilder: (_, __) => const SizedBox(
          height: 16,
        ),
      ),
    );
  }
}
