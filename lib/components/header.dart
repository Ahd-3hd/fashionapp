import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionapp/screens/single.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  bool isLoading = false;

  Future likePost(id) async {
    setState(() {
      isLoading = true;
    });
    Response response =
        await put('https://shrouded-savannah-97463.herokuapp.com/like/$id');
    response.body == 'done'
        ? setState(() {
            isLoading = false;
          })
        : null;
    setState(() {
      isLiked = true;
    });
  }

  Future unlikePost(id) async {
    setState(() {
      isLoading = true;
    });
    Response response =
        await put('https://shrouded-savannah-97463.herokuapp.com/unlike/$id');
    response.body == 'done'
        ? setState(() {
            isLoading = false;
          })
        : null;
    setState(() {
      isLiked = false;
    });
  }

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
                              widget.itemData['views']['en-US'].toString(),
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
                              widget.itemData['likes']['en-US'].toString(),
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
                  child: isLoading
                      ? Container(
                          width: 25,
                          height: 25,
                          padding: EdgeInsets.all(5),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.purple[900],
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () async {
                            isLiked
                                ? await unlikePost(
                                    widget.itemData['id']['en-US'])
                                : await likePost(
                                    widget.itemData['id']['en-US']);
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
