import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';


class getNews extends StatefulWidget {
  @override
  _getNewsState createState() => new _getNewsState();
}

class _getNewsState extends State<getNews>  {

  List _data;
  final Xml2Json xml2json=new Xml2Json();
  final String link="http://datafeed.mistnews.com/news5/service1.asmx/NewsTicker";
  Future<List> getJson() async {
    //String apiUrl = 'http://10.145.12.53:8020/api/categories';

    http.Response response = await http.get(link);
    xml2json.parse(response.body);
    var jsondata=xml2json.toGData();
    //var data=json.decode(jsondata);

        setState(() {

      _data=json.decode(jsondata);
    });
    return _data;
  }

  @override
  void initState()  {
    this.getJson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text('Categories'),
            centerTitle: true,
            backgroundColor: Colors.black54,

        ),
        body: new Center(
            child: new ListView.builder(
                itemCount: _data == null ? 0 : _data.length,
                padding: const EdgeInsets.all(14.5),
                itemBuilder: (BuildContext context, int position) {

                  return Column(
                    children: <Widget>[
                      new Divider(height: 5.5),
                      new ListTile(
                        title: Text(
                          "${_data[position]['CategoryName']}",
                          style: new TextStyle(fontSize: 17.9),
                        ),
                        subtitle: Text("${_data[position]['CategoryName']}",
                            style: new TextStyle(
                                fontSize: 13.9,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic)),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.deepOrangeAccent,
                          child: Text(
                            "${_data[position]['CategoryName'][0]}".toUpperCase(),
                            style: new TextStyle(
                                fontSize: 16.4, color: Colors.blueAccent),
                          ),
                        ),
                        onTap:() {},

                      )
                    ],
                  );
                })),
      ),
    );
  }
}



