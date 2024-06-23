import 'package:ecommerce_app/views/home/Categoryitems/Categoryitem.dart';
import 'package:ecommerce_app/views/home/MainScreen.dart';
import 'package:ecommerce_app/views/home/navigations/SearchView.dart';
import 'package:ecommerce_app/views/home/navigations/SettingsPage.dart';
import 'package:ecommerce_app/views/home/navigations/ShoppingPage.dart';
import 'package:ecommerce_app/views/home/navigations/WishlistPage.dart';
import 'package:flutter/material.dart';

late final List<Map<String, dynamic>> wishlistData;

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 300,
            height: 40,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2023/01/27/04/53/muslim-7747745_640.png'),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.mic_none),
                  onPressed: () {},
                ),
                hintText: 'Search any Products',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Featured',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.sort),
                        label: Text('Sort'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          elevation: 0,
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.filter_alt),
                        label: Text('Filter'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                children: [
                  CategoryItem(
                    title: 'Beauty',
                    image:
                        'https://cdn.pixabay.com/photo/2021/01/06/07/52/lipsticks-5893480_1280.jpg',
                  ),
                  SizedBox(width: 16),
                  CategoryItem(
                    title: 'Fashion',
                    image:
                        'https://cdn.pixabay.com/photo/2016/11/29/11/09/woman-1869116_1280.jpg',
                  ),
                  SizedBox(width: 16),
                  CategoryItem(
                    title: 'Kids',
                    image:
                        'https://cdn.pixabay.com/photo/2018/03/18/21/42/lifestyle-3238401_1280.jpg',
                  ),
                  SizedBox(width: 16),
                  CategoryItem(
                    title: 'Mens',
                    image:
                        'https://cdn.pixabay.com/photo/2018/08/20/19/53/coat-3619797_1280.jpg',
                  ),
                  SizedBox(width: 16),
                  CategoryItem(
                    title: 'Womens',
                    image:
                        'https://cdn.pixabay.com/photo/2013/03/27/22/25/dress-shop-97261_1280.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            MainScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, size: 25),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 25),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 25),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 25),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red[600],
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.popUntil(context, (route) => route.isFirst);
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingPage()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchView()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
              break;
          }
        },
      ),
    );
  }
}
