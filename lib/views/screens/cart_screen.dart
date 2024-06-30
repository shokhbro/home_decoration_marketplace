import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_decoration_marketplace/views/screens/home_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Map> favoriteProducts;
  const CartScreen({
    required this.favoriteProducts,
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void buyProduct() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Text(
                "Payment Successfully!",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const Gap(10),
              const Text(
                "Orders will arrive in 3 days!",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                ),
              ),
              const Gap(80),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const HomeScreen();
                  }));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      "BACK TO HOME",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.favoriteProducts.isEmpty
          ? const Center(
              child: Text("Cart is Empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.favoriteProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                              widget.favoriteProducts[index]['image']),
                          title: Text(widget.favoriteProducts[index]['title']),
                          subtitle:
                              Text(widget.favoriteProducts[index]['subtitle']),
                          trailing:
                              Text(widget.favoriteProducts[index]['price']),
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: buyProduct,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
              ],
            ),
    );
  }
}
