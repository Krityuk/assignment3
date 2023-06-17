import 'package:flutter/material.dart';

import 'page1.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        //
        bottomNavigationBar: Stack(
          children: [
            BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_rounded),
                  label: 'Learn',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.hub),
                  label: 'Hub',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle_outlined),
                  label: 'Profile',
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width * 0.2 * _currentIndex,
              child: Container(
                height: 2.0,
                width: MediaQuery.of(context).size.width * 0.2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
