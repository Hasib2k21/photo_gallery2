import 'package:flutter/material.dart';
import 'package:photo_gallery2/Screen/photo_list_screen.dart';
class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhotoListScreen(),
    );
  }
}