///this a appliaction that generate random image when we clcik next button in the application new random image is fetched and displayed on the 
///the screen i am using api [https://picsum.photos/400/300?random=${DateTime.now().millisecondsSinceEpoch}]
library;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Image Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageScreen(),
    );
  }
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    fetchRandomImage(); 
  }

  Future<void> fetchRandomImage() async {
    try {
      final response = await http.get(Uri.parse('https://picsum.photos/400/300?random=${DateTime.now().millisecondsSinceEpoch}'));
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            imageUrl = response.request!.url.toString();
          });
        }
      } else {
        throw Exception('Failed to load image');
      }
    } catch (error) {
      print('Error fetching image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Image Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    key: ValueKey(imageUrl),
                  )
                : const CircularProgressIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchRandomImage,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
