import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'product_detail_screen.dart';

class ListViewScreen extends StatefulWidget {
  final List<String> products;
  final Function(String) addProduct;
  final Function(int) removeProduct;

  ListViewScreen({required this.products, required this.addProduct, required this.removeProduct});

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Screen'),
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen(productName: widget.products[index])),
              );
            },
            child: ListTile(
              title: Text(widget.products[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await _removeProduct(index);
                  setState(() {});
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddProductScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _removeProduct(int index) async {
    widget.removeProduct(index);
  }

  void _navigateToAddProductScreen(BuildContext context) async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );
    if (newProduct != null) {
      widget.addProduct(newProduct);
    }
  }
}
