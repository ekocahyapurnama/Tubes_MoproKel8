import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tubes_moprokel8/Services/AuthServices.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  bool isLoading = false;
  String authorName, title, desc, id;
  File selectedImage;
  final picker = ImagePicker();
  CrudMethods crudMethods = new CrudMethods();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadData() async {
    if (selectedImage != null) {
      setState(() {
        isLoading = true;
      });
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("newsImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = firebaseStorageRef.putFile(selectedImage);
      var imageUrl;
      await task.whenComplete(() async {
        try {
          imageUrl = await firebaseStorageRef.getDownloadURL();
        } catch (onError) {
          print("Error");
        }

        print(imageUrl);
      });

      Map<String, dynamic> item = {
        "imgUrl": imageUrl,
        "author": authorTextEditingController.text,
        "title": titleTextEditingController.text,
        "desc": descTextEditingController.text,
        "id": idTextEditingController.text
      };
      crudMethods.addData(item).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
      });
    }
  }

  TextEditingController titleTextEditingController =
      new TextEditingController();
  TextEditingController descTextEditingController = new TextEditingController();
  TextEditingController authorTextEditingController =
      new TextEditingController();
  TextEditingController idTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              uploadData();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload)),
          )
        ],
      ),
      body: isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Container(
                  child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: selectedImage != null
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 24),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              child:
                                  Image.file(selectedImage, fit: BoxFit.cover)),
                        )
                      : Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          margin: EdgeInsets.symmetric(vertical: 24),
                          width: MediaQuery.of(context).size.width,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                ),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: idTextEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter ID',
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: titleTextEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Title',
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: authorTextEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Author Name',
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: descTextEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description',
                  ),
                ),
              ])),
            ),
    );
  }
}
