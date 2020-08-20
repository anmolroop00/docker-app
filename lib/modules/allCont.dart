import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllContainer extends StatefulWidget {
  @override
  _AllContainerState createState() => _AllContainerState();
}

class _AllContainerState extends State<AllContainer> {

var all;
showContainer() async {
  var url4 = 'http://192.168.1.32/cgi-bin/showCont.py';
  var response4 = await http.get(url4);
  var data4 = response4.body;
  var fdata = jsonDecode(data4);
  setState(() {
    all = fdata['output'];  
  });
  
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Images'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: () {
              Navigator.pop(context);
            },),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(all ?? 'Images'),
                  SizedBox(height: 20,),
                  FloatingActionButton.extended(
                    onPressed: (){
                      showContainer();
                    }, 
                    label: Text('Show All'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}