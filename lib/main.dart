import 'package:flutter/material.dart';
// for asynchronous code
import 'dart:async';
// for decoding json
import 'dart:convert';
// for making http requests
import 'package:http/http.dart' as http;

// Bitcoin News
String _urlApi1 =
    'https://newsapi.org/v2/everything?q=bitcoin&from=2019-08-13&sortBy=publishedAt&apiKey=e3d3b881510f4522a3a0c19fc55489ca';

// Business headlines in US
String _urlApi2 =
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e3d3b881510f4522a3a0c19fc55489ca';

// Apple news
String _urlApi3 =
    'https://newsapi.org/v2/everything?q=apple&from=2019-09-12&to=2019-09-12&sortBy=popularity&apiKey=e3d3b881510f4522a3a0c19fc55489ca';


// Private response variables
List _response1;
List _response2;
List _response3;


// App's main method
void main() async{


  _response1 = await fetchData(_urlApi1);
  _response2 = await fetchData(_urlApi2);
  _response3 = await fetchData(_urlApi3);

  // Print test to see responses in console
  for(int i = 0; i<_response1.length; i++){
    print(_response1[i]['title']);
  }


  runApp(new MaterialApp(
    home: new Categories(),
  ));
}

// stateless widget
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // T ODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        // The App Logo comes HERE
        title: new Text('REALBOX'),
      ),
    );
  }
}


// Method to fetch data from the API
Future<List> fetchData(String urlApi)async {
  http.Response response = await http.get(urlApi);
  return (json.decode(response.body))['articles'];
}