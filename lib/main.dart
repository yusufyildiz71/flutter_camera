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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  final double padding = 20.0;
  
  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video ekranı",),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ListView(
          children: [
            /*SizedBox(height: padding,),
            ElevatedButton(onPressed: pickImage, child: const Text("Pick Image")),
            SizedBox(height: padding/2,),
            ElevatedButton(onPressed: capturePhoto, child: const Text("Capture Photo")),
            SizedBox(height: padding/2,),
            ElevatedButton(onPressed: pickVideo, child: const Text("Pick Video")),
            SizedBox(height: padding/2,), */
            ElevatedButton(onPressed: captureVideo, child: const Text("KAYIT")),
            /*SizedBox(height: padding/2,),
            ElevatedButton(onPressed: pickMultipleImages, child: const Text("Pick Multiple Images")),
            SizedBox(height: padding/2,),
            pickedFile!=null? Image.file(File(pickedFile!.path)) : Container(),
            pickedFile!=null? SizedBox(height: padding,) : Container(), */
          ],
        ),
      ),
    );
  }

  /// Resim seç
  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedFile = image;
      });
    }
  }

  /// Fotoğraf Çek
  void capturePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        pickedFile = photo;
      });
    }
  }

  /// Video seç
  void pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        pickedFile = video;
      });
    }
  }

  /// Video çek
  void captureVideo() async {
    final XFile? capturedVideo = await _picker.pickVideo(source: ImageSource.camera);
    if (capturedVideo != null) {
      setState(() {
        pickedFile = capturedVideo;
      });
    }
  }

  /// Birden çok resim seç
  void pickMultipleImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    
  }

}
