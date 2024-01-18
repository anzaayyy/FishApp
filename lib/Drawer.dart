import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class Sidebar extends StatelessWidget {
  final Key? key;

  Sidebar({this.key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(100, 0, 0, 0),
        width: 232,
      child: ListView(
       children: [
        Padding(
          padding: const EdgeInsets.only(top: 65),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16),
          child: ListTile(
            visualDensity: const VisualDensity(horizontal: -4),
            leading: const Icon(Icons.logout, size: 35, weight: 5,),
            title: const Text('Keluar', style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: "MouseMemoirs")),
            iconColor: Colors.white,
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
          },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: ListTile(
            visualDensity: const VisualDensity(horizontal: -4),
            leading: const Icon(Icons.people, size: 35, weight: 5,),
            title: const Text('Tentang Kami', style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: "MouseMemoirs")),
            iconColor: Colors.white,
            onTap: () {
            print("Tentang Kami");
          },
          ),
        ),
      
       ],
      ),
    );
  }
}