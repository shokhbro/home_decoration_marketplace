import 'package:flutter/material.dart';

class CatalogContainer extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CatalogContainer({
    required this.title,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.green[300] : Colors.transparent,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Extrag',
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black26,
          ),
        ),
      ),
    );
  }
}
