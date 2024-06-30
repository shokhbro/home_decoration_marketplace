import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:home_decoration_marketplace/views/screens/cart_screen.dart';
import 'package:home_decoration_marketplace/views/screens/products_data_screen.dart';

class CategoryScreen extends StatefulWidget {
  final Map<String, String> category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> catalogs = [
    "Popular",
    "New",
    "Best Selling",
    "For you",
  ];

  int selectedIndex = 0;
  List<bool> isFavorite = List.generate(10, (_) => false);

  List<Map> products = [
    {
      "image": "assets/images/lamp.png",
      "title": "Table Desk Lamp",
      "subtitle": "Lamp",
      "price": "\$98.00",
      "rating": "4.2",
    },
    {
      "image": "assets/images/lamp_shades.png",
      "title": "Table Shades Lamp",
      "subtitle": "Lamp",
      "price": "\$143.00",
      "rating": "4.2",
    },
    {
      "image": "assets/images/decorative_plants.png",
      "title": "Decorative Plants",
      "subtitle": "Paint",
      "price": "\$120.00",
      "rating": "4.2",
    },
    {
      "image": "assets/images/painting_berry.png",
      "title": "Painting Berry",
      "subtitle": "Paint",
      "price": "\$56.00",
      "rating": "4.2",
    },
    {
      "image": "assets/images/painting_berry.png",
      "title": "Painting Berry",
      "subtitle": "Paint",
      "price": "\$74.00",
      "rating": "4.2",
    },
    {
      "image": "assets/images/painting_berry.png",
      "title": "Painting Berry",
      "subtitle": "Paint",
      "price": "\$210.00",
      "rating": "4.2",
    },
  ];

  void onCatalogTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  double getImageHeight(int index) {
    if (index == 3) {
      return 100;
    } else if (index == 1) {
      return 130;
    } else if (index == 2) {
      return 110;
    } else if (index == 0) {
      return 145;
    } else if (index == 4) {
      return 100;
    } else if (index == 5) {
      return 100;
    }
    return 140;
  }

  double getPositionTop(int index) {
    if (index == 2) {
      return -60;
    } else if (index == 3) {
      return -50;
    } else if (index == 1) {
      return -70;
    } else if (index == 0) {
      return -70;
    } else if (index == 4) {
      return -50;
    } else if (index == 5) {
      return -50;
    }
    return -60;
  }

  double getPositionLeft(int index) {
    if (index == 2) {
      return -10;
    } else if (index == 3) {
      return -30;
    } else if (index == 1) {
      return -30;
    } else if (index == 4) {
      return -30;
    } else if (index == 5) {
      return -30;
    }
    return -40;
  }

  @override
  Widget build(BuildContext context) {
    int favoriteCount = isFavorite.where((element) => element).length;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        widget.category["image"].toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Center(
                      child: Text(
                        widget.category["title"].toString(),
                        style: const TextStyle(
                          fontFamily: 'Extrag',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Have ${products.length} products",
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 17,
                  ),
                ),
                Container(
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: DropdownButton<String>(
                      alignment: Alignment.bottomRight,
                      value: 'Sort by',
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black45),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      underline: Container(
                        height: 0,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        // Qo'shimcha funksiya qo'shing
                      },
                      items: <String>['Sort by', 'Price', 'Rating', 'Newest']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(
                top: 80,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 15,
                childAspectRatio: 3 / 3,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return ProductsDataScreen(
                        product: products[index],
                        index: index,
                      );
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: getPositionTop(index),
                          left: getPositionLeft(index),
                          child: Image.asset(
                            products[index]['image'],
                            height: getImageHeight(index),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                "(5.0)",
                                style: TextStyle(color: Colors.amber),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(products[index]['title']),
                        ),
                        Positioned(
                          top: 74,
                          child: Text(
                            products[index]['subtitle'],
                            style: const TextStyle(color: Colors.black26),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(products[index]['price']),
                              IconButton(
                                onPressed: () {
                                  isFavorite[index] = !isFavorite[index];
                                  setState(() {});
                                },
                                icon: Icon(
                                  isFavorite[index]
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: isFavorite.contains(true)
          ? badges.Badge(
              position: badges.BadgePosition.topEnd(top: 25, end: 5),
              badgeContent: Text(
                '$favoriteCount',
                style: const TextStyle(color: Colors.white),
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  List<Map> favoriteProducts = [];
                  for (var i = 0; i < products.length; i++) {
                    if (isFavorite[i]) {
                      favoriteProducts.add(products[i]);
                    }
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return CartScreen(favoriteProducts: favoriteProducts);
                  }));
                },
                child: const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          : null,
    );
  }
}
