import 'package:flutter/material.dart';
//import 'package:flutter_application_1/Beranda.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'package:flutter_application_1/Rama.dart';
//import 'package:flutter_application_1/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
  
  
}

class _Login extends State<Login> {
  bool isChecked2 = false;
  bool obscure =true;
  
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
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscure=!obscure;
                          });
                        },
                        child: Icon(obscure?Icons.visibility:Icons.visibility_off),
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
                    fontWeight: FontWeight.bold
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
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const Navbar()));
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Rama()));
                        },
                        style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 43), // Sesuaikan lebar dan tinggi sesuai kebutuhan Anda
                        ),
                          child: const Text('Masuk',
                          style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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