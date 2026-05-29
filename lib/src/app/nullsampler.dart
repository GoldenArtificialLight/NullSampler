import 'package:flutter/material.dart';
import 'package:nullsampler/src/app/view/main_view.dart';

class Nullsampler extends StatelessWidget {
  const Nullsampler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
            "/": (_) => MainView()
        },
    );
  }
}