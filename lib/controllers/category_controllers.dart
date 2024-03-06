import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryController extends GetxController {
  final String url = "https://goudo-wayii.onrender.com/api";
  late Rx<List<Map<String, dynamic>>> categoriesList =
      Rx<List<Map<String, dynamic>>>([]);
  late Rx<bool> isLoading = Rx<bool>(true);

  @override
  void onInit() async {
    super.onInit();
    await getCat();
    await initializeCategoriesPagination();
  }

  Future<void> initializeCategoriesPagination() async {
    final String endpointCategories =
        '$url/categories?populate=*&pagination=1&pagination=10';
    try {
      final response = await http.get(
        Uri.parse(endpointCategories),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        categoriesList.value = List<Map<String, dynamic>>.from(data["results"]);
        saveCat(categoriesList.value);
        isLoading.value = false;
        update();
      }
    } catch (e) {
      // ignore: avoid_print
      print('Une exception s\'est produite lors de la requête: $e');
    }
  }

  Future<void> saveCat(List<Map<String, dynamic>> catList) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryDate = DateTime.now().add(const Duration(days: 3));
    final catListJson = catList.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList("cats", catListJson);
    await prefs.setString('cats_expiry', expiryDate.toIso8601String());
  }

  Future<void> getCat() async {
    final prefs = await SharedPreferences.getInstance();
    final catListJson = prefs.getStringList("cats");
    if (catListJson == null) {
      categoriesList.value = [];
      update();
      return;
    }
    final catList =
        catListJson.map((e) => json.decode(e) as Map<String, dynamic>).toList();
    categoriesList.value = catList;
    isLoading.value = false;
    update();
  }
}
