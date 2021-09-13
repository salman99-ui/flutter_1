import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/restaurant.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.place, color: Colors.grey.shade800),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      child: Text(data.city,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500)))
                ],
              ),
            ),
            Text(data.description,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    height: 1.5)),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Foods',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
                  Container(
                      height: 500,
                      margin: EdgeInsets.only(bottom: 21, top: 15),
                      child: ListView.builder(
                          itemCount: data.menu.foods.length,
                          itemBuilder: (context, index) => ListTile(
                                leading: Icon(Icons.fastfood),
                                title: Text(data.menu.foods[index]['name']),
                              ))),
                  Text('Drinks',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
                  Container(
                      height: 500,
                      margin: EdgeInsets.only(top: 20),
                      child: ListView.builder(
                          itemCount: data.menu.drinks.length,
                          itemBuilder: (context, index) => ListTile(
                                onTap: () {
                                  final snackbar = SnackBar(
                                      content: Text(
                                          'You Choice ${data.menu.drinks[index]['name']}'));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                },
                                leading: Icon(Icons.fastfood),
                                title: Text(data.menu.drinks[index]['name']),
                              )))
                ],
              ),
            )
          ]),
        )
      ])),
    ));
  }
}
