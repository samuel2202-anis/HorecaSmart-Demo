import 'package:flutter/material.dart';
import '../DiscountsScreen/discounts_screen.dart';
import '../MenuScreen/menu_screen.dart';
import '../MyCartScreen/cart_screen.dart';
import 'home_screen.dart';

 class BottomNavBar extends StatefulWidget {


  const BottomNavBar({super.key});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late List<Widget> _screens; 

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onNavigate: _onItemTapped),
      const DiscountsScreen(),
      const MyCartScreen(),
      const MenuScreen(),
    ]; 
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Discounts',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My Cart',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}