import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;

  ProductDetailScreen({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product Name:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              productName,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Expiry Date:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '2024-12-31', // Ваша дата срока годности
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Price:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '\$10.00', // Ваша цена продукта
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
