import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {

  List metode = [
    {'title' : 'Credit/Debit','gambar':['images/dummy.jpg','images/dummy2.jpg','images/dummy3.jpg','images/dummy4.jpg']},
    {'title' : 'ATM/Bank Transfer','gambar':['images/dummy2.jpg','images/dummy3.jpg']},
    {'title' : 'E-Money','gambar':['images/dummy.jpg','images/dummy4.jpg','images/dummy2.jpg']},
    {'title' : 'Direct Debit','gambar':['images/dummy3.jpg','images/dummy4.jpg','images/dummy.jpg']},
    {'title' : 'Over The Counter','gambar':['images/dummy2.jpg','images/dummy4.jpg',]},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 5),child: Column(
        children:List.generate(metode.length, (index) {
          return SizedBox(width: MediaQuery.of(context).size.width, height: 100,child: Card( shadowColor: Colors.black,elevation: 5 ,clipBehavior: Clip.antiAlias, child: Row(

            
            children: [
              Expanded(flex: 1, child: Container(padding: EdgeInsets.symmetric(horizontal: 15),child:  Text(metode[index]['title'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),)),
              Expanded(flex: 1, child: Container(padding: EdgeInsets.symmetric(horizontal: 15),child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 5,
                children:List.generate(metode[index]['gambar'].length, (index2) {
                  return    SizedBox(width: 30,height: 30,child: Image.asset(metode[index]['gambar'][index2
                  ],fit: BoxFit.cover,),);
                },)
              )),)),
            ]
          ),),);
        },)
      ),)
    );
  }
}