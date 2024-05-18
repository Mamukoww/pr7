import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'product_detail_screen.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  final List<String> products;
  final Function(String) addProduct;
  final Function(int) removeProduct;

  ListViewSeparatedScreen({required this.products, required this.addProduct, required this.removeProduct});

  @override
  _ListViewSeparatedScreenState createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView.separated Screen'),
      ),
      body: ListView.separated(
        itemCount: widget.products.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _navigateToProductDetailScreen(context, widget.products[index]);
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

  void _navigateToProductDetailScreen(BuildContext context, String productName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetailScreen(productName: productName)),
    );
  }
}
