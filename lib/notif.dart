import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navbar.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
              
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("img/bck.jpg"),
                fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
          children: [
            Container(
              color: Colors.blue, // Latar belakang biru untuk semua elemen
              height: 100, // Tinggi latar belakang biru
              width: MediaQuery.of(context).size.width, // Lebar sesuai dengan lebar layar
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const Navbar()));
                    },
                child: Container(
                      padding: const EdgeInsets.only(top: 30, left: 8),
                      color: Colors.blue, // Latar belakang biru untuk gambar 'PBL'
                      child: Image.asset(
                      'img/PBL.png',
                      width: 60,
                      height: 75,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 44, left: 4),
                    color: Colors.blue, // Latar belakang biru untuk gambar 'Name'
                    child: Row(
                      children: [
                        Image.asset('img/Nama.png', width: 70),
                        const SizedBox(width: 176),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: const Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                      
                    ),
                  ),
                ],
              ),
            ),
            Container(
          width: 356,
          height: 650,
        child : Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                  left: 20,
                  right: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: const Color(0x7f000000),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 7),
                      blurRadius: 3.5,
                    ),
                  ],
                ),
        ), 
        ),
          ],

            ),
        ],
      ),
      
    );
  }
}