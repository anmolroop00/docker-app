import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String imageName;
String customName;
var version;

newContainer(imageName,customName,version) async{
  var url = "http://192.168.1.32/cgi-bin/docker2.py?first_name=${imageName}&last_name=${customName}&version=${version}";
  var response = await http.get(url);
  print(response.body);
}
class NewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Start New Container'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextField(
                  obscureText: false,
                  onChanged: (value) {
                    imageName = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20,),)
                    ),
                    labelText: 'Image Name',
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: false,
                  onChanged: (value) {
                    customName = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20,),)
                    ),
                    labelText: 'Custom Name',
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: false,
                  onChanged: (value) {
                    version = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20,),)
                    ),
                    labelText: 'Version'
                  ),
                ),
                SizedBox(height: 20,),
                FloatingActionButton.extended(
                  onPressed: (){
                    print(imageName);
                    print(customName);
                    print(version);
                    newContainer(customName, imageName, version);
                  },
                  label: Text('Run Container'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}