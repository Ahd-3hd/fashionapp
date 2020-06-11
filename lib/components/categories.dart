import 'package:fashionapp/screens/store.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List data;

  const Categories({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
        FeaturedCategory(imageurl: 'assets/all.jpg', title: 'ALL', data: data),
        FeaturedCategory(
            imageurl: 'assets/img2.jpg', title: 'dress', data: data),
        FeaturedCategory(
            imageurl: 'assets/img5.jpg', title: 'coat', data: data),
        FeaturedCategory(
            imageurl: 'assets/abaya9.jpg', title: 'abaya', data: data),
      ],
    );
  }
}

class FeaturedCategory extends StatelessWidget {
  final data;
  final String imageurl;
  final String title;

  const FeaturedCategory({Key key, this.imageurl, this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Store(
              data: title == 'ALL'
                  ? data
                  : data
                      .where((item) => item['type']['en-US'] == title)
                      .toList(),
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      imageurl,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: MediaQuery.of(context).size.width / 2.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    colors: [
                      Color.fromRGBO(131, 56, 149, 0.5),
                      Color.fromRGBO(215, 32, 54, 0.5)
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
