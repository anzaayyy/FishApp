import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'Drawer.dart';
import 'EditProfil.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Profil extends StatefulWidget {
  final String token;

  const Profil({required this.token, Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil>{
  //int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late Map<String, dynamic> detailPengguna = {};


  @override
  void initState() {
    super.initState();
    detailPengguna = {};
    ambilDetailPengguna();
  }

    Future<void> ambilDetailPengguna() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/user');

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${widget.token}'},
      );

      if (response.statusCode == 200) {
        // Berhasil mengambil detail pengguna
        setState(() {
          detailPengguna = jsonDecode(response.body);
        });
      } else {
        // Tangani respons error
        print('Gagal mengambil detail pengguna. Kode status: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani kesalahan jaringan atau lainnya
      print('Error mengambil detail pengguna: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        endDrawer: Sidebar(),
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
                    Padding(  //Nama User
                      padding: const EdgeInsets.only(top: 15, left: 6, bottom: 15),
                      child: Text("${detailPengguna['name']}", style: const TextStyle(fontFamily: "TimesNewRoman", fontSize: 32, fontWeight: FontWeight.bold)),
                    ),

                    Padding(  //Button Edit Profil
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                            onPressed: ()async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfil(token: widget.token),
      ),
    );
    // Setelah kembali dari halaman EditProfil, perbarui detail pengguna
    await ambilDetailPengguna();
  },
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
                                  const Padding(
                                    padding: EdgeInsets.only(right: 30, top: 15, bottom: 10),
                                    child: Icon(Icons.location_on, size: 40,color: Colors.white,),
                                  ),
                                  Text("${detailPengguna['alamat'] ?? 'Data belum diisi'}", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Row(   //Nomer Telepon
                                children: [
                                  const Padding(  
                                    padding: EdgeInsets.only(right: 30, top: 15, bottom: 10),
                                    child: Icon(Icons.phone, size: 40,color: Colors.white,),
                                  ),
                                  Text("${detailPengguna['nomer_telepon']??"Data belum diisi"}",style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(  //Alamat Email
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 30, top: 15, bottom: 10),
                                    child: Icon(Icons.email, size: 40,color: Colors.white,),
                                  ),
                                  Text("${detailPengguna['email']}", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "TimesNewRoman", fontWeight: FontWeight.bold),)
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