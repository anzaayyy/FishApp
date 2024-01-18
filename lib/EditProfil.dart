import 'dart:typed_data';
import 'package:flutter_application_1/user.dart';

import 'Navbar.dart';
import 'pickimage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class EditProfil extends StatefulWidget {
  final String token;
  const EditProfil({required this.token, Key? key}) :super(key: key);
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  bool isPasswordTextField = true;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noteleponController = TextEditingController();
  //int selectedIndex = 0;

void SelectImage() async{
  Uint8List img = await pickimage(ImageSource.gallery);
  setState(() {
    image = img;
  });
}

late Map<String, dynamic> detailPengguna = {};

  @override
  void initState() {
    super.initState();
    detailPengguna = {};
    ambilDetailPengguna();
    
  }

  Future<void> ambilDetailPengguna() async {
    detailPengguna = await UserHelper.ambilDetailPengguna(widget.token);
    nameController.text = detailPengguna['name'] ?? '';
    alamatController.text = detailPengguna['alamat'] ?? '';
    noteleponController.text = detailPengguna['nomer_telepon'] ?? '';
    
    setState(() {});
  }

Future<void> updateUser(String name, String alamat, String notelepon) async {
  final apiUrl = 'http://10.0.2.2:8000/api/update';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${widget.token}',
    },
    body: jsonEncode({
      'name': name,
      'alamat': alamat,
      'nomer_telepon': notelepon,
    }),
  );

  if (response.statusCode == 200) {
    // Pembaruan berhasil, tangani respons sesuai
    print('Pembaruan berhasil');
  } else {
    // Pembaruan gagal, tangani kesalahan
    print('Pembaruan gagal - ${response.statusCode}: ${response.body}');
  }
}

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
      title: const Text("Edit Profil"),
      leading: IconButton(
        onPressed: () {
          setState(() {
              Navigator.pop(context);
            });
        }, 
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 40,)),
      ),
      
  body: Stack(
    children:[
      Container( //BackGround
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("img/bck.jpg"),
                fit: BoxFit.cover
                ),
              ),
            ),

      Container(  //foto
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    image != null ?
                      CircleAvatar( //foto profil
                        radius: 64,
                        backgroundImage: MemoryImage(image!),
                      ):

                      const CircleAvatar( //foto profil
                        radius: 64,
                        child: Icon(Icons.person, size: 100),
                        // backgroundImage: NetworkImage('https://assets-a1.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png?t=o&v=780'),
                      ),
        
                    Positioned( //edit foto profil
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.white
                          ),
                          color: Colors.blue
                          ),
                          child: IconButton(
                            onPressed: SelectImage,
                            icon: Icon(Icons.camera_alt),
                            color: Colors.white,
                            iconSize: 20,
                          ),
                      ),
                    ),
                  ],
                  
                ),
              ),

            Padding(  //Garis
                      padding: const EdgeInsets.only(top: 45,  right: 5, left: 5),
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

            Column( //back
              children: [
              const SizedBox(height:30),
                Container(
                  height: 240,
                            decoration: BoxDecoration(
                            color:const Color.fromARGB(155, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)
                            ),
                 child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8, top: 10 ),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,
                            width: 3.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 43, 43, 43), width: 3.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
                      child: TextField(
                        controller: alamatController,
                        decoration: const InputDecoration(
                          labelText: 'Alamat',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,
                            width: 3.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 43, 43, 43), width: 3.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
                      child: TextField(
                        controller: noteleponController,
                        decoration: const InputDecoration(
                          labelText: 'Nomor Telepon',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,
                            width: 3.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 43, 43, 43), width: 3.0),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 10),
                  ]
                ),
                )
              ],
            ),
              
              Padding(  //tombol simpan
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded( 
                            child: ElevatedButton(
                              onPressed: () {
  // Dapatkan nilai dari bidang teks
  String name = nameController.text; // Implementasikan fungsi untuk mendapatkan nama dari bidang teks
  String alamat= alamatController.text; // Implementasikan fungsi untuk mendapatkan alamat dari bidang teks
  String notelepon = noteleponController.text; // Implementasikan fungsi untuk mendapatkan nomor telepon dari bidang teks

  // Panggil fungsi updateUser dengan nilai yang diperoleh
  updateUser(name, alamat, notelepon);
  Navigator.pop(context);
},
                              child: const Text("SIMPAN")
                              ),
                          ),
                          
                        ],  
                      ),
               ),
            ],
          ),
             
        ),
      ),
      
    ],
  ),
);

      
    
  }
    // Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    //   return Padding(
    //     padding: const EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
    //     child: TextFormField(
    //       obscureText: isPasswordTextField ? isPasswordTextField:false,
    //       style: const TextStyle(
    //         color: Colors.black,
    //         fontSize: 20,
    //         fontFamily: "Times New Roman",
    //         fontWeight: FontWeight.bold,
    //       ),
    //       decoration: InputDecoration(
    //         suffixIcon: isPasswordTextField ?
    //         IconButton(
    //           icon: const Icon(Icons.remove_red_eye, color: Colors.black),
    //           onPressed: () {}
    //         ): null,
    //         contentPadding: const EdgeInsets.only(bottom: 5),
    //         labelText: labelText,
    //          floatingLabelBehavior: FloatingLabelBehavior.always,
    //          hintText: placeholder,
    //          hintStyle: const TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.black,
    //          )
    //       ),
    //     ),
    //   );
    // }
}