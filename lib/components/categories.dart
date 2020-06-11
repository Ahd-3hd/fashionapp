import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
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
        FeaturedCategory(imageurl: 'assets/img2.jpg', title: 'DRESS'),
        FeaturedCategory(imageurl: 'assets/img5.jpg', title: 'COAT'),
        FeaturedCategory(imageurl: 'assets/abaya9.jpg', title: 'ABAYA'),
      ],
    );
  }
}

class FeaturedCategory extends StatelessWidget {
  final String imageurl;
  final String title;

  const FeaturedCategory({Key key, this.imageurl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  title,
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
    );
  }
}
// Container(
//   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//   height: MediaQuery.of(context).size.width / 2.3,
//   child: Image.asset(
//     imageurl,
//     height: double.maxFinite,
//     width: double.maxFinite,
//     fit: BoxFit.cover,
//     // color: Colors.red.withOpacity(0.5),
//     // colorBlendMode: BlendMode.lighten,
//   ),
//   decoration: BoxDecoration(
//     gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
//     borderRadius: BorderRadius.circular(15),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.3),
//         spreadRadius: 2,
//         blurRadius: 7,
//         offset: Offset(0, 3), // changes position of shadow
//       ),
//     ],
//     image: DecorationImage(
//       image: AssetImage(imageurl),
//       fit: BoxFit.cover,
//     ),
//   ),
// ),
