import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_decoration_marketplace/views/screens/cart_screen.dart';
import 'package:home_decoration_marketplace/views/widgets/product_information.dart';

class ProductsDataScreen extends StatefulWidget {
  final Map product;
  final int index;
  const ProductsDataScreen({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<ProductsDataScreen> createState() => _ProductsDataScreenState();
}

class _ProductsDataScreenState extends State<ProductsDataScreen> {
  bool isFavorite = false;

  double getPositionBottom(int index) {
    if (index == 2) {
      return -0;
    } else if (index == 3) {
      return -10;
    } else if (index == 1) {
      return -20;
    } else if (index == 0) {
      return -70;
    } else if (index == 4) {
      return -10;
    } else if (index == 5) {
      return -10;
    }
    return -60;
  }

  double getPositionTop(int index) {
    if (index == 2) {
      return -0;
    } else if (index == 3) {
      return -0;
    } else if (index == 1) {
      return -30;
    } else if (index == 0) {
      return -30;
    } else if (index == 4) {
      return -0;
    } else if (index == 5) {
      return -0;
    }
    return -60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black26,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black26,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.grey[50],
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  top: getPositionTop(widget.index),
                  bottom: getPositionBottom(widget.index),
                  child: Image.asset(
                    widget.product['image'],
                    width: 200,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 210,
                  top: 20,
                  right: 10,
                  bottom: 10,
                  child: ProductInformation(
                    product: widget.product,
                    index: widget.index,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Gap(10),
                    Text(
                      "5.0",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "124 reviews >",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  widget.product['title'],
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum has been industry's standart dummy text ever since the 1500s, when an unknown printer took a galery of type and scrambled it to make a type specimen book.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          const Gap(90),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black12,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return CartScreen(favoriteProducts: [widget.product]);
                    }));
                  },
                  child: Container(
                    width: 230,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
