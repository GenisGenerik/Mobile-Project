
import 'package:app_e_commerce1/util/utilitas.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List rekomenSearch = ['Baju', 'Topi', 'Sepatu', 'Celana', 'Jam', 'Kaca Mata'];
  List populerSearch = [
    'Baju Anak',
    'Topi Bagus',
    'Sepatu Nike',
    'Celana Panjang',
    'Jam Tangan',
    'Kaca Mata'
  ];
  List navbttn = [
    {'index': 0, 'gambar': 'shirt.png'},
    {'index': 1, 'gambar': 'jeans.png'},
    {'index': 2, 'gambar': 'shoes.png'},
    {'index': 3, 'gambar': 'watch.png'},
    {'index': 4, 'gambar': 'top-hat.png'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            search(),
            rekomendasi(rekomenSearch),
            judul("Sedang Ramai Di bicarakan"),
            slide(),
            judul("Kategori Pencarian"),
            navbar(),
            judul("Pencarian Populer"),
            rekomendasi(populerSearch)
          ],
        ),
      )),
    );
  }

  Widget judul(String judul) {
    return Text(
      judul,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

  Widget rekomendasi(List list) {
    return SizedBox(
      height: 70,
      child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(
            list.length,
            (index) {
              return IntrinsicWidth(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amberAccent),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Center(
                    child: Text(list[index]),
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget slide() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (index) {
            return ConstrainedBox(constraints: 
            BoxConstraints(
              maxWidth: 300,maxHeight: 170,

            ),child: SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width ,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  "assets/images/dummy.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),);
          },
        ),
      ),
    );
  }

  Widget navbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        navbttn.length,
        (index) {
          return navbutton(navbttn[index]['gambar'], index);
        },
      ),
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
        child: Image.asset('assets/icons/$gambar'),
      ),
    );
  }
}
