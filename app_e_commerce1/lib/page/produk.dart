
import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 15,
          children: [
            search(),
           Wrap(
              runSpacing: 15,
              spacing: 15,
              
              children: List.generate(10, (index) {
                return cardProduk();
              },)
            )
          ],
        ),
      )),
    );
  }

  Widget search() {
    return TextField(
      controller: SearchController(),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: "Search"),
    );
  }

  Widget cardProduk() {
    return SizedBox(
              height: 220,
              width: 170,
              child: Card(
                
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child:Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded ( flex : 3,child: Image.asset(
                  "images/dummy.jpg",
                  fit: BoxFit.cover,
                ),),
                Expanded(flex: 2,child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: Text("data")),
                    Expanded(flex: 1, child: Text("data")),
                    Expanded(flex: 1, child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("data"),Text("data")
                    ],)),
                  ],
                ),)),
                
                  ],
                )
              ),
            );
  }
}
