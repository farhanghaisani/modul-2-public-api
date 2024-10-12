import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CARA LIHAT BERITA"),
            const SizedBox(height: 16),
            const Text("1. klik tombol lihat artikel untuk melihat berita"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke HttpView
                Get.toNamed(Routes.HTTP);
              },
              child: const Text('Lihat Artikel'),
            ),
          ],
        ),
      ),
    );
  }
}
