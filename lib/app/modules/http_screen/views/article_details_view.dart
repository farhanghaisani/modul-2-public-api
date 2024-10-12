import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/product_model.dart'; // Sesuaikan dengan path model artikel

class ArticleDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Article article = Get.arguments; // Ambil data artikel yang dikirim

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null && article.urlToImage.isNotEmpty
                ? Image.network(
              article.urlToImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey,
                child: const Center(child: Text('Tidak Ada Gambar')),
              ),
            )
                : Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey,
              child: const Center(child: Text('Tidak Ada Gambar')),
            ),
            const SizedBox(height: 16),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.date_range, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  article.publishedAt.toLocal().toString().split(' ')[0],
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(width: 16),
                Icon(Icons.person, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  article.author.isNotEmpty ? article.author : 'Penulis Tidak Diketahui',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              article.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              article.content != null && article.content.isNotEmpty
                  ? article.content
                  : 'Konten tidak tersedia.',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
