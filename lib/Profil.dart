import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'Drawer.dart';
import 'EditProfil.dart';


class Profil extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: notif(),
    );
  }
}

class notif extends StatefulWidget{
const notif({Key, key});

@override
State<notif> createState() =>_notifState();
}

class _notifState extends State<notif>{
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        endDrawer: sidebar(),
        key: _scaffoldKey,
        body: Stack(
          children: [
            Container( //BackGround
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("img/bck.jpg"),
                fit: BoxFit.cover
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Navbar()));
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
                Padding( 
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar( //Foto Profil
                      radius: 60,
                      child : Icon(Icons.person, size: 100,),
                    ),
                    const Padding(  //Nama User
                      padding: EdgeInsets.only(top: 15, left: 6, bottom: 15),
                      child: Text("Tama", style: TextStyle(fontFamily: "TimesNewRoman", fontSize: 32, fontWeight: FontWeight.bold)),
                    ),

                    Padding(  //Button Edit Profil
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfil()));}, 
                            icon: const Icon(Icons.edit), 
                            label: const Text('Edit Profil')))
                        ],
                      ),
                    ),
                    Padding(  //Garis
                      padding: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('Detail', style: TextStyle(fontFamily: "TimesNewRoman", fontSize: 20)),
                    Row(  
                      children: [
                        Expanded(
                          child: Container( //Back Detail
                            height: 220,
                            decoration: BoxDecoration(
                            color: Color.fromARGB(155, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          child : Padding(
                            padding: const EdgeInsets.only(left: 15,top: 5),
                            child: Column(  //Informasi User
                              children: [
                              Row(   //Lokasi
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30, top: 15, bottom: 10),
                                    child: Icon(Icons.location_on, size: 40,color: Colors.white,),
                                  ),
                                  Text("Muncar, Banyuwangi", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Row(   //Nomer Telepon
                                children: [
                                  Padding(  
                                    padding: const EdgeInsets.only(right: 30, top: 15, bottom: 10),
                                    child: Icon(Icons.phone, size: 40,color: Colors.white,),
                                  ),
                                  Text("085237359332",style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(  //Alamat Email
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30, top: 15, bottom: 10),
                                    child: Icon(Icons.email, size: 40,color: Colors.white,),
                                  ),
                                  Text("argentu10@gmail.com", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold),)
                                ],
                              ),
                              ],
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ],
            ),

            
          ],
          
        ),
      ),
    );
  }
}