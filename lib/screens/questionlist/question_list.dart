import 'package:flutter/material.dart';

class Product {
  final image;
  final name;

  //final price;

  Product(this.image, this.name);
}

class questionlist extends StatelessWidget {
  List products = [
    Product(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png',
        'Camera canon'),
    Product(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png',
        'Camera canon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      appBar: AppBar(
        title: Text('Question Book'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
              children: products
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: SizedBox(
                        height: 120,
                        child: Center(

                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    offset: Offset(3, 4))
                              ],
                            ),
                            child: ListTile(
                              leading: Image.network(
                                e.image,
                                fit: BoxFit.cover,
                                width: 90,
                                height: 100,
                              ),
                              title: Text(
                                e.name,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
