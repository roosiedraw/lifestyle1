// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifestyle/utils/constants.dart';

class RegisterPage5 extends StatefulWidget {
  double values = 0.0;
  RegisterPage5({required this.values});

  @override
  State<RegisterPage5> createState() => _RegisterPage5State();
}

class _RegisterPage5State extends State<RegisterPage5> {
  double values5 = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values5 = widget.values;
  }

  List<File> selectedImages = [];
  List<File> selectedImagesNaughty = [];
  String _imagepath = '';
  final ImagePicker imgpicker = ImagePicker();
  Future getImageFromCamera() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imagepath = pickedFile.path;
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking image.");
    }
  }

  Future getImageFromGallery() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imagepath = pickedFile.path;
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking image.");
    }
  }

  Future getImages() async {
    final pickedFile = await imgpicker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }

  Future getImagesNaughty() async {
    final pickedFile = await imgpicker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesNaughty.add(File(xfilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: mainThemeColor,
            appBar: Tab(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black45))),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TweenAnimationBuilder(
                            tween: Tween(
                                end:
                                    0.01), // change this from 0.0 to 1.0 and hot reload
                            duration: const Duration(seconds: 1),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromARGB(255, 133, 3, 46),
                                  minHeight: 8,
                                  value: values5);
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Lets see your photos",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: secondTextColor),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: FileImage(File(_imagepath)),
                              ),
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                          height: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    getImageFromCamera();
                                                  },
                                                  icon: Icon(Icons.photo)),
                                              IconButton(
                                                  onPressed: () {
                                                    getImageFromGallery();
                                                  },
                                                  icon: Icon(Icons.photo_album))
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Icon(
                                        Icons.image,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: 4,
                                        left: 10,
                                      ),
                                      child: Text('Add profle picture'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black45))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You can add your casual photos",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: secondTextColor),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          // TO change button color
                          child: const Text(
                              'Select Image from Gallery and Camera'),
                          onPressed: () {
                            getImages();
                          },
                        ),
                        SizedBox(
                          width:
                              300.0, // To show images in particular area only
                          child: selectedImages
                                  .isEmpty // If no images is selected
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Center(
                                        child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/profile.png"),
                                          height: 100,
                                          width: 100,
                                        ),
                                        Text(
                                          'Please Add Some Photos!',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    )),
                                  ),
                                )
                              // If atleast 1 images is selected
                              : GridView.builder(
                                  itemCount: selectedImages.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3
                                          // Horizontally only 3 images will show
                                          ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // TO show selected file
                                    return Center(
                                        child: kIsWeb
                                            ? Image.network(
                                                selectedImages[index].path)
                                            : Image.file(
                                                selectedImages[index]));
                                    // If you are making the web app then you have to
                                    // use image provider as network image or in
                                    // android or iOS it will as file only
                                  },
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black45))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You can add your Naughty photos",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: secondTextColor),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondTextColor)),
                          // TO change button color
                          child: Icon(Icons.add_photo_alternate_outlined),
                          onPressed: () {
                            getImagesNaughty();
                          },
                        ),
                        SizedBox(
                          width:
                              300.0, // To show images in particular area only
                          child: selectedImagesNaughty
                                  .isEmpty // If no images is selected
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage("assets/images/ero.png"),
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text(
                                        'Please Add Some Naughty Photos!',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                                )
                              // If atleast 1 images is selected
                              : GridView.builder(
                                  itemCount: selectedImagesNaughty.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3
                                          // Horizontally only 3 images will show
                                          ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // TO show selected file
                                    return Center(
                                        child: kIsWeb
                                            ? Image.network(
                                                selectedImagesNaughty[index]
                                                    .path)
                                            : Image.file(
                                                selectedImagesNaughty[index]));
                                    // If you are making the web app then you have to
                                    // use image provider as network image or in
                                    // android or iOS it will as file only
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
