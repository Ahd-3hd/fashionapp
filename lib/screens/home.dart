import 'package:fashionapp/components/categories.dart';
import 'package:fashionapp/components/featured.dart';
import 'package:fashionapp/components/header.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  Future getData() async {
    Response response =
        await get('https://shrouded-savannah-97463.herokuapp.com/products');
    print(json.decode(response.body));
    setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Header(
              data: data,
            ),
            FeaturedDesigns(),
            Categories(
              data: data,
            ),
          ],
        ),
      ),
    );
  }
}
