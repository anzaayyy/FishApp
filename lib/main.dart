import 'package:flutter/material.dart';
import 'package:flutter_application_1/Beranda.dart';
import 'package:flutter_application_1/Navbar.dart';
import 'package:flutter_application_1/Sewa.dart';
import 'package:flutter_application_1/login.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_application_1/listView.dart';
//import 'api2.dart';
import 'Rama.dart';
void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: const MyApp(),
    ),
  );
}

class DataModel extends ChangeNotifier {
  String myData = "";
  
  void updateData(String newData) {
    myData = newData;
    notifyListeners();
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        //body: Sewa(),

        //body: Rama()

        //body: Login(),

        body: Navbar(),
      ),
    );
  }
}



class FromRegister extends StatefulWidget {
  const FromRegister({super.key});

  @override
  State<FromRegister> createState() => _FromRegisterState();
  
}

class _FromRegisterState extends State<FromRegister> {
  bool isChecked = false;
  bool obscure1 = true;
  bool obscure2 = true;
  final TextEditingController emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    
    return Scaffold(
    body: Column(
          children: [
            // logo
            Expanded(
              flex: 1,
              child: Container(
                //color: Color.fromARGB(11, 99, 97, 96),
                // margin: EdgeInsets.only(top: 30),
                child: Padding(
                  
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Image.asset('img/PBL.png', width: 200.0,),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sign up
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Mendaftar",
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
                        "Masukkan detail Anda di bawah & daftar gratis",
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
                        "Your Email",
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
                        hintText: "Masukan Email",
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
                      obscureText: obscure1,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscure1=!obscure1;
                            });
                          },
                          child: Icon(obscure1?Icons.visibility:Icons.visibility_off),
                        ),
                        hintText: "Masukan Password",
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
                    // textfield confirm pass
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Confirm Password",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 53, 53, 53),
                          fontWeight: FontWeight.w700,
                        ),
                        ),
                    ),
                    TextField(
                      obscureText: obscure2,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscure2=!obscure2;
                            });
                          },
                          child: Icon(obscure2?Icons.visibility:Icons.visibility_off),
                        ),
                        hintText: "Masukan Confirm Password",
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
                    // elevanted button create account
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            dataModel.updateData(emailController.text);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const Rama()));
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Rama()));
                          },
                          style: ElevatedButton.styleFrom(
                          minimumSize: const Size(270, 40), // Sesuaikan lebar dan tinggi sesuai kebutuhan Anda
                          ),
                            child: const Text('Selanjutnya',
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
              ),
            ),
            SingleChildScrollView(
              child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // row checkbox
                  Row(
                    children: [
                      Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                  const Flexible(
                    child: Text(
                      'By creating an account you have to agree with our terms & conditions.',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              //row alredy
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  // textbutton login
                  TextButton(
                    onPressed : () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: const Text('Log In',
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
      ),
      ],
    ),
    );
  }
}

