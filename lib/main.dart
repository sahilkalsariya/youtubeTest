import 'package:flutter/material.dart';
import 'package:youtubetest/apiHelper.dart';
import 'package:youtubetest/model.dart';
import 'package:youtubetest/vedioplayer.dart';

void main(){
  runApp(
    MaterialApp(
     debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => myApp(),
        'vedio' : (context) => vedioPlayer(),
      },
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
              child: Container(
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('vedio');
                      // Global.link = e['vedio'];
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 300,
                        width: double.infinity,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage("${data.Image}"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      "${data.title}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Text(
                                    //   "${e['subtitle']}",
                                    //   style: TextStyle(
                                    //     fontSize: 22, color: Colors.black,fontWeight: FontWeight.bold,),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ) : Text("No Data founds........");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
