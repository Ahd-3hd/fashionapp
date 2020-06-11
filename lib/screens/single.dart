import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Single extends StatefulWidget {
  final Map data;

  const Single({Key key, this.data}) : super(key: key);
  @override
  _SingleState createState() => _SingleState();
}

class _SingleState extends State<Single> {
  bool isLiked = false;
  bool isLoading = false;
  int likesCount = 0;
  int viewsCount = 0;
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
      likesCount += 1;
    });
    setState(() {
      isLiked = true;
    });
  }

  Future viewPost(id) async {
    Response response =
        await put('https://shrouded-savannah-97463.herokuapp.com/view/$id');
    setState(() {
      viewsCount += 1;
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
      likesCount -= 1;
    });
    setState(() {
      isLiked = false;
    });
  }

  @override
  void initState() {
    super.initState();
    viewPost(widget.data['id']['en-US']);
    setState(() {
      viewsCount = widget.data['views']['en-US'];
      likesCount = widget.data['likes']['en-US'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Color(0xff833895),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.data['title']['en-US'].toUpperCase(),
                      style: TextStyle(
                        color: Color(0xff833895),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
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
                                  viewsCount.toString(),
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
                                  likesCount.toString(),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${widget.data['price']['en-US']}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.data['imageurl']['en-US'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: isLoading
                                  ? Container(
                                      width: 25,
                                      height: 25,
                                      padding: EdgeInsets.all(5),
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.purple[900],
                                        ),
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () async {
                                        isLiked
                                            ? await unlikePost(
                                                widget.data['id']['en-US'])
                                            : await likePost(
                                                widget.data['id']['en-US']);
                                      },
                                      icon: Icon(
                                        isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 20,
                                        color: const Color(0xff833895),
                                      ),
                                    ),
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
