import 'adj_animate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ANDERSON APP',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'ANDERSON APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const appPrimary = Color(0xAA234567);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimary,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
          child: AJDanimate(
              delay: 1000,
              begin: Offset(-1.0, 0.0),
              child: FlutterLogo(
                size: 200,
              ))),
    );
  }
}
