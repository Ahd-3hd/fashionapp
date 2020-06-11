import 'package:fashionapp/screens/single.dart';
import 'package:flutter/material.dart';

class FeaturedDesigns extends StatelessWidget {
  final List data;

  const FeaturedDesigns({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Featured Designs',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Row(
            children: data
                .map((e) => Expanded(child: FeaturedCard(data: e)))
                .toList(),
          )
        ],
      ),
    );
  }
}

// <Widget>[
//               Expanded(
//                 child: FeaturedCard(),
//               ),
//               Expanded(
//                 child: FeaturedCard(),
//               ),
//               Expanded(
//                 child: FeaturedCard(),
//               ),
//             ],
class FeaturedCard extends StatelessWidget {
  final Map data;

  const FeaturedCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Single(data: data)),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            height: MediaQuery.of(context).size.width / 1.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(data['imageurl']['en-US']),
                fit: BoxFit.cover,
              ),
            ),
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
                  child: Text(
                    data['title']['en-US'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  width: double.infinity,
                  child: Text(
                    data['type']['en-US'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  width: double.infinity,
                  child: Text(
                    '\$${data['price']['en-US']}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
