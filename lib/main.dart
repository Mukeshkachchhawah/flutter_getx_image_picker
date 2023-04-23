import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePagetState();
}

class _MyHomePagetState extends State<MyHomePage> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Image Picker Add "),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(border: Border.all()),
                child: file == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : Image.file(
                        file!,
                        fit: BoxFit.fill,
                      )),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                getgellary();
              },
              color: Colors.blue,
              child: Text("Chose Image Gallery"),
            ),
            MaterialButton(
              onPressed: () {
                getcamera();
              },
              color: Colors.blue,
              child: Text("Chose Image camera"),
            ),
          ],
        ),
      ),
    );
  }

  getcamera() async {
    var images = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(images!.path);
    });
  }

  getgellary() async {
    var images = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(images!.path);
    });
  }
}
