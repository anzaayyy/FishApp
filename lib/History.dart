import 'package:flutter/material.dart';
import 'package:flutter_application_1/Drawer.dart';
import 'package:flutter_application_1/Navbar.dart';

class History extends StatefulWidget {
  final String token;
  const History({required this.token, Key? key}) :super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: sidebar(),
      key: _scaffoldKey,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 23, right: 5, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Navbar(token: widget.token,)));
                    },
                    child: Container(
                      color: Colors.blue, // Latar belakang biru untuk gambar 'PBL'
                      child: Image.asset(
                        'img/PBL.png',
                        width: 60,
                        height: 75,
                      ),
                    ),
                    ),
                    Image.asset('img/Nama.png', width: 70),
                    const Expanded(child: SizedBox(width: 1)),
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openEndDrawer();
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
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 610,
                      margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                  left: 20,
                  right: 20,
                      ),
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
                      child: Column(
                        children: [
                          Text('anjayy')
                        ],
                      ),
                  ),
                ),
              ],
            ),
                    ],
            
            ),
        ],
      ),
      
    );
  }
}