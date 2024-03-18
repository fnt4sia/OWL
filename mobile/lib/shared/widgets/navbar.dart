import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onChangeIndex;
  const Navbar(
      {super.key, required this.selectedIndex, required this.onChangeIndex});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.2,
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listNavbar(),
      ),
    );
  }

  List<Widget> listNavbar() {
    return <Widget>[
      navbarItems("Home", 0),
      navbarItems("Course", 1),
      navbarItems("Leaderboard", 2),
      navbarItems("Quiz", 3),
      navbarItems("Profile", 4),
    ];
  }

  Widget navbarItems(String label, int navbarIndex) {
    return InkWell(
      onTap: () {
        widget.onChangeIndex(navbarIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
        ),
        width: MediaQuery.of(context).size.width * 0.17,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              navbarIndex == widget.selectedIndex
                  ? 'assets/nav/${label.toLowerCase()}_active.png'
                  : 'assets/nav/${label.toLowerCase()}.png',
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.width * 0.07,
            ),
            const SizedBox(height: 3),
            FittedBox(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
