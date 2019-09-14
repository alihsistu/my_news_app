import 'package:flutter/material.dart';
// for asynchronous code
import 'dart:async';
// for decoding json
import 'dart:convert';
// for making http requests
import 'package:http/http.dart' as http;


// Apple news
String _urlApiApple =
    'https://newsapi.org/v2/everything?q=apple&from=2019-09-12&to=2019-09-12&sortBy=popularity&apiKey=e3d3b881510f4522a3a0c19fc55489ca';

// Business headlines in US
String _urlApiBusiness =
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e3d3b881510f4522a3a0c19fc55489ca';

// TechCrunch
String _urlApiTech =
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e3d3b881510f4522a3a0c19fc55489ca';

// Private response variables
List _responseApple;
List _responseBusiness;
List _responseTech;


// App's main method
void main() async {
  _responseApple = await fetchData(_urlApiApple);
  _responseBusiness = await fetchData(_urlApiBusiness);
  _responseTech = await fetchData(_urlApiTech);


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
            // 1st Button
            new RaisedButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new News(response: _responseApple,)));
              },
              child: new Text(
                "Apple News",
                style: new TextStyle(
                  fontFamily: "Verdana",
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            // 2nd Button
            new RaisedButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new News(response: _responseBusiness,)));
              },
              child: new Text(
                "US Business Headlines",
                style: new TextStyle(
                  fontFamily: "Verdana",
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            // 3rd Button
            new RaisedButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new News(response: _responseTech,)));
              },
              child: new Text(
                "TechCrunch",
                style: new TextStyle(
                  fontFamily: "Verdana",
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------Bitcoin------------------
class News extends StatelessWidget {

  final List response;

  // constructor ( make response a required field )
  News({Key key, @required this.response}) : super (key : key);



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Top News"),
          centerTitle: false,
        ),



        body: new Center(
          child: new ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: response.length,
            itemBuilder: (BuildContext context, int position) {

              // Divider between 
              if(position.isOdd) return  new Divider(
                color: Colors.lightBlue, 
              );
              final index = position ~/2;


              return new ListTile(
                title: new Text("${response[index]['title']}",//position <-> index
                    style: new TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.w900)),
                subtitle: new Text("${response[index]['description']}",//position <-> index
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
