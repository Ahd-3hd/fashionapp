import 'package:flutter/material.dart';

class FeaturedDesigns extends StatelessWidget {
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
            children: <Widget>[
              Expanded(
                child: FeaturedCard(),
              ),
              Expanded(
                child: FeaturedCard(),
              ),
              Expanded(
                child: FeaturedCard(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FeaturedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              image: NetworkImage('https://picsum.photos/600/600'),
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
                  'Title',
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
                  'Type',
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
                  '\$ 45.54',
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
    );
  }
}
