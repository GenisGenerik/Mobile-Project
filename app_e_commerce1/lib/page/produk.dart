import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  List produk = [
    {'nama': "NIKIE S20 ", 'gambar': 'sepatu.png'  ,'harga':'Rp.120.000' },
    {'nama': 'Polo Polos ', 'gambar': 'baju.png'   ,'harga':'Rp.240.000' },
    {'nama': 'Jeans Cewe', 'gambar': 'celana.png'  ,'harga':'Rp.90.000' },
    {'nama': 'Kaviar 12 Karat', 'gambar': 'jam.png','harga':'Rp.2.250.000' },
    {'nama': 'Topi Outdoor', 'gambar': 'topi.png'  ,'harga':'Rp.100.000' },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 15,
          children: [
            search(),
            Wrap(
                runSpacing: 5,
                children: List.generate(
                  produk.length,
                  (index) {
                    return cardProduk(index);
                  },
                ))
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

  Widget cardProduk(int index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/detailproduk'),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 180, maxHeight: 300),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width,
          child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/images/${produk[index]['gambar']}",
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            IntrinsicHeight(
                              child: Text(produk[index]['nama'],
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  )),
                            ),
                            IntrinsicHeight(
                                child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.yellow,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          size: 10,
                                        ),
                                        Text(
                                          "Populer",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.discount,
                                            size: 10,
                                          ),
                                          Text(
                                            "Top Seller",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.fade,
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            )),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(produk[index]['harga'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 12),maxLines: 1,),
                                  Text(
                                    "10rb+ Terjual",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              )),
        )),
    );
  }
}
