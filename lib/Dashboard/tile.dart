import 'package:flutter/material.dart';
import 'package:tubes_moprokel8/constant/const.dart';

class NewsTile extends StatefulWidget {
  final Item item;

  NewsTile({@required this.item});
  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                widget.item.imgUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              widget.item.title,
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'By Author: ',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                widget.item.author,
                style: TextStyle(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
