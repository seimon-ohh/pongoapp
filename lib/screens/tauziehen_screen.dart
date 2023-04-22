import 'package:flutter/material.dart';
import 'package:pongoapp/widgets/tauziehenfield_widget.dart';

class TauziehenScreen extends StatefulWidget {
  static const routeName = "/tauziehen-screen";
  @override
  State<TauziehenScreen> createState() => _TauziehenScreenState();
}

class _TauziehenScreenState extends State<TauziehenScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cup Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tauziehen'),
        ),
        body: Center(
          child: CupGameWidget(),
        ),
      ),
    );
  }
}
