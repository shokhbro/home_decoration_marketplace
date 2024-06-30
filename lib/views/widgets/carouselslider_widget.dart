import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_decoration_marketplace/views/screens/category_screen.dart';

class carouselSliderWidget extends StatelessWidget {
  const carouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        autoPlay: true,
      ),
      items: [
        {"title": "Living Room", "image": "assets/images/living_room.png"},
        {"title": "Bedroom", "image": "assets/images/bedroom.png"},
      ].map((item) {
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return CategoryScreen(
                  category: item,
                );
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 280,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                    child: Text(
                      item["title"]!,
                      style: const TextStyle(
                        fontFamily: 'Extrag',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      }).toList(),
    );
  }
}
