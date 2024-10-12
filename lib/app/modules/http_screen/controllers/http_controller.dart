import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/model/product_model.dart';  // Adjusted import

class HttpController extends GetxController {
  static const String _baseUrl = 'https://my-json-server.typicode.com/Fallid/codelab-api/db';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final welcomeResponse = welcomeFromJson(response.body);
        articles.value = welcomeResponse.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
