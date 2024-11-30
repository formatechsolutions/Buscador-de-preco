import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      body: Center(child: const Text('Dashboard')),
    );
  }
}
