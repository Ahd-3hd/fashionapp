import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Store extends StatefulWidget {
  final List data;

  const Store({Key key, this.data}) : super(key: key);
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return SafeArea(
      child: Scaffold(
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(widget.data[index]['imageurl']['en-US']),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text('${widget.data[index]['title']['en-US']}'),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 25.0,
          crossAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
