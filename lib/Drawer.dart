import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class sidebar extends StatelessWidget {
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
          padding: EdgeInsets.only(top: 16),
          child: ListTile(
            visualDensity: VisualDensity(horizontal: -4),
            leading: Icon(Icons.logout, size: 35, weight: 5,),
            title: Text('Keluar', style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: "MouseMemoirs")),
            iconColor: Colors.white,
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
          },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: ListTile(
            visualDensity: VisualDensity(horizontal: -4),
            leading: Icon(Icons.people, size: 35, weight: 5,),
            title: Text('Tentang Kami', style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: "MouseMemoirs")),
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