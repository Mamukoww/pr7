import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  Future<void> _addProduct(BuildContext context) {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      Navigator.pop(context, _controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addProduct(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
