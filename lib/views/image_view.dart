import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:gym_support/utils/equipment_detail.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ObjectDetectionScreen extends StatefulWidget {
  const ObjectDetectionScreen({super.key});

  @override
  State<ObjectDetectionScreen> createState() => _ObjectDetectionScreenState();
}

class _ObjectDetectionScreenState extends State<ObjectDetectionScreen> {
  List<dynamic>? _recognitions;
  img.Image? _image;
  final String _model = 'assets/detect.tflite';
  final String _labels = 'assets/labelmap.txt';

  bool _isLoading = false;

  Future<void> _pickImageFromGallery() async {
    setState(() {
      _isLoading = true; // Aktifkan status loading
    });

    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      await detectObjectsInImage(imageFile);

      setState(() {
        _isLoading = false; // Matikan status loading
      });
    } else {
      setState(() {
        _isLoading = false; // Matikan status loading jika gambar tidak dipilih
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: _model,
        labels: _labels,
      );
      // ignore: empty_catches
    } on PlatformException {}
  }

  Future<void> detectObjectsInImage(File imageFile) async {
    final image = img.decodeImage(imageFile.readAsBytesSync());

    if (image != null) {
      final recognitions = await Tflite.detectObjectOnImage(
        path: imageFile.path,
        model: 'SSDMobileNet',
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5,
        numResultsPerClass: 1,
      );

      setState(() {
        _image = image;
        _recognitions = recognitions;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text('Object Detection'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_image != null)
            Image.memory(Uint8List.fromList(img.encodeJpg(_image!))),
          if (_recognitions != null && _recognitions!.isNotEmpty)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _recognitions!.map((res) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          res['detectedClass'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                            (res['confidenceInClass'] * 100)
                                    .toStringAsFixed(2) +
                                '%',
                            style: const TextStyle(color: Colors.white60)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailScreen(
                              title: 'Dumbbell',
                              imagePathTitle: "lib/images/gambarDumbbell.png",
                              imagePathAnatomi:
                                  "lib/images/anatomiOtot/fullBody.png",
                              description:
                                  "Dumbbell bisa digunakan untuk melatih full body",
                              videos: [
                                ExerciseVideo(
                                  imagePathVid:
                                      'lib/images/anatomiOtot/fullBody.png',
                                  title: 'Full Body ',
                                  videoUrl:
                                      'https://www.youtube.com/watch?v=xqVBoyKXbsA',
                                ),
                                ExerciseVideo(
                                  imagePathVid:
                                      'lib/images/anatomiOtot/upperBody.png',
                                  title: 'Upper Body ',
                                  videoUrl:
                                      'https://www.youtube.com/watch?v=NDOlPdyZLMg',
                                ),
                                ExerciseVideo(
                                  imagePathVid:
                                      'lib/images/anatomiOtot/lowerBody.png',
                                  title: 'Lower Body',
                                  videoUrl:
                                      'https://www.youtube.com/watch?v=Huq6i9gscrk',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            color: Colors.lightGreenAccent,
                            padding: const EdgeInsets.all(15),
                            height: 70,
                            child: Image.asset('lib/icons/dumbbell.png'),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                );
              }).toList(),
            )
          else if (_image != null)
            const Text('Alat Tidak Ditemukan',
                style: TextStyle(color: Colors.white)),
          if (_isLoading)
            const Center(
              child: SpinKitCircle(
                color: Colors.lightGreenAccent,
                size: 50.0,
              ),
            ),
          Center(
            child: ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: const Text('Pilih Gambar Dari Gallery'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
