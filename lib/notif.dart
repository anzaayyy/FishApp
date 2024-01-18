import 'package:flutter/material.dart';
import 'package:flutter_application_1/Drawer.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Notif extends StatefulWidget {
  final String token;
  const Notif({required this.token, Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> data = [];

  void _showPopup(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Detail'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Pemilik: ${data[index]['nama_pemilik']}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'oswalRegular'
              ),
            ),
            Text('Alamat: ${data[index]['alamat']}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'oswalRegular'
              ),
            ),
            Text('Nomer Telepon: ${data[index]['nama_telepon_pemilik']}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'oswalRegular'
              ),
            ),
            Text('Jumlah Sewa: ${data[index]['jumlah_sewa']} barang',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'oswalRegular'
              ),
            ),
            Text('Waktu Sewa: ${data[index]['jumlah_waktu']}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'oswalRegular'
              ),
            ),
            Text('Mulai Sewa: ${data[index]['jam_mulai_sewa']}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Sewa Selesai: ${data[index]['batas_pengembalian']}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Status: ${data[index]['status_pengembalian']}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'oswalRegular'
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  final url = Uri.parse('http://10.0.2.2:8000/api/keranjangApi2');

  try {
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${widget.token}'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // Periksa apakah respons memiliki properti "data"
      if (responseData.containsKey('data')) {
        // Akses properti "data" yang merupakan List
        setState(() {
          data = responseData['data'];
        });
      } else {
        // Tangani respons tanpa properti "data"
        print('Error: Respons tidak memiliki properti "data"');
      }
    } else {
      // Tangani respons error
      print('Gagal mengambil data. Kode status: ${response.statusCode}');
    }
  } catch (e) {
    // Tangani kesalahan jaringan atau lainnya
    print('Error mengambil data: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Sidebar(),
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 5,left: 20, right: 20 ),
                    child: Container(
                        height: 610,
                        //width: double.infinity,
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
                        child : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text('Nama Barang: ${data[index]['nama_barang']}', 
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Nama Pemilik: ${data[index]['nama_pemilik']}', 
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Mulai Sewa: ${data[index]['jam_mulai_sewa']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Sewa Selesai: ${data[index]['batas_pengembalian']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                         // Tambahkan spasi horizontal
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  // Image.network(
                                  //   '${data[index].foto_barang}',
                                  //   width: 60,
                                  //   height: 90,
                                  // ),
                                  
                                ],
                              ),
                            ),
                              //Image.network('${data[index].foto_barang}'),
                        //  Image.network('$endpoint/${data[index].foto_barang.replaceAll(" ", "%20")}', width: 60, height: 80, fit: BoxFit.cover),
                          
                          ],
                        ),
                      Column(
                        children: [
                          Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: ElevatedButton(onPressed: () {
                                          _showPopup(context, index);
                                        },
                                        style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(60, 20), // Sesuaikan lebar dan tinggi sesuai kebutuhan Anda
                                        ),
                                        child: const Text('Detail',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                                                          ),
                                      ),
                                    
                                    ],
                                  ),
                          Container(height: 3, width: 340,decoration: BoxDecoration(color: Colors.blue),),
                        ],
                      )
                      ],
                    );
                  },
                
                ),
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