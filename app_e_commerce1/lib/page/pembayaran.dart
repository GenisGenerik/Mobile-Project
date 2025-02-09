import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  List metode = [
    {
      'title': 'Credit/Debit',
      'gambar': [
        'assets/images/dummy.jpg',
        'assets/images/dummy2.jpg',
        'assets/images/dummy3.jpg',
        'assets/images/dummy4.jpg'
      ]
    },
    {
      'title': 'ATM/Bank Transfer',
      'gambar': ['assets/images/dummy2.jpg', 'assets/images/dummy3.jpg']
    },
    {
      'title': 'E-Money',
      'gambar': [
        'assets/images/dummy.jpg',
        'assets/images/dummy4.jpg',
        'assets/images/dummy2.jpg'
      ]
    },
    {
      'title': 'Direct Debit',
      'gambar': [
        'assets/images/dummy3.jpg',
        'assets/images/dummy4.jpg',
        'assets/images/dummy.jpg'
      ]
    },
    {
      'title': 'Over The Counter',
      'gambar': [
        'assets/images/dummy2.jpg',
        'assets/images/dummy4.jpg',
      ]
    },
  ];

  List kota = ['bogor', 'bandung', 'jakarta', 'serang', 'surabaya'];
  int? isi;
  int? posisiexpand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Metode Pembayaran")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow),
                child: Column(
                  spacing: 10,
                  children: [
                    Text("Total Bayar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        )),
                    Text(" Rp.10.000.000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        )),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card Number",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        TextField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              hintText: "1111 2222 3333 4444",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expiry Date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                TextField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                      hintText: 'MM/YY',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Security code",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                TextField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                      hintText: 'CVC',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Postal code",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                TextField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Country",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 55,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton(
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      value: isi,
                                      hint: Text('Country'),
                                      items: List.generate(
                                        kota.length,
                                        (index) => DropdownMenuItem(
                                          value: index + 1,
                                          child: Text(kota[index]),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          isi = value;
                                        });
                                      }),
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Column(
                children: List.generate(metode.length, (index) {
                  bool expand = posisiexpand == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        posisiexpand = index;
                      });
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  metode[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(expand
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                              ],
                            ),
                            if (expand)
                              GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: metode[index]['gambar'].length,
                                itemBuilder: (context, i) {
                                  return Image.asset(
                                    metode[index]['gambar'][i],
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
