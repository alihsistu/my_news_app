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
void main() async {
  _response1 = await fetchData(_urlApi1);
  _response2 = await fetchData(_urlApi2);
  _response3 = await fetchData(_urlApi3);

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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // this button takes the user to Bitcoin Widget below(new page)
            // Button 1
            new RaisedButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Bitcoin()));
              },
              child: new Text(
                "Bitcoin News",
                style: new TextStyle(
                  fontFamily: "Verdana",
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            // Button 2
            new RaisedButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Bitcoin()));
              },
              child: new Text(
                "Bitcoin News",
                style: new TextStyle(
                  fontFamily: "Verdana",
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            // Button 3
            new RaisedButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Bitcoin()));
              },
              child: new Text(
                "Bitcoin News",
                style: new TextStyle(
                  fontFamily: "Verdana",
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Bitcoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Bitcoin News"),
          centerTitle: false,
        ),



        body: new Center(
          child: new ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: _response1.length,
            itemBuilder: (BuildContext context, int position) {

              // Divider between 
              if(position.isOdd) return  new Divider(
                color: Colors.lightBlue, 
              );
              final index = position ~/2;


              return new ListTile(
                title: new Text("${_response1[index]['title']}",
                    style: new TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.w900)),
                subtitle: new Text("${_response1[index]['description']}",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey)),
              );
            },
          ),
        ));
  }
}

// Method to fetch data from the API
Future<List> fetchData(String urlApi) async {
  http.Response response = await http.get(urlApi);
  return (json.decode(response.body))['articles'];
}
