import 'package:flutter/material.dart';
import 'package:youtubetest/apiHelper.dart';
import 'package:youtubetest/model.dart';

void main(){
  runApp(
    MaterialApp(
     debugShowCheckedModeBanner: false,
     home: myApp(),
    )
  );
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YOUTUBE"),
      ),
      body: FutureBuilder(
        future: APIHelper.apihelper.fetchData(),
        builder: (context,snapshot) {
          if(snapshot.hasError){
            return Text("Error : ${snapshot.error}");
          }else if (snapshot.hasData){
            Youtube? data = snapshot.data as Youtube?;

            return (data!=null) ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Title : ${data.title}"),
                  GestureDetector(
                      child: Image.network("${data.Image}")),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image:DecorationImage(
                  //       image: NetworkImage("${data.Image}"),
                  //     )
                  //   ),
                  // )
                  // Text("kind : ${data.kind}"),

                ],
              ),
            ) : Text("No Data founds........");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
