import 'package:flutter/material.dart';
import 'package:flutter_application_1/Beranda.dart';
import 'package:flutter_application_1/History.dart';
import 'package:flutter_application_1/Profil.dart';
import 'package:flutter_application_1/notif.dart';

class Navbar extends StatefulWidget {
  final String token; // Definisikan parameter token

  const Navbar({required this.token, Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Beranda(token: widget.token),
      History(token: widget.token),
      Notif(token: widget.token,),
      Profil(token: widget.token), // Menggunakan token dari Navbar
    ];
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
        bottomNavigationBar: BottomNavigationBar(
          
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue, 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
            
          },
        ),
      
    );
  }
}