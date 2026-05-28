import 'package:flutter/material.dart';
import 'package:visiting_card/ID card/front_page_id_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:IdCardScreen (),
    );
  }
}