import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseVideo {
  final String imagePathVid;
  final String title;
  final String videoUrl;

  ExerciseVideo({
    required this.title,
    required this.videoUrl,
    required this.imagePathVid,
  });
}

class ExerciseDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePathTitle;
  final String imagePathAnatomi;
  final List<ExerciseVideo> videos;

  const ExerciseDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePathTitle,
    required this.videos,
    required this.imagePathAnatomi,
  });

  Future<void> _launchVideoUrl(String url) async {
    final Uri videoUri = Uri.parse(url);
    if (!await launchUrl(videoUri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.elliptical(200, 40),
              bottomLeft: Radius.elliptical(200, 40),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightGreenAccent.shade100,
                    Colors.lightGreenAccent.shade100,
                    Colors.lightGreenAccent.shade100,
                    Colors.lightGreenAccent.shade100,
                    Colors.lightGreenAccent.shade200,
                    Colors.lightGreenAccent.shade200,
                    Colors.lightGreenAccent.shade200,
                    Colors.lightGreenAccent.shade200,
                    Colors.lightGreenAccent.shade400,
                    Colors.lightGreenAccent.shade400,
                    Colors.lightGreenAccent.shade700,
                    Colors.lightGreenAccent.shade700,
                    Colors.transparent,
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(200, 60),
                  bottomLeft: Radius.elliptical(200, 60),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePathTitle),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.75),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        title,
                        style: GoogleFonts.bebasNeue(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.055,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  description,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.1,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Image.asset(
                imagePathAnatomi,
                height: 200,
                width: 150,
              ),
            ],
          ),
          Text(
            'Tips cara latihan dengan $title',
            style: GoogleFonts.cabin(
              textStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: 0.1,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return Card(
                  color: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      leading: Image.asset(
                        video.imagePathVid,
                        height: 60,
                        width: 60,
                      ),
                      title: Text(
                        video.title,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.1,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () async {
                          await _launchVideoUrl(video.videoUrl);
                        },
                        child: const Icon(
                          Icons.ondemand_video,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
