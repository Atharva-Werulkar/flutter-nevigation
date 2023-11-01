import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(const MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController();

  final List<Color> _bgColors = [
    Colors.blueAccent,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: _bgColors[_page],
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
            _pageController.animateToPage(
              _page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        letIndexChange: (index) => true,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          buildPage("Page 1", Colors.blue),
          buildPage("Page 2", Colors.red),
          buildPage("Page 3", Colors.green),
          buildPage("Page 4", Colors.orange),
          buildPage("Page 5", Colors.purple),
        ],
        onPageChanged: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }

  Widget buildPage(String text, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          textScaleFactor: 2.0,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
