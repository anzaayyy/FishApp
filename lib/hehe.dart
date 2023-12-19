import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text('Content goes here'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isDrawerOpen = !isDrawerOpen;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              color: isDrawerOpen ? Colors.black.withOpacity(0.5) : Colors.transparent,
              width: isDrawerOpen ? MediaQuery.of(context).size.width * 0.5 : 0,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 0,
            right: isDrawerOpen ? 0 : -MediaQuery.of(context).size.width * 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              child: Drawer(
                child: Container(
                  color: Colors.blue, // Adjust the color as needed
                  child: Column(
                    children: [
                      DrawerHeader(
                        child: Text('Drawer Header'),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: Text('Item 1'),
                        onTap: () {
                          // Handle item tap
                        },
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        onTap: () {
                          // Handle item tap
                        },
                      ),
                      // Add more ListTile widgets as needed
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
