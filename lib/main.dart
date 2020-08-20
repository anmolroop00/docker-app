import 'package:flutter/material.dart';
import 'modules/deleteCotainer.dart';
import 'modules/container.dart';
import 'modules/execContainer.dart';
import 'modules/allCont.dart';
import 'modules/download.dart';

main() {
  runApp(
    MaterialApp(
      title: 'Docker Container',
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Docker'),
        leading: Image.asset('assets/icons/docker.png'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  SizedBox(width: 5,),
                  Container(
                    height: 110,
                    width: 110,
                    //color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.computer, 
                            color: Colors.blue[300],
                          ), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewContainer()),);
                          },
                          iconSize: 35,
                        ),
                        Text('Start New Container', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 110,
                    width: 110,
                    //color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.delete_sweep,
                            color: Colors.red[400], 
                          ), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteContainer()),);
                          },
                          iconSize: 35,
                        ),
                        Text('Delete Container', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 110,
                    width: 110,
                    //color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.teal[600], 
                          ), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExecCont()));
                          },
                          iconSize: 35,
                        ),
                        Text('Start Container', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                children: <Widget>[
                SizedBox(width: 10,),
                Container(
                  height: 110,
                  width: 110,
                  //color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.file_download,
                          color: Color(0xff111d5e),
                        ), 
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadImage()));
                        },
                        iconSize: 35,
                      ),
                      Text('Download New Images', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 110,
                    width: 110,
                    //color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove_from_queue), 
                          onPressed: (){},
                          iconSize: 35,
                        ),
                        Text('Remove Images', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 110,
                    width: 110,
                    //color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.content_copy), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllContainer()));
                          },
                          iconSize: 35,
                        ),
                        Text('Show All Containers', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Container(
                  height: 110,
                  width: 110,
                  //color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/icons/ml.png'), 
                        onPressed: (){},
                        iconSize: 35,
                      ),
                      Text('Machine Learning Images', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}