import 'dart:async';
import 'package:ecommerce_app/views/screens/loginview.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      'Choose Product',
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      'assets/choose.png',
    ),
    OnboardingPageModel(
      'Make your Payment',
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      'assets/make.png',
    ),
    OnboardingPageModel(
      'Get Your Order',
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      'assets/get.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < pages.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPageItem(
            pageModel: pages[index],
            onPageFinished: () {
              _timer?.cancel();
            },
          );
        },
      ),
    );
  }
}

class OnboardingPageItem extends StatelessWidget {
  final OnboardingPageModel pageModel;
  final VoidCallback onPageFinished;

  const OnboardingPageItem({
    required this.pageModel,
    required this.onPageFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pageModel.imagePath,
            height: 300,
            width: 300,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 48.0),
          Text(
            pageModel.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            pageModel.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPageModel(this.title, this.description, this.imagePath);
}
