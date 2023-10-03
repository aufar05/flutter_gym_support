import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_support/utils/tombole_equipment.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          'Alat',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.055,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(60),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              tombol_equipment(context, index);
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Container(
                color: Colors.lightGreenAccent,
                padding: const EdgeInsets.all(20),
                child: Image.asset(getImagePath(index)),
              ),
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk mendapatkan path gambar berdasarkan indeks
  String getImagePath(int index) {
    switch (index) {
      case 0:
        return 'lib/icons/dumbbell.png';
      case 1:
        return 'lib/icons/legPress.png';
      case 2:
        return 'lib/icons/pullUpBar.png';
      case 3:
        return 'lib/icons/benchPress.png';
      case 4:
        return 'lib/icons/latPullDown.png';
      case 5:
        return 'lib/icons/treadmill.png';
      default:
        return '';
    }
  }
}
