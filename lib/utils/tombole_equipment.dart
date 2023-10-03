import 'package:flutter/material.dart';
import 'package:gym_support/utils/equipment_detail.dart';

// ignore: non_constant_identifier_names
void tombol_equipment(BuildContext context, int index) {
  String title = "";
  String description = "";
  String imagePathTitle = "";
  String imagePathAnatomi = "";
  List<ExerciseVideo> videos =
      []; // Buat daftar ExerciseVideo sesuai dengan indeks

  if (index == 0) {
    title = "Dumbbell";
    imagePathTitle = "lib/images/gambarDumbbell.png";
    imagePathAnatomi = "lib/images/anatomiOtot/fullBody.png";
    description = "Dumbbell bisa digunakan untuk melatih otot seluruh tubuh";
    videos = [
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/fullBody.png',
        title: 'Seluruh Tubuh ',
        videoUrl: 'https://www.youtube.com/watch?v=xqVBoyKXbsA',
      ),
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/upperBody.png',
        title: 'Tubuh Bagian Atas ',
        videoUrl: 'https://www.youtube.com/watch?v=NDOlPdyZLMg',
      ),
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/lowerBody.png',
        title: 'Tubuh Bagian Bawah',
        videoUrl: 'https://www.youtube.com/watch?v=Huq6i9gscrk',
      ),
    ];
  }

  if (index == 1) {
    title = "Leg Press";
    imagePathTitle = "lib/images/gambarLegPress.png";
    imagePathAnatomi = "lib/images/anatomiOtot/legBody.png";
    description = "Leg Press bisa digunakan untuk melatih otot paha";
    videos = [
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/legBody.png',
        title: 'Otot Paha',
        videoUrl: 'https://www.youtube.com/watch?v=TKhrxoOjS3s',
      ),
    ];
  }

  if (index == 2) {
    title = "Pull Up";
    imagePathTitle = "lib/images/gambarPullup.png";
    imagePathAnatomi = "lib/images/anatomiOtot/pullBody.png";
    description =
        "Pull up bar bisa digunakan untuk melatih abs  ,  tubuh bagian atas (terutama belakang)";
    videos = [
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/pullBodynoAbs.png',
        title: 'Tubuh Bagian Atas',
        videoUrl: 'https://www.youtube.com/watch?v=eGo4IYlbE5g',
      ),
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/absBody.png',
        title: 'Abs',
        videoUrl: 'https://www.youtube.com/watch?v=0RIc7oLnwo8',
      ),
    ];
  }

  if (index == 3) {
    title = "Bench Press";
    imagePathTitle = "lib/images/gambarBenchpress.png";
    imagePathAnatomi = "lib/images/anatomiOtot/chestBody.png";
    description = "Bench Press bisa digunakan untuk melatih otot dada";
    videos = [
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/chestBody.png',
        title: 'Otot Dada',
        videoUrl: 'https://www.youtube.com/watch?v=4Y2ZdHCOXok',
      ),
    ];
  }

  if (index == 4) {
    title = "Latpull Down Machine";
    imagePathTitle = "lib/images/gambarLatpulldown.png";
    imagePathAnatomi = "lib/images/anatomiOtot/latPullMuscle.png";
    description =
        "Lat pull down machine melatih tubuh bagian atas fokusnya di latissimus (bagian atas belakang punggung)";
    videos = [
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/latPullMuscle.png',
        title: 'Tubuh Bagian Atas',
        videoUrl: 'https://www.youtube.com/watch?v=k0YcRBxmr-8',
      ),
    ];
  }

  if (index == 5) {
    title = "Treadmill";
    imagePathTitle = "lib/images/gambarBenchpress.png";
    imagePathAnatomi = "lib/images/anatomiOtot/treadmillBody.png";
    description =
        "Treadmill bisa digunakan untuk melatih Tubuh bagian bawah yaitu otot paha dan betis bagian belakang serta mengurangi body fat";
    videos = [
      ExerciseVideo(
        imagePathVid: 'lib/images/anatomiOtot/treadmillBody.png',
        title: 'Tubuh Bagian Bawah',
        videoUrl: 'https://www.youtube.com/watch?v=n4I_fmegTRk',
      ),
    ];
  }

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ExerciseDetailScreen(
        title: title,
        description: description,
        imagePathTitle: imagePathTitle,
        imagePathAnatomi: imagePathAnatomi,
        videos: videos,
      ),
    ),
  );
}
