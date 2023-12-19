import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
//import 'package:provider/provider.dart';
//import 'main.dart';



class Rama extends StatelessWidget {
  const Rama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //final dataModel = Provider.of<DataModel>(context); //digunakan untuk mengambil data yang di inputkan sebelumnya
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
              
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nomor Telepon',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,
                          width: 3.0,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
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

