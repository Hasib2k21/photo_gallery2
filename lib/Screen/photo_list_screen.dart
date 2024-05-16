
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery2/Photo_Information/photo.dart';
import 'package:photo_gallery2/Screen/photo_detail_screen.dart';
import 'package:photo_gallery2/API_Services/photo_service.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = PhotoService().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Photo Gallery App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: FutureBuilder<List<Photo>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No photos found'));
          }

          List<Photo> photos = snapshot.data!;
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(photos[index].thumbnailUrl),
                title: Text(photos[index].title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoDetailScreen(photo: photos[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}