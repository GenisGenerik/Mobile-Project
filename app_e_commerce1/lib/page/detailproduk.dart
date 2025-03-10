import 'package:app_e_commerce1/page/cart.dart';

import 'package:app_e_commerce1/util/utilitas.dart';
import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  const DetailProduk({super.key});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
 List ukuranProduk = ['S', 'M', 'L', 'XL', 'XXL'];
  List warnaProduk = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.amber,
    Colors.green,
    Colors.black,
  ];

  List produk = [
    "assets/images/sepatu.png",
    "assets/images/sepatu.png",
    "assets/images/sepatu.png",
    "assets/images/sepatu.png",
    "assets/images/sepatu.png",
    "assets/images/sepatu.png",
  ];

  int produkSelected = 0;
  int sizeSelected = -1;
  int colorSelected = -1;
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [appbar(), tampilProduk(), deskripsi()],
            ),
          ),

          
          Positioned(
            bottom: 20, 
            right: 20, 
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: warnaBackground,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return Cart();
                 },));
                },
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appbar() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 35),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/ 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:GestureDetector(
              onTap: () {
              Navigator.pop(context);
              },child:  Container(
              width: MediaQuery.of(context).size.width / 9,
              height: MediaQuery.of(context).size.width / 9,
              decoration: BoxDecoration(
                  color: warnaBackground,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 30,
              ),
            ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                child: Container(
                    width: MediaQuery.of(context).size.width / 9,
                    height: MediaQuery.of(context).size.width / 9,
                    decoration: BoxDecoration(
                        color: warnaBackground,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            like = !like;
                          });
                        },
                        icon: Icon(
                          like
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 30,
                          color: like ? Colors.red : Colors.black,
                        )))),
          ),
        ],
      ),
    );
  }

  Widget tampilProduk() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: MediaQuery.of(context).size.height / 4,
            child: Image.asset(
              "assets/images/sepatu.png",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 15,
              children: List.generate(produk.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      produkSelected = index;
                    });
                  },
                  child: Container(
                    width: produkSelected == index ? 80 : 60,
                    height: produkSelected == index ? 80 : 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      produk[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget deskripsi() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            ConstrainedBox(constraints: BoxConstraints(
              maxWidth:  MediaQuery.of(context).size.width,
              maxHeight: 70
            ),child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Nama Produk ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rp.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '200K',
                          style: TextStyle(fontSize: 27),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Available Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(ukuranProduk.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              sizeSelected = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: sizeSelected == index
                                    ? warnaBackground
                                    : Colors.white),
                            child: Text(
                              ukuranProduk[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Color",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(warnaProduk.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              colorSelected = index;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: warnaProduk[index]),
                            child: colorSelected == index
                                ? Icon(
                                    Icons.done,
                                  )
                                : null,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}