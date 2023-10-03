import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_support/controller/scan_controller.dart';
import 'package:gym_support/utils/equipment_detail.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? Column(
                    children: [
                      Stack(
                        children: [
                          CameraPreview(controller.cameraController),
                          Positioned(
                            top: (controller.y) * 600,
                            left: (controller.x) * 400,
                            child: Container(
                              height: controller.h * 100 * context.height / 100,
                              width: controller.w * 100 * context.width / 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 4)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      color: Colors.white,
                                      child: Text(controller.label))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: controller.label
                            .isNotEmpty, // Tampilkan hanya jika label tidak kosong
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ExerciseDetailScreen(
                                  title: 'Dumbbell',
                                  imagePathTitle:
                                      "lib/images/gambarDumbbell.png",
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
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              color: Colors.lightGreenAccent,
                              padding: const EdgeInsets.all(15),
                              height: 80,
                              child: Image.asset('lib/icons/dumbbell.png'),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : const Center(child: Text('Loading preview'));
          }),
    );
  }
}
