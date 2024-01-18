import 'package:flutter/material.dart';
//import 'package:flutter_application_1/Sewa.dart';
import 'postData.dart';
import 'dart:async';
import 'package:http/http.dart' as http;



class Checkout extends StatefulWidget {
  final Barang selectedBarang;
final String token;
  const Checkout({required this.selectedBarang,required this.token, Key? key}) : super(key: key);
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController jumlahsewaController = TextEditingController();
  TextEditingController waktuController = TextEditingController();
  String api ='http://10.0.2.2:8000/api/mulaisewaApi';


  void showResultDialog(bool success) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(success ? 'Success' : 'Error'),
        content: Text(success ? 'Data berhasil ditambahkan' : 'Gagal menambahkan data'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}


Future<void> postDataToServer(String jumlahsewa, String waktu) async {
  try {
    final response = await http.post(
      Uri.parse(api),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
      },
      body: {
        'jumlahsewa': jumlahsewa,
        'waktu': waktu,
        'kode_barang': widget.selectedBarang.kode_barang,
      },
    );

    if (response.statusCode == 200) {
      print('Data berhasil terkirim');
      showResultDialog(true);
    } else {
      print('Gagal mengirim data. Kode status: ${response.statusCode}');
      showResultDialog(false);
      print(response.body);
    }
  } catch (error) {
    print('Error: $error');
  }
}




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Checkout",
            style: TextStyle(color: Colors.white, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 40),
          ),
        ),

        body: Stack(
          children: [
            Container(
              width: 400,
              height: 768,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/bck.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color:const  Color.fromARGB(155, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                          children: [
                            const Text('Detail barang'),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text('Nama Barang: ${widget.selectedBarang.nama_barang}', 
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'oswalRegular'
                                        ),
                                      ),
                                      Text('Kondisi Barang: ${widget.selectedBarang.kondisi}', 
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'oswalRegular'
                                        ),
                                      ),
                                      Text('Harga: Rp.${widget.selectedBarang.harga}/jam',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'oswalRegular'
                                        ),
                                      ),
                                      Text('Nama Pemilik: ${widget.selectedBarang.nama_pemilik}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'oswalRegular'
                                        ),
                                      ),
                                      Text('Lokasi Penyewaan: ${widget.selectedBarang.lokasi}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'oswalRegular'
                                        ),
                                      ),
                                      Text('Nomer Pemilik: ${widget.selectedBarang.nomer_telepon_pemilik}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'oswalRegular'
                                        ),
                                      ),
                                      Text('Jumlah barang tersedia: ${widget.selectedBarang.jumlah}',
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
                                  //Image.network('${data[index].foto_barang}'),
                            //  Image.network('$endpoint/${data[index].foto_barang.replaceAll(" ", "%20")}', width: 60, height: 80, fit: BoxFit.cover),
                              
                              ],
                            ),
                          ],
                                            ),
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10 ,right: 90),
                                child: Text(
                                  'Jumlah Barang Yang Akan Disewa',
                                  style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                    child :TextField(
                                  controller: jumlahsewaController,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                  decoration: InputDecoration(
                                    labelText: 'Masukkan Data',
                                    labelStyle: const TextStyle(fontFamily: 'Times New Roman', fontSize: 16, color: Colors.white),
                                    hintStyle: const TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                  
                                
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 40, top: 15),
                                child: Text('Berapa Jam Kamu Akan Menyewa Barang Ini', style: TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: Colors.white),),
                              ),
                        
                              const SizedBox(height: 15), // Tambah jarak
                              Padding(
                                padding: const EdgeInsets.only(left: 0, right: 5),
                                child: TextField(
                                  controller: waktuController,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                  decoration: InputDecoration(
                                    labelText: 'Masukkan Data',
                                    labelStyle: const TextStyle(fontFamily: 'Times New Roman', fontSize: 16, color: Colors.white),
                                    hintText: 'Masukkan informasi tambahan (opsional)',
                                    hintStyle: const TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ),
                    
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                      
                      child: ElevatedButton(
                        onPressed: () {
                String jumlahSewa = jumlahsewaController.text;
                String waktu = waktuController.text;
                
            
                if (jumlahSewa.isNotEmpty && waktu.isNotEmpty) {
                  // Call the function to post data to the server
                  postDataToServer(jumlahSewa, waktu,);
            
                  // Optionally, you can navigate to another screen or perform other actions here
                } else {
                  // Show an error message or handle the case where fields are empty
                  print('Please fill in all fields');
                }
              },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        child: const Text(
                          'Sewa Sekarang',
                          style: TextStyle(fontFamily: 'Times New Roman', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}