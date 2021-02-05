import 'package:flutter/material.dart';
import 'package:tubes_moprokel8/Dashboard/edit_item.dart';
import 'package:tubes_moprokel8/Dashboard/edit_item2.dart';
import 'package:tubes_moprokel8/constant/const.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  final String id;

  DetailPage({@required this.item, this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Where You',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  ' Go',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ]),
          backgroundColor: Colors.blue,
          elevation: 0.0,
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.upload_file),
              title: Text('Edit Destinasi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditItemPage(
                      item: item,
                      id: id,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.upload_file),
              title: Text('Edit Kuliner'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditItemPage2(
                      item: item,
                      id: id,
                    ),
                  ),
                );
              },
            ),
          ],
        )),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      item.imgUrl,
                    ),
                  ),
                )),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 225,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.author,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        item.desc,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
