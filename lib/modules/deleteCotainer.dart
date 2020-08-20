import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class DeleteContainer extends StatefulWidget {
  @override
  _DeleteContainerState createState() => _DeleteContainerState();
}

class _DeleteContainerState extends State<DeleteContainer> {
String osName;
var output;

deleteContainer(osName) async {
  var url2 = 'http://192.168.1.32/cgi-bin/dockerDelete.py?name=${osName}';
  var response2 = await http.get(url2);
  setState(() {
    output = response2.body;
  });    
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delete Container'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                TextField(
                  onChanged: (value) {
                    osName = value;
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'OS Name'
                  ),
                ),
                SizedBox(height: 20,),
                Text(output ?? 'Delete Container'),
                SizedBox(height: 20,),
                /*Text(cont ?? 'All Conatiners'),
                SizedBox(height: 20,),*/
                FloatingActionButton.extended(
                  onPressed: (){
                    print(osName);
                    deleteContainer(osName);
                  },
                  label: Text('Delete Conatiner'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}