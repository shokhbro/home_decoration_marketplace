import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_decoration_marketplace/views/screens/cart_screen.dart';
import 'package:home_decoration_marketplace/views/screens/products_data_screen.dart';
import 'package:home_decoration_marketplace/views/widgets/carouselslider_widget.dart';
import 'package:home_decoration_marketplace/views/widgets/catalog_container_widget.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const CircleAvatar(
            radius: 17,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          const Gap(15),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: DrawerHeader(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/person.png"),
                    ),
                    title: Text("Alex Babkin"),
                    subtitle: Text("+734632378545"),
                  ),
                  const Gap(20),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          const carouselSliderWidget(),
          const Gap(30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: catalogs.asMap().entries.map((entry) {
                int index = entry.key;
                String catalog = entry.value;
                return GestureDetector(
                  onTap: () => onCatalogTap(index),
                  child: CatalogContainer(
                    title: catalog,
                    isSelected: index == selectedIndex,
                  ),
                );
              }).toList(),
            ),
          ),
          const Gap(30),
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
                    return CartScreen(
                      favoriteProducts: favoriteProducts,
                    );
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
