import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTFLite();
  }

  @override
  void onClose() {
    // Dispose of resources in the correct order
    cameraController.dispose();
    Tflite.close();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  var x = 0.0;
  var y = 0.0;
  var w = 0.0;
  var h = 0.0;
  var label = "";

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      try {
        cameras = await availableCameras();

        cameraController = CameraController(cameras[0], ResolutionPreset.max);
        await cameraController.initialize().then((value) {
          cameraController.startImageStream((image) {
            cameraCount++;
            if (cameraCount % 10 == 0) {
              cameraCount = 0;
              objectDetector(image);
            }
            update();
          });
        });
        isCameraInitialized(true);
        update();
      } catch (e) {
        // ignore: avoid_print
        print('Camera initialization failed: $e');
      }
    } else {
      // ignore: avoid_print
      print('Camera permission denied');
    }
  }

  initTFLite() async {
    await Tflite.loadModel(
        model: 'assets/detect.tflite',
        labels: 'assets/labelmap.txt',
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false);
  }

  objectDetector(CameraImage image) async {
    var recognitions = await Tflite.detectObjectOnFrame(
      bytesList: image.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      model: "SSDMobileNet",
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      threshold: 0.5,
      asynch: true,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      var detectedObject = recognitions.first;
      if (detectedObject['confidenceInClass'] * 100 > 99) {
        label = detectedObject['detectedClass'].toString();
        h = detectedObject['rect']['h'];
        w = detectedObject['rect']['w'];
        x = detectedObject['rect']['x'];
        y = detectedObject['rect']['y'];
      }
      update();
    } else {
      // Tindakan yang akan diambil jika recognitions kosong atau null
      label = "";
      h = 0.0;
      w = 0.0;
      x = 0.0;
      y = 0.0;
    }
  }
}
