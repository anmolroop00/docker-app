import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DownloadImage extends StatefulWidget {
  @override
  _DownloadImageState createState() => _DownloadImageState();
}

class _DownloadImageState extends State<DownloadImage> {
  static String downOs;
  static var output;
  static down(downOs) async {
    var url5 = 'http://192.168.1.32/cgi-bin/dockerJson.py?name=${downOs}';
    var response5 = await http.get(url5);
    //print(response5.body);
    output = response5.body;
  }

  int selectedIndex = 0;
  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOption  = <Widget>[
    Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          TextField(
            onChanged: (value5) {
              downOs = value5;
            },
            obscureText: false,
            autocorrect: false,
            decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            labelText: 'Image Name'
            ),
          ),
          SizedBox(height: 20,),
          FloatingActionButton.extended(
            onPressed: (){
              print(downOs);
              down(downOs);
            }, 
            label: Text('Download'),
          ),
          SizedBox(height: 20,),
          Text(output ?? 'Downloading Images ...')
        ],
      ),
    ),
    //Text('Index 0: Home', style: optionStyle,),
    Text('Index 1: Bussiness', style: optionStyle,),
  ];

  void onTapedItem(int index){
    setState(() {
      selectedIndex = index;
      output;
    });
  }

  void tesst(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Download Images'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: widgetOption.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onTapedItem,
        ),
      ),
    );
  }
}