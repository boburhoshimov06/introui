import 'package:flutter/material.dart';
import 'package:introui/pages/home_page.dart';
import 'package:introui/utils/texts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static const String id = "intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget makePage({image, title, context}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              SizedBox(height: 30),
              Text(
                context,
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Texts.stepOneTitle,
                context: Texts.stepOneContent,
              ),
              makePage(
                image: "assets/images/image_2.png",
                title: Texts.stepTwoTitle,
                context: Texts.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Texts.stepThreeTitle,
                context: Texts.stepThreeContent,
              ),
            ],
          )
        ],
      ),
    );
  }
}