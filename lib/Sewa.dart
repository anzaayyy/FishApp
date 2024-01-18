import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'package:flutter_application_1/checout.dart';
import 'postData.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Sewa extends StatefulWidget {
  final String token;
  const Sewa({required this.token, Key? key}) :super(key: key);

  @override
  State<Sewa> createState() => _SewaState();
}

class _SewaState extends State<Sewa> {
  late List<Barang> data = [];
  //String endpoint = 'https://api-generator.retool.com/zjbfWy/data';
  String endpoint = 'http://10.0.2.2:8000/api/barangsewa';
  Future<List<Barang>> fetchData() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      Map<String,dynamic> bodys = json.decode(response.body);
      List<dynamic> body = bodys["data"];
      List<Barang> barang =
          body.map((dynamic item) => Barang.fromJson(item)).toList();
      return barang;
    } else {
      throw "Failed to load data";
    }
  }

    @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        data = value;
      });
    });
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
              padding: const EdgeInsets.only(top: 6, left: 22, bottom: 6 ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search"
                      ),
                    ),
                    
                  ),
                  IconButton(onPressed: () {
          
                  },
                   icon: const Icon(Icons.search) ),
                ],
              ),
            ),
            Container(
                  width: 356,
                  height: 630,
                  margin: const EdgeInsets.only(
                  top: 5,
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
                                  Text("Nama Barang ${data[index].nama_barang}", 
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Harga : Rp.${data[index].harga}/jam',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'oswalRegular'
                                    ),
                                  ),
                                  Text('Kondisi : ${data[index].kondisi}',
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
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  // Image.network(
                                  //   'http://10.0.2.2:54322/storage/fotobarang/${data[index].foto_barang}',
                                  //   width: 60,
                                  //   height: 90,
                                  // ),
                                  ElevatedButton(onPressed: (){
                                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Checkout(selectedBarang: data[index], token: widget.token),
      ),
    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(60, 20), // Sesuaikan lebar dan tinggi sesuai kebutuhan Anda
                                  ),
                            child: const Text('Sewa',
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                                ],
                              ),
                            ),
                              //Image.network('${data[index].foto_barang}'),
                        //  Image.network('$endpoint/${data[index].foto_barang.replaceAll(" ", "%20")}', width: 60, height: 80, fit: BoxFit.cover),
                          
                          ],
                        ),
                      Container(height: 3, width: 340,decoration: const BoxDecoration(color: Colors.blue),)
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