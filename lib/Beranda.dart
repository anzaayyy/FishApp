import 'package:flutter/material.dart';
import 'package:flutter_application_1/Drawer.dart';
import 'package:flutter_application_1/Sewa.dart';
import 'package:flutter_application_1/keranjang.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String _currentTime = DateFormat('HH:mm').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateFormat('HH:mm').format(DateTime.now());
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      style: const TextStyle(fontSize: 36.0,fontFamily: 'Komika'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Beranda extends StatefulWidget {
  final String token;
  const Beranda({required this.token, Key? key}) : super(key: key);
  

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String _suhuCuaca = '';
  String _area = '';
  //String _pressure = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
@override
  void initState() {
    super.initState();
    _fetchCurrentWeather();
  }
  void _fetchCurrentWeather() async {
  try {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=-8.443070015653468&lon=114.34495530863425&appid=b3a593c0c9ac7e655f33047f8dae476e'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Pastikan struktur data sesuai dengan yang Anda harapkan
      if (data['main'] != null && data['main']['temp'] != null && data['name'] != null&&data['main']['pressure']!=null && data['main'] != null) {
        // Ubah nilai suhu ke tipe data yang benar
        double temperature = (data['main']['temp'] as num).toDouble();
        //double pressures = (data['main']['pressure'] as num).toDouble();
        double temperatureCelsius = temperature - 273.15;

        // Bulatkan suhu
        int pembulatanSuhu = temperatureCelsius.round();

        if (mounted) {
          setState(() {
            // Gunakan nama area yang sesuai
            _suhuCuaca = '$pembulatanSuhu°C';
            _area = data['name'];
           // _pressure = '$pressures';
          });
        }
      } else {
        print('Gagal mengambil data cuaca: Struktur data tidak sesuai.');
      }
    } else {
      print('Gagal mengambil data cuaca: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error: $e');
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
                opacity: 10,
                colorFilter: ColorFilter.mode(Color.fromARGB(103, 255, 255, 255), BlendMode.screen)
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
                    Container(
                      color: Colors.blue, // Latar belakang biru untuk gambar 'PBL'
                      child: Image.asset(
                        'img/PBL.png',
                        width: 60,
                        height: 75,
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
            
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
              'Suhu : $_suhuCuaca',
              style: const TextStyle(
                fontSize: 20, fontFamily: 'Komika'
              ),
              ),
            ),
            Text(
              _area,
              style: const TextStyle(
                fontSize: 22, fontFamily: 'Komika'
              ),
              ),
              // Text(
              // '$_pressure',
              // style: const TextStyle(
              //   fontSize: 22, fontFamily: 'Komika'
              // ),
              // ),
            Center(
              child: ClockWidget(),
            ),
            
            
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ 
                    Column(
                      children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(227, 221, 221, 221),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Sewa(token: widget.token,)));
                        },
                        child: Image.asset('img/kapal.png',
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8,  bottom: 50),
                      child: Text('Sewa Barang',style: TextStyle(fontSize: 17, fontFamily: 'Bebas Neue')),
                    ),

                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(227, 221, 221, 221),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Coming soon!'),
                            ),
                          );
                        },
                      child: Image.asset('img/toko.png',
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                       
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8,),
                      child: Text('Pasar Ikan',style: TextStyle(fontSize: 17, fontFamily: 'Bebas Neue')),
                    ),
                      ],
                    ),
                    
                    //SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(227, 221, 221, 221),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Keranjang(token: widget.token)));
                        },
                        child: Image.asset('img/keranjang.png',
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                      ),
                      ),
                    ),
                    
                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 50),
                      child: Text('Keranjang', style: TextStyle(fontSize: 17, fontFamily: 'Bebas Neue'),),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color:const Color.fromARGB(227, 221, 221, 221),
                      ),
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Coming soon!'),
                            ),
                          );
                        },
                        child: Image.asset('img/ikan.png',
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Suplai Ikan',style: TextStyle(fontSize: 17, fontFamily: 'Bebas Neue')),
                    )
                      ],
                    ),
                    
                  ],
                ),
            ),
          ],
        ),
        ],
        
      ),
    );
  }
}

