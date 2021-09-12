import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/main', routes: {
      '/main': (context) => Main(),
      '/detail': (context) =>
          Detail(ModalRoute.of(context)!.settings.arguments as restaurant)
    });
  }
}

class Main extends StatelessWidget {
  List<restaurant> parseList(String json) {
    final List jsonData = jsonDecode(json)['restaurants'];

    return jsonData.map((e) => restaurant.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 1200,
      child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            List<restaurant> data = parseList(snapshot.data as String);

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: data[index]);
                      },
                      child: Card(
                        elevation: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(data[index].pictureId))),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(children: [
                                  Text(data[index].name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.place,
                                            color: Colors.grey.shade800),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 8),
                                            child: Text(data[index].city,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.grey.shade800),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 8),
                                            child: Text(data[index].rating,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)))
                                      ],
                                    ),
                                  )
                                ])),
                          ],
                        ),
                      ),
                    ));
          }),
    ));
  }
}

class Detail extends StatelessWidget {
  restaurant data;

  Detail(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(data.pictureId), fit: BoxFit.cover)),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.place, color: Colors.grey.shade800),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Text(data.city,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500)))
              ],
            ),
            Text(data.description)
          ]),
        )
      ])),
    ));
  }
}
