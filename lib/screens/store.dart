import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Store extends StatefulWidget {
  final List data;
  final String title;
  const Store({Key key, this.data, this.title}) : super(key: key);
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return SafeArea(
      child: Scaffold(
          body: Container(
              color: Colors.red[100],
              child: Column(
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
                            widget.title.toUpperCase(),
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
                    flex: 9,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: widget.data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.data[index]['imageurl']['en-US']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(2, index.isEven ? 2 : 1),
                      mainAxisSpacing: 25.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ],
              ))),
    );
  }
}
