import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tubes_moprokel8/constant/const.dart';

class EditItemPage2 extends StatefulWidget {
  final Item item;
  final String id;

  EditItemPage2({@required this.item, this.id});

  @override
  _EditItemPage2State createState() => _EditItemPage2State();
}

class _EditItemPage2State extends State<EditItemPage2> {
  TextEditingController titleController;
  TextEditingController descController;
  TextEditingController authorController;

  @override
  void initState() {
    authorController = TextEditingController();
    descController = TextEditingController();
    titleController = TextEditingController();
    authorController.text = '';
    descController.text = '';
    titleController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item != null) {
      authorController.text = widget.item.author;
      descController.text = widget.item.desc;
      titleController.text = widget.item.title;
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'Where You',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          Text(
            ' Go',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ]),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: authorController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Author',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: titleController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: descController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Desc',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    height: 45,
                    color: Colors.blue,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      Item item = Item(
                        id: '01',
                        author: authorController.text,
                        imgUrl: '',
                        desc: descController.text,
                        title: titleController.text,
                      );
                      if (widget.item == null) {
                        FirebaseFirestore.instance
                            .collection('kuliner')
                            .add(item.toJson());
                      } else {
                        FirebaseFirestore.instance
                            .collection('kuliner')
                            .doc(item.id)
                            .update(item.toJson());
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Visibility(
                    visible: widget.item != null ? true : false,
                    child: FlatButton(
                      height: 45,
                      color: Colors.red,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('kuliner')
                            .doc(widget.id)
                            .delete();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
