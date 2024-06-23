import 'package:ecommerce_app/Models/WishlistModel.dart';

import 'package:ecommerce_app/common/CheckoutPage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ViewModelBuilder<WishlistViewModel>.reactive(
        viewModelBuilder: () => WishlistViewModel(),
        builder: (context, model, child) => ListView.builder(
          itemCount: model.wishlistItems.length,
          itemBuilder: (context, index) {
            final item = model.wishlistItems[index];
            return ListTile(
              title: Text(item['title']),
              subtitle: Text('Price: ${item['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
