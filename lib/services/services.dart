import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class Services {
  static const BASE_URL = "http://datafeed.mistnews.com/news5/service1.asmx/";

  Future<Map<String, dynamic>> get(String urlSuffix) async {
    try {
      final Xml2Json xml2json=new Xml2Json();
      http.Response response = await http.get(BASE_URL + urlSuffix);
      if (response.statusCode == 200) {
        xml2json.parse(response.body);
        var jsondata=xml2json.toGData();
        Map<String, dynamic> responseJson = jsonDecode(jsondata);
        //print(response.body);
        return responseJson;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw e;
    }
  }
//  Future<Map<String,dynamic>> post(String urlSuffix, String requestBody) async{
//    try{
//      Map<String,String> headers = {
//        "Content-Type" : "application/json"
//      };
//      http.Response response = await http.post(BASE_URL + urlSuffix,headers: headers,body: requestBody);
//      if (response.statusCode == 200) {
//        Map<String, dynamic> responseJson = jsonDecode(response.body);
//        print(response.body);
//        return responseJson;
//      } else {
//        print(response.body);
//        Map<String,dynamic> errorBody = jsonDecode(response.body);
//        throw Exception(errorBody['error']);
//      }
//    }
//    catch (e){
//      throw e;
//    }
//  }
}
