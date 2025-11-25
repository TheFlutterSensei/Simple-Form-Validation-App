import 'package:flutter/material.dart';
import 'package:simple_form_validation/pages/home_page.dart';

void main() {
  runApp(const SimpleFormValidation());
}

class SimpleFormValidation extends StatelessWidget {
  const SimpleFormValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Form Validation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}
