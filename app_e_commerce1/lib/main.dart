import 'package:app_e_commerce1/page/cart.dart';


import 'package:app_e_commerce1/util/ukuranlayar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context){
        Ukuranlayar.init(context);
        return Cart();
      }),
    );
  }
}