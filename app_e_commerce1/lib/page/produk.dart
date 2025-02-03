

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
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 15,
          children: [
            search(),
           Wrap(
              runSpacing: 5,    
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
              width: MediaQuery.of(context).size.width/2-10,
              height: MediaQuery.of(context).size.width/1.5,
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
                    crossAxisAlignment: CrossAxisAlignment.start,spacing: 5,
                  children: [
                    Expanded(flex: 2, child: Text("Sepatu Adidasasasdasdsad",maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,))),

                    Expanded(flex: 1, child:Row(
                      children: [
                        Expanded(flex: 1, child: Container( color: Colors.yellow,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.favorite,size: 10,),Text("Populer",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),overflow: TextOverflow.fade,)],
                        ),)),
                        Expanded(flex: 1, child: Container(color: Colors.blue,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.discount,size: 10,),Text("Top Seller",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),overflow: TextOverflow.fade,)],
                        ),)),
                      ],
                    )),
                    Expanded(flex: 2, child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                      Text("Rp.100.000",style: TextStyle(fontWeight: FontWeight.bold)),Text("10rb+ Terjual",style: TextStyle(fontSize: 10),)
                    ],)),
                  ],
                ),)),
                
                  ],
                )
              ),
            );
  }
}
