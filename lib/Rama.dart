import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future register(
    String name,
    String email,
    String alamat,
    String notelepon,
    String password,
    String confirm_password,
    
    ) async {
    final String registerUrl = '$baseUrl/register';

    final response = await http.post(
      Uri.parse(registerUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'alamat' : alamat,
        'notelepon' : notelepon,
        'password': password,
        'confirm_password' : confirm_password,
      }),
    );

    if (response.statusCode == 200) {
      // Registrasi berhasil
      print('Registrasi berhasil');
      print(response.body);
    } else {
      // Registrasi gagal
      print('Registrasi gagal');
      print(response.body);
      throw Exception('Gagal melakukan registrasi');
    }
  }
}

class Rama extends StatefulWidget {
  const Rama({super.key});

  @override
  State<Rama> createState() => _Rama();

}

class _Rama extends State<Rama> {
  bool obscure = true;
  final ApiService apiService = ApiService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController noteleponController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  void _register() async {
  try {
    // Validasi input sebelum melakukan registrasi
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        alamatController.text.isEmpty ||
        noteleponController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      throw Exception('Harap isi semua bidang.');
    }

    // Validasi kata sandi dan konfirmasi kata sandi
    if (passwordController.text != confirmController.text) {
      throw Exception('Konfirmasi kata sandi tidak sesuai, mohon isi kembali.');
    }

    await apiService.register(
      nameController.text,
      emailController.text,
      alamatController.text,
      noteleponController.text,
      passwordController.text,
      confirmController.text
    );

    // Navigasi ke layar login hanya jika registrasi berhasil
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  } catch (e) {
    // Tangani kesalahan dan beri umpan balik visual
    print('Error: $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registrasi Gagal'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    // Tidak melakukan navigasi ke layar login pada kesalahan registrasi
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                
                Padding(
                  
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset('img/PBL.png', width: 100.0,),
                ),
              
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      controller: alamatController,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      controller: noteleponController,
                      decoration: const InputDecoration(
                        labelText: 'Nomor Telepon',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      obscureText: obscure,
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscure=!obscure;
                          });
                        },
                        child: Icon(obscure?Icons.visibility:Icons.visibility_off),
                      ),
                        labelText: 'Password',
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      obscureText: obscure,
                      controller: confirmController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.only(top:50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Mengatur jarak antar tombol
                  children: [
                  // Button Back
                  ElevatedButton(
                    onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context)=>const Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(165, 50),
                      backgroundColor: Colors.white
                    ),
                    child: const Text('Kembali',
                    style:TextStyle(
                      color: Colors.blue,
                    ),
                    ),
                  ),
                  // Button Next
                  ElevatedButton(
                    onPressed: () {
                      _register();
                      //Navigator.pop(context, MaterialPageRoute(builder: (context)=>const Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(165, 50), // Mengatur ukuran minimum tombol
                    ),
                    child: const Text('Lanjutkan'),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
              ],
            ),
          ),
        ),
    );
  }
}

