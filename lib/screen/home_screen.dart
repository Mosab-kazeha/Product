import 'package:flutter/material.dart';
import 'package:product/screen/animation_screen.dart';
import 'package:product/screen/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimationScreen(),
                  ),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                child: Center(child: Text('animation screen')),
                decoration: ShapeDecoration(
                  color: Color(0xFF9775FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(),
                  ),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                child: Center(child: Text('product screen')),
                decoration: ShapeDecoration(
                  color: Color(0xFF9775FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
