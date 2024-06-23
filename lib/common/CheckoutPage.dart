import 'package:ecommerce_app/Models/WishlistModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:ecommerce_app/common/ConfirmCheckoutPage.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WishlistViewModel>.reactive(
      viewModelBuilder: () => WishlistViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('216 St Paul\'s Rd, London N1 2LL, UK'),
                      Text('Contact: +44-784232'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
                Divider(),
                Text(
                  'Shopping List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: model.wishlistItems
                      .map((item) => buildShoppingListItem(context, item))
                      .toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Total Amount: \$${model.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Convenience Fee: \$${model.totalConvenienceFee.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmCheckoutPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildShoppingListItem(
      BuildContext context, Map<String, dynamic> item) {
    double price = double.tryParse(item['price'].toString()) ?? 0.0;

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image.network(
              item['image'] ?? '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item['title'] ?? 'No Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(item['description'] ?? 'No Description'),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 5),
                      Text(
                        '${item['rating'] ?? 0.0}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
