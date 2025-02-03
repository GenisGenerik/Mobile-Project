

import 'package:app_e_commerce1/page/cart.dart';
import 'package:app_e_commerce1/page/detailproduk.dart';
import 'package:app_e_commerce1/page/produk.dart';
import 'package:app_e_commerce1/page/search.dart';

import 'package:app_e_commerce1/util/utilitas.dart';
import 'package:flutter/material.dart';

class Utama extends StatefulWidget {
  const Utama({super.key});

  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {






  PageController slidepage = PageController();
  Future page() {
    return Future.delayed(
      Duration(seconds: 5),
      () {
        setState(() {
          if (posisi == slide.length - 1) {
            posisi = 0;
            slidepage.animateToPage(posisi,
                duration: Duration(seconds: 3), curve: Easing.linear);
          } else {
            posisi = posisi + 1;
            slidepage.animateToPage(posisi,
                duration: Duration(seconds: 1), curve: Easing.linear);
          }
        });

        page();
      },
    );
  }

  List<Map> slide = [
    {'index': 0, 'gambar': 'images/contoh.jpg'},
    {'index': 1, 'gambar': 'images/contoh.jpg'},
    {'index': 2, 'gambar': 'images/contoh.jpg'},
  ];

  List navbttn = [
    {'index': 0, 'gambar': 'shirt.png'},
    {'index': 1, 'gambar': 'jeans.png'},
    {'index': 2, 'gambar': 'shoes.png'},
    {'index': 3, 'gambar': 'watch.png'},
    {'index': 4, 'gambar': 'top-hat.png'}
  ];

  List navBttomBttn = [
    {'index': 0, 'icon': Icons.home_outlined,'page':Utama()},
    {'index': 1, 'icon': Icons.search_outlined,'page':Search()},
    {'index': 2, 'icon': Icons.shopping_bag_outlined,'page':Cart()},
    {'index': 3, 'icon': Icons.favorite_outline_outlined,'page':Utama()},
    {'index': 4, 'icon': Icons.line_style_outlined,'page':Utama()},
  ];

  List produk = [
    {'index': 0, 'gambar': 'sepatu.png'},
    {'index': 1, 'gambar': 'baju.png'},
    {'index': 2, 'gambar': 'celana.png'},
    {'index': 3, 'gambar': 'jam.png'},
    {'index': 4, 'gambar': 'topi.png'},
  ];

  int posisi = 0;
  List produksuka = [];
  List produkcart = [];
  int navBotBttmPosisition = 0;

  @override
  void initState() {
    super.initState();
    page();
    navBotBttmPosisition = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              appbar(),
              slideGambar(),
              navbar(),
              body(),
            ],
          )),
      bottomNavigationBar: bottomNavbar(),
    );
  }

  Widget appbar() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 35),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 14,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search();
                },));
              },
              child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.width / 9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(0, 1))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  const Text("Data"),
                ],
              ),
            ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 9,
                height: MediaQuery.of(context).size.width / 9,
                child: ClipOval(
                  child: Image.asset(
                    "images/dummy.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slideGambar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(150, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                PageView.builder(
                  controller: slidepage,
                  itemCount: slide.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      slide[index]['gambar'],
                      fit: BoxFit.cover,
                    );
                  },
                  onPageChanged: (value) => setState(() {
                    posisi = value;
                  }),
                ),
                Align(
                  alignment: Alignment(0, 0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(slide.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: posisi == index ? Colors.black : Colors.blue,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navbar() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Produk();
        },));

      },child:Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            navbttn.length,
            (index) {
              return navbutton(navbttn[index]['gambar'], index);
            },
          )),
    ) ,
    );
  }

  Widget navbutton(String gambar, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 7,
      height: MediaQuery.of(context).size.width / 7,
      decoration: BoxDecoration(
        color: warnaBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Image.asset('icons/$gambar'),
      ),
    );
  }

  Widget body() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height / 1.2,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most Populer",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  spacing: 20,
                  children: List.generate(
                    produk.length,
                    (index) {
                      return produkCard(produk[index]['gambar'], index);
                    },
                  )),
            ),
            Text(
              "Rating Tertinggi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: List.generate(
                  produk.length,
                  (index) {
                    return produkCard(produk[index]['gambar'], index);
                  },
                ),
              ),
            )
          ],
        ));
  }

  Widget produkCard(String gambar, int index) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailProduk();
        },));
      },
      child: Container(
        width: 160,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 7,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (produksuka.any(
                            (element) => element == index,
                          )) {
                            produksuka.remove(index);
                          } else {
                            produksuka.add(index);
                          }
                        });
                      },
                      icon: Icon(
                        produksuka.any(
                          (element) => element == index,
                        )
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 25,
                        color: produksuka.any(
                          (element) => element == index,
                        )
                            ? warnaBackground
                            : Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (produkcart.any(
                            (element) => element == index,
                          )) {
                            produkcart.remove(index);
                          } else {
                            produkcart.add(index);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: 25,
                        color: produkcart.any(
                          (element) => element == index,
                        )
                            ? warnaBackground
                            : Colors.black,
                      )),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    'images/$gambar',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                  child: Text(
                "Nike Air Jordan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )),
              Center(
                child: Text(
                  "Rp.10000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            ],
          ),
        )),
    );
  }

  Widget bottomNavbar() {
    return BottomAppBar(
      height: 60,
      color: warnaBackground,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            navBttomBttn.length,
            (index) {
              return bottomNavbutton(navBttomBttn[index]['icon'], index);
            },
          )),
    );
  }

  Widget bottomNavbutton(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          navBotBttmPosisition = index;
          
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
              return navBttomBttn[index]['page'] ;
            },)).then((_){
              setState(() {
                navBotBttmPosisition=0;
              });
            });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 6,
        height: MediaQuery.of(context).size.width / 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: navBotBttmPosisition == index ? Colors.blue : warnaBackground,
        ),
        child: Icon(icon, size: 30),
      ),
    );
  }
}
