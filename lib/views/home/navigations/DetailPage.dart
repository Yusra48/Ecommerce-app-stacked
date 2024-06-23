import 'package:ecommerce_app/Models/WishlistModel.dart';
import 'package:ecommerce_app/common/CheckoutPage.dart';
import 'package:ecommerce_app/views/home/navigations/WishlistPage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final double rating;
  final String description;
  final List<String> detailDescriptions;

  DetailPage({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.detailDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WishlistViewModel>.reactive(
      viewModelBuilder: () => WishlistViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 20,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                iconSize: 22,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishlistPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: detailDescriptions.map((desc) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                desc,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Price: $price',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star_half,
                              color: Colors.yellow, size: 20.0),
                          SizedBox(width: 4.0),
                          Text(
                            '$rating',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.blue[700],
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              model.addToWishlist({
                                'image': image,
                                'title': title,
                                'rating': rating,
                                'description': description,
                                'price': price,
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Added to Wishlist'),
                                ),
                              );
                            },
                            child: Text('Add to Wishlist'),
                          ),
                          SizedBox(width: 16.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.green[700],
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutPage(
                                    item: {
                                      'image': image,
                                      'title': title,
                                      'rating': rating,
                                      'description': description,
                                      'price': price,
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Text('Buy Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
