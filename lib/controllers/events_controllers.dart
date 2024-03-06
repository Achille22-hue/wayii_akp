import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayii/controllers/user_controllers.dart';

class EventsController extends GetxController {
  final String url = "https://goudo-wayii.onrender.com/api";
  late Rx<List<Map<String, dynamic>>> eventsList =
      Rx<List<Map<String, dynamic>>>([]);
  late Rx<List<Map<String, dynamic>>> wishlist =
      Rx<List<Map<String, dynamic>>>([]);
  late UserController _userController;
  late Rx<bool> isLoading = Rx<bool>(true);
  late Rx<bool> isLoadingwishlist = Rx<bool>(true);

  @override
  void onInit() async {
    super.onInit();
    _userController = Get.find<UserController>();
    await getEvents();
    await initializeEvents();
    await initializeWishlist();
  }

  Future<void> initializeEvents() async {
    final String endpointevents =
        '$url/events?populate=*&pagination[page]=1&pagination[pageSize]=10';
    final String? token = await _userController.getToken();
    if (token != null) {
      try {
        final response = await http.get(
          Uri.parse(endpointevents),
          headers: {'Authorization': 'Bearer $token'},
        );
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          eventsList.value = List<Map<String, dynamic>>.from(data["results"]);
          saveEvent(eventsList.value);
          isLoading.value = false;
          update();
        }
      } catch (e) {
        print('Une exception s\'est produite lors de la requête: $e');
      }
    }
  }

  Future<void> initializeWishlist() async {
    final String endpointevents = '$url/my/events-wishlist';
    final String? token = await _userController.getToken();
    if (token != null) {
      try {
        isLoadingwishlist.value = true;
        final response = await http.get(
          Uri.parse(endpointevents),
          headers: {'Authorization': 'Bearer $token'},
        );
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          wishlist.value = List<Map<String, dynamic>>.from(data["results"]);
          isLoadingwishlist.value = false;
          update();
        } else {
          isLoadingwishlist.value = false;
          update();
          print(jsonDecode(response.body));
        }
      } catch (e) {
        print('Une exception s\'est produite lors de la requête: $e');
      }
    }
  }

  Future<void> addWishlist(idEvent) async {
    final String endpointevents = '$url/my/events-wishlist/toggle';
    final String? token = await _userController.getToken();
    if (token != null) {
      try {
        final response = await http.post(Uri.parse(endpointevents),
            headers: {'Authorization': 'Bearer $token'},
            body: {"event": idEvent.toString()});
        if (response.statusCode == 200) {}
      } catch (e) {
        // ignore: avoid_print
        print('Une exception s\'est produite lors de la requête: $e');
      }
    }
  }

  Future<void> saveEvent(List<Map<String, dynamic>> eventList) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryDate = DateTime.now().add(const Duration(days: 3));
    final eventListJson = eventList.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList("events", eventListJson);
    await prefs.setString('events_expiry', expiryDate.toIso8601String());
  }

  Future<void> getEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final eventListJson = prefs.getStringList("events");
    if (eventListJson == null) {
      eventsList.value = [];
      update();
      return;
    }
    final eventList = eventListJson
        .map((e) => json.decode(e) as Map<String, dynamic>)
        .toList();
    eventsList.value = eventList;
    isLoading.value = false;
    update();
  }
}
