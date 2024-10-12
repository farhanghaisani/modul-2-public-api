import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/http_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../data/model/product_model.dart'; // Import model artikel


class HttpView extends GetView<HttpController> {
  const HttpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.web),
            onPressed: () => Get.toNamed(Routes.WEBVIEW), // Navigasi ke halaman WebView
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    article.urlToImage != null && article.urlToImage.isNotEmpty
                        ? Image.network(
                      article.urlToImage,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey,
                        child: const Center(
                          child: Text(
                            'No Image',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                        : Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey,
                      child: const Center(
                        child: Text(
                          'No Image',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
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
                                article.author.isNotEmpty
                                    ? article.author
                                    : 'Unknown Author',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            article.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Navigasi ke ArticleDetailsView, dengan mengirim data artikel
                              Get.toNamed(Routes.ARTICLE_DETAILS, arguments: article);
                            },
                            child: const Text('Read more'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
