import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text('Sign Up')],
      ),
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('Currency \n Calculator'),
          Drawer(),
        ],
      ),
    );
  }
}
