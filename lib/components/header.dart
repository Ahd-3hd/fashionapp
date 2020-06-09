import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.remove_red_eye,
                          color: const Color(0xff833895),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '32',
                            style: TextStyle(
                              color: const Color(0xff833895),
                            ),
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
                          Icons.favorite_border,
                          color: const Color(0xff833895),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '32',
                            style: TextStyle(
                              color: const Color(0xff833895),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.touch_app,
                      color: const Color(0xff833895),
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 1,
                    height: 30,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        color: const Color(0xff833895),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: const Color(0xff833895),
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
