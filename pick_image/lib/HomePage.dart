import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String path = "";
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('imagePicker'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () async {
                    final pickedFile =await picker.pickImage(source: ImageSource.gallery) ;
                    if(pickedFile != null){
                      setState(() {
                        path = pickedFile.path;
                      });
                    }
                  },
                  child: Text('Select Pic')),
            ),
            path!= "" ?
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Image.file(File(path),height: 300,),
                ):Container()
          ],
        ),
      ),
    );
  }
}
