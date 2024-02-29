import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const OnboardPage1(),
    const OnboardPage2(),
    const OnboardPage3(),
    const OnboardPage4(),
  ];
  double currentPage = 0; // Track the current page for progress indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage !=
                    0) // Show back button on pages other than the first page
                  CupertinoButton(
                    onPressed: () {
                      if (_pageController.page != 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 28,
                      color: Color.fromARGB(255, 0, 51, 255),
                    ),
                  ),
                if (currentPage !=
                    0) // Show skip button on pages other than the first page
                  CupertinoButton(
                    onPressed: () {
                      if (_pageController.page != _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                      child: const Visibility(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 51, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _pages,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page.toDouble();
                  });
                },
              ),
            ),
            //const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (_pageController.page != _pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: SizedBox(
                width:
                    100, // size of the outer container (circular progress indicator)
                height:
                    100, // size of the outer container (circular progress indicator)
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width:
                          70, //  size of the inner container (box decoration)
                      height:
                          70, //  size of the inner container (box decoration)
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 51, 255),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.chevron_right,
                          size: 35, //the size of the arrow icon
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80, // size of the CircularProgressIndicator
                      height: 80, // the size of the CircularProgressIndicator
                      child: CircularProgressIndicator(
                        value: currentPage / (_pages.length - 1),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 0, 89, 255),
                        ),
                        strokeWidth: 3, // strokeWidth
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class OnboardPage1 extends StatelessWidget {
  const OnboardPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Image.asset(
            'assets/images/screen1.jpg',
            width: 300,
          ),
          const SizedBox(height: 50),
          const Text(
            "Get started with Dixi",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardPage2 extends StatelessWidget {
  const OnboardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),

          Image.asset(
            'assets/images/screen2.jpg',
            width: 300,
          ),

          const SizedBox(height: 20),
          const Text(
            "Use as a Second opinion ",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const Text(
            "for better Accuracy",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          // const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class OnboardPage3 extends StatelessWidget {
  const OnboardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 105),

          Image.asset(
            'assets/images/screen3.jpg',
            width: 300,
          ),

          const SizedBox(height: 50),
          const Text(
            "Let the CNN Predict",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const Text(
            "the Dental Problem",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          //const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class OnboardPage4 extends StatelessWidget {
  const OnboardPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 125),

          Image.asset(
            'assets/images/screen4.jpg',
            width: 300,
          ),

          const SizedBox(height: 20),
          const Text(
            "Deep Learning Classification",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const Text(
            "to the image",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          //const SizedBox(height: 55),
        ],
      ),
    );
  }
}
