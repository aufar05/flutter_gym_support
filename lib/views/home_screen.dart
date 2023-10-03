import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_support/views/camera_view.dart';
import 'package:gym_support/views/image_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          'Beranda',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                  letterSpacing: 1)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ObjectDetectionScreen(),
                  ),
                );
              },
              icon: const Column(
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 60,
                  ),
                  Text(
                    'Deteksi alat dengan gambar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              label: const SizedBox
                  .shrink(), // Untuk menghilangkan label bawaan TextButton
            ),
            const SizedBox(
              height: 12,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraView(),
                  ),
                );
              },
              icon: const Column(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 60,
                  ),
                  Text(
                    'Deteksi alat dengan kamera',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              label: const SizedBox
                  .shrink(), // Untuk menghilangkan label bawaan TextButton
            ),
          ],
        ),
      ),
    );
  }
}
