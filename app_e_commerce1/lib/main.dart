

import 'package:app_e_commerce1/page/cart.dart';
import 'package:app_e_commerce1/page/detailproduk.dart';
import 'package:app_e_commerce1/page/pembayaran.dart';
import 'package:app_e_commerce1/page/produk.dart';
import 'package:app_e_commerce1/page/search.dart';
import 'package:app_e_commerce1/page/utama.dart';


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
      title: 'Aplikasi Ecommers',
      initialRoute: '/pembayaran',
      
      routes: {
        '/' : (context) => Utama(),
        '/search' :(context) =>Search(),
        '/produk' : (context) =>Produk(),
        '/detailproduk':(context)=>DetailProduk(),
        '/cart':(context)=>Cart(),
        '/pembayaran' : (context)=>Pembayaran(),
   
      },
    
    );
  }
}




