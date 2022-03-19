import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


   File? _Image;

   @override
   void initState() {
     super.initState();
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: Row(
       children: [
         Column(
           children: [
             CircleAvatar(
               backgroundColor: Colors.deepPurple,
               backgroundImage:_Image == null ? null : Image.file(_Image as File).image ,
               radius: 75,
               child: (_Image != null)?
               Container()
               :GestureDetector(
                 onTap: pickimage,
                 child:Icon(Icons.add,size: 60,),
                   )
             )
           ],
         )
       ],
     ),
    );
  }
Future<void> pickimage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery).then((i){
    setState(() {
      _Image = i as File;
      log('image');
    });
  });

}

}
