import 'package:flutter/material.dart';
import 'package:product/model/base/product_model.dart';
import 'package:product/server/product_server.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic temp = snapshot;
              List<Product> result = List.generate(temp.data.length,
                  (index) => Product.fromMap(temp.data[index]));
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 70),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD6DAE5),
                              shape: OvalBorder(),
                            ),
                            child: Image.asset("images/menu.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, top: 70),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD6DAE5),
                              shape: OvalBorder(),
                            ),
                            child: Image.asset("images/Bag.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.04,
                        letterSpacing: -0.21,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 25),
                    child: Text(
                      'Welcome to Laza.',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          width: 275,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              prefix: Icon(Icons.search_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 16),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Icon(Icons.record_voice_over_outlined),
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFF9775FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                          'Choose Brand',
                          style: TextStyle(
                            color: Color(0xFF1D1E20),
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.06,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(25),
                          child: Text(
                            'View All',
                            style: TextStyle(
                              color: Color(0xFF8F959E),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                          ),
                          child: Container(
                            width: 98,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF0E0101),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Nike',
                                  style: TextStyle(
                                    color: Color(0xFF1D1E20),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0.07,
                                  ),
                                ),
                              ],
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          width: 160,
                          height: 300,
                          child: Column(
                            children: [
                              Container(
                                width: 160,
                                height: 203,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        result[index].thumbnail.toString()),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Text(result[index].description.toString()),
                              Text("\$${result[index].price.toString()}"),
                            ],
                          ),
                        );
                      },
                      itemCount: result.length,
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
