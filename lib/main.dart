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

// App's main method
void main() {
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
