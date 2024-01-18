import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Keranjang extends StatefulWidget {
  final String token;
  const Keranjang({required this.token, Key? key}) :super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _launchWhatsApp() async {
  final phone = data[0]['nama_telepon_pemilik'];
  String message = 'Hello, this is a test message!';

  final whatsappUrl = 'https://api.whatsapp.com/send/?phone=$phone&text=$message';

  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    print('Could not launch $whatsappUrl');
  }
}

  Future<void> fetchData() async {
  final url = Uri.parse('http://10.0.2.2:8000/api/keranjangApi');

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
      
      body: Stack(
      children: [
        Container(
            
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("img/bck.jpg"),
              fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Navbar(token: widget.token,)));
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
                    padding: const EdgeInsets.only(top: 52, left: 4),
                    color: Colors.blue, // Latar belakang biru untuk gambar 'Name'
                    child: Row(
                      children: [
                        Image.asset('img/Nama.png', width: 70),
                        const SizedBox(width: 176),
                        
                      ],
                      
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
                  width: 356,
                  height: 630,
                  margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                  left: 20,
                  right: 20,
                ),
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
                                  Text('Nama pemilik: ${data[index]['nama_pemilik']}', 
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Nomer Telepon: ${data[index]['nama_telepon_pemilik']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Jumlah Sewa: ${data[index]['jumlah_sewa']} barang',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Waktu Sewa: ${data[index]['jumlah_waktu']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Total Harga: Rp.${data[index]['total_harga']}',
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
                            const SizedBox(width: 16),
                         // Tambahkan spasi horizontal
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 10),
                            //   child: Column(
                            //     children: [
                            //       // Image.network(
                            //       //   '${data[index].foto_barang}',
                            //       //   width: 60,
                            //       //   height: 90,
                            //       // ),
                                  
                            //     ],
                            //   ),
                            // ),
                              //Image.network('${data[index].foto_barang}'),
                        //  Image.network('$endpoint/${data[index].foto_barang.replaceAll(" ", "%20")}', width: 60, height: 80, fit: BoxFit.cover),
                          
                          ],
                        ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Row(
                                      children: [
                                        ElevatedButton(onPressed: (){},
                                        style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(60, 20),
                                        backgroundColor: const Color.fromARGB(255, 252, 43, 28)
                                        ),
                                        child: const Text('Cancel',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                      const SizedBox(width: 20,),
                                      ElevatedButton(onPressed: (){
                                        ElevatedButton(
                                          onPressed: () {
                                            _launchWhatsApp();
                                          },
                                          child: const Text('Open WhatsApp'),
                                        );
                                      },
                                        style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(60, 20), // Sesuaikan lebar dan tinggi sesuai kebutuhan Anda
                                        ),
                                        child: const Text('Hubungi pemilik',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                      ],
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(height: 3, width: 340,decoration: const BoxDecoration(color: Colors.blue),),
                          ),
                        ],
                      )
                      ],
                    );
                  },
                
                ), 
                ),
                  ],
          
            ),
          ),
      ],
      ),
    );
  }
}