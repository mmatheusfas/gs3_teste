import 'package:flutter/material.dart';
import 'package:gs3_test/features/home/home_view.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 15,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: BottomNavigationBar(
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(color: Colors.indigo),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.shifting,
            elevation: 2,
            currentIndex: currentIndex,
            onTap: changeCurrentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.text_snippet_outlined), label: 'Fatura'),
              BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: 'Cartão'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop'),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeView(),
          Center(child: Text('Fatura')),
          Center(child: Text('Cartão')),
          Center(child: Text('Shop')),
        ],
      ),
    );
  }
}
