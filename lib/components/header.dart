import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionapp/screens/single.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final List data;

  const Header({Key key, this.data}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 2,
        enlargeCenterPage: true,
      ),
      items: widget.data.map((item) => ItemCard(itemData: item)).toList(),
    );
  }
}

class ItemCard extends StatefulWidget {
  final itemData;

  const ItemCard({Key key, this.itemData}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Single(data: widget.itemData)),
        );
      },
      child: Column(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.itemData['imageurl']['en-US']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.remove_red_eye,
                              size: 20,
                              color: const Color(0xff833895),
                            ),
                            Text(
                              '32',
                              style: TextStyle(
                                color: const Color(0xff833895),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              size: 20,
                              color: const Color(0xff833895),
                            ),
                            Text(
                              '32',
                              style: TextStyle(
                                color: const Color(0xff833895),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: const Color(0xff833895),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
