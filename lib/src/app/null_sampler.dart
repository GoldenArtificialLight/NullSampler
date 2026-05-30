import 'package:flutter/material.dart';
import 'package:nullsampler/src/app/view/main_view.dart';

class NullSampler extends StatelessWidget {
  const NullSampler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"/": (_) => MainView()},
    );
  }
}
