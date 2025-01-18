import 'package:flutter/material.dart';
import 'package:slider_with_images/hyper_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF121212),
        body: Center(
          child: SizedBox(
            height: 300,
            child: hyperSlider(
              radius: 8,
              imageUrls: [
                // Put your image urls here // Credits: https://www.flaticon.com and https://www.flaticon.com/authors/vectors-market
                // These images are not the sames as the ones in the pub.dev video

                "https://cdn-icons-png.flaticon.com/128/742/742752.png",
                "https://cdn-icons-png.flaticon.com/512/743/743219.png",
                "https://cdn-icons-png.flaticon.com/128/742/742774.png",
                "https://cdn-icons-png.flaticon.com/512/743/743206.png",
                "https://cdn-icons-png.flaticon.com/512/743/743300.png"
              ],
              imageLabels: ["Confused", "Rolling Eyes", "Neutral", "Happy", "Super Happy"],
              onChanged: (index) {
                print('Selected index: $index');
              },
              localImagesPath: [],
            ),
          ),
        ),
      ),
    );
  }
}
