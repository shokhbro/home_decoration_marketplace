import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductInformation extends StatefulWidget {
  final Map product;
  final int index;
  const ProductInformation({
    required this.product,
    required this.index,
    super.key,
  });

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  bool productColor1 = false;
  bool productColor2 = false;
  bool productColor3 = false;

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "Lamp",
            style: TextStyle(
              fontFamily: 'Lato',
            ),
          ),
          const Gap(5),
          Text(
            widget.product['title'],
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 18,
            ),
          ),
          const Gap(10),
          const Text(
            "Price",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: 'Lato',
            ),
          ),
          const Gap(5),
          Text(
            widget.product['price'].toString(), // Ensure price is a string
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.green,
              fontFamily: 'Lato',
              fontSize: 18,
            ),
          ),
          const Gap(10),
          Text(
            "Choose Colors",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.grey[400],
              fontFamily: 'Lato',
            ),
          ),
          const Gap(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    productColor1 = true;
                    productColor2 = false;
                    productColor3 = false;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: productColor1
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    productColor1 = false;
                    productColor2 = true;
                    productColor3 = false;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: productColor2
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    productColor1 = false;
                    productColor2 = false;
                    productColor3 = true;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: productColor3
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
