
import 'package:app_e_commerce1/util/utilitas.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                    spacing: 10,
                    children: List.generate(
                      10,
                      (index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.deepOrange),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 2),
                                  ),
                                  child: Image.asset(
                                      fit: BoxFit.cover, 'images/sepatu.png'),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "NUKIE LAIN NUKITU",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        "Rp.10.000",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Center(
                                              child: Text("10",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)))),
                                      Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(Icons.delete_outline)),
                                    ],
                                  )),
                            ],
                          ),
                        );
                      },
                    )),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: warnaBackground,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      Divider(color: Colors.black,thickness: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "10 Items",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(" Rp.100.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        child: Center(
                          child: Text(
                            "Beli",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
