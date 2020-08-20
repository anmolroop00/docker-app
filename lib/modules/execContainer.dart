import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExecCont extends StatefulWidget {
  @override
  _ExecContState createState() => _ExecContState();
}

class _ExecContState extends State<ExecCont> {

var output2;

execContainer() async {
  var url3 = 'http://192.168.1.32/cgi-bin/dockerExec.py';
  var response3 = await http.get(url3);
  setState(() {
    output2 = response3.body;
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Execute Container'),
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
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20),),
                      ),
                      labelText: 'Image to Execute'
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(output2 ?? 'Output...'),
                  SizedBox(height: 20,),
                  FloatingActionButton.extended(
                    onPressed: () {
                      execContainer();
                    },
                    label: Text('Execute'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}