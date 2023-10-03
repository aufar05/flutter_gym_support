import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// Impor file HomeScreen dan EquipmentScreen

import '../views/equipment_screen.dart';
import '../views/home_screen.dart';

class Navigasi extends StatefulWidget {
  const Navigasi({super.key});

  @override
  State<Navigasi> createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _buildBody(), // Gunakan fungsi _buildBody untuk menampilkan konten sesuai indeks _currentIndex
      bottomNavigationBar: SalomonBottomBar(
        selectedColorOpacity: 0.2,
        selectedItemColor: Colors.lightGreenAccent[400],
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Beranda'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.fitness_center),
            title: const Text('Alat'),
          ),
        ],
      ),
    );
  }

  // Fungsi ini akan mengembalikan widget yang sesuai berdasarkan _currentIndex
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen(); // Tampilkan Home Screen jika _currentIndex adalah 0
      case 1:
        return const EquipmentScreen(); // Tampilkan Equipment Screen jika _currentIndex adalah 1
      default:
        return Container(); // Fallback jika _currentIndex tidak sesuai dengan yang diharapkan
    }
  }
}
