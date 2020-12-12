import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:horoscope_app/screens/Detail.dart';

class HomePage extends StatefulWidget {
  static List horoscopeList;
  @override
  _HomePageState createState() => _HomePageState(horoscopeList);
}

class _HomePageState extends State<HomePage> {

  List horoscopeList;
  _HomePageState(this.horoscopeList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/sky.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: FutureBuilder(
            future: getHoroscopeList(),
            builder: (context, result) {
              if (result.hasData) {
                horoscopeList = result.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          horoscopeList[index]['name'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          horoscopeList[index]['date'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        leading: Image.asset(
                          horoscopeList[index]['image'],
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(horoscopeList[index])));
                        },
                      ),
                    );
                  },
                  itemCount: 12,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List> getHoroscopeList() async {
    var data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/horoscopes.json");

    var listItems = jsonDecode(data.toString());
    return listItems;
  }

}
