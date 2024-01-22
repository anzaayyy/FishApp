import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'package:flutter_application_1/Rama.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class User {
  final String email;
  final String password;

  User(this.email, this.password);
}
Future<String?> loginUser(User user) async {
  final url = Uri.parse('http://10.0.2.2:8000/api/login');
  
  try {
    final response = await http.post(
      url,
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData != null && responseData['succes'] != null) {
        bool success = responseData['succes'];
        
        if (success) {
          print('Login berhasil: ${response.body}');
          String? token = responseData['data']['token']; // Assuming the token is a string
          return token; // Return the token upon successful login
        } else {
          print('Login gagal. Pesan: ${responseData['masage']}');
        }
      } else {
        print('Response data tidak valid.');
      }
    } else {
      print('Gagal login. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return null; // Return null if there is an error or the value is not valid
}





class _Login extends State<Login> {
  bool isChecked2 = false;
  bool obscure =true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
            children: [
              // logo
              Padding(
                
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset('img/PBL.png', width: 180.0,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // sign up
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
                  // deskripsion
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Masukkan Akun Anda di bawah & Nikmati Fiturnya",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                  ),
                  // textfield your email
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                  ),
                  TextField(
                    controller: emailController,
                    
                    decoration: InputDecoration(
                      hintText: "Masukan Email Anda",
                      hintStyle: const TextStyle(color: (Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                        borderSide: const BorderSide(
                          width: 3,
                          color: (Colors.grey),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45) ,
                        borderSide: const BorderSide(
                          color: Colors.blue, 
                          width: 3.0,
                          ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                    ),
                  ),
                  // textfield your password
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Password",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 53, 53, 53),
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                  ),
                  TextField(
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45) ,
                        borderSide: const BorderSide(
                          color: Colors.blue, 
                          width: 3.0,
                          ),
                      ),
                      hintText: "Masukan Password Anda",
                      hintStyle: const TextStyle(color: (Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                        borderSide: const BorderSide(
                          width: 3,
                          color: (Colors.grey),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
              
                    ),
                  ),
                  Row(
                  children: [
                    Checkbox(
                value: isChecked2,
                onChanged: (value) {
                  setState(() {
                    isChecked2 = value!;
                  });
                },
              ),
                const Flexible(
                  child: Text(
                    'Ingat Saya',
                    overflow: TextOverflow.visible,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 152.0),
                  child: TextButton(
                    onPressed: () {}, 
                    child: const Text('Lupa Password?',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                    ),
                  ),
                                ),
                ),
                        ],
                        ),
                  // elevanted button create account
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 60.0),
                    child: Center(
                      child: ElevatedButton(
  onPressed: () async {
    String email = emailController.text;
    String password = passwordController.text;
    
    User user = User(email, password);

    // Periksa hasil login
    String? token = await loginUser(user);

     if (token != null) {
    // Kirim token ke Navbar saat menavigasi
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Navbar(token: token),
      ),
    );
    } else {
      // Jika login gagal, Anda dapat menangani sesuai kebutuhan (misalnya, menampilkan pesan kesalahan)
      // Misalnya:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal. Pastikan email dan password benar.'),
        ),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    minimumSize: const Size(300, 43), // Sesuaikan lebar dan tinggi sesuai kebutuhan Anda
  ),
  child: const Text('Masuk',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
  ),
),




                    ),
                  ),
                  
                        
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              // row daftar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum Memiliki Akun?'),
                  // textbutton login
                  TextButton(
                    onPressed : () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Rama()));
                    },
                    child: const Text('Daftar',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      ),  
                    ),
                  ),
                ],
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