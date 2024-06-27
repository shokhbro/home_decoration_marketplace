import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_decoration_marketplace/views/widgets/carouselslider_widget.dart';
import 'package:home_decoration_marketplace/views/widgets/catalog_container_widget.dart';

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

  void onCatalogTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Have 24 products",
                style: TextStyle(
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sort by",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                        color: Colors.black26,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3 / 3,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -50,
                          left: -18,
                          child: Image.asset(
                            "assets/images/lamp.png",
                            height: 100,
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Table Desk Lamp"),
                        ),
                        const Positioned(
                          top: 74,
                          child: const Text("Lamp"),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("\$142.00"),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
