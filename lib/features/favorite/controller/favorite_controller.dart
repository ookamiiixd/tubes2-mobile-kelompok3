import 'package:flutter/material.dart';
import 'package:tubes2-mobile-kelompok3/core/global_component/searchview.dart';
import 'controller/favorite_controller.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
@@ -76,7 +79,7 @@ class FavoritesScreen extends StatelessWidget {
          return FavoriteCard(
            favorite: favorite,
            onDeleted: () {
              controller.searchResult.removeAt(index);
              controller.deleteFavorite(favorite.id);
            },
          );
        },
        import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes2-mobile-kelompok3/core/global_component/searchview.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
import 'package:get/get.dart';
import 'package:tubes2-mobile-kelompok3/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2-mobile-kelompok3/data/favorite/responsesmodel/favorite_responses_model_get.dart';
class FavoriteController extends GetxController {
  final FavoriteDatasource _datasource = FavoriteDatasource();
  RxList<FavoritesResponsesModelGet> favorites =
      <FavoritesResponsesModelGet>[].obs;
  RxList<FavoritesResponsesModelGet> searchResults =
      <FavoritesResponsesModelGet>[].obs;
  RxBool isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.searchResult.isEmpty) {
                  return const Center(child: Text('No favorites found.'));
                } else {
                  return _buildFavoriteList(controller);
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.fetchFavorite();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  void onInit() {
    super.onInit();
    fetchFavorite();
  }
  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kucing Favorite',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your favorite list cat',
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  Future<void> fetchFavorite() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getFavorite();
      if (result != null) {
        favorites.value = result;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
  Widget _buildFavoriteList(FavoriteController controller) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.searchResult.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final favorite = controller.searchResult[index];
          return FavoriteCard(
            favorite: favorite,
            onDeleted: () {
              controller.searchResult.removeAt(index);
            },
          );
        },
      ),
    );
  void searchFavorite(String query) {
    if (query.isEmpty) {
      searchResults.value = favorites;
    } else {
      searchResults.value = favorites
          .where((element) =>
              element.id.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
class FavoriteCard extends StatelessWidget {
  final String favorite;
  final VoidCallback onDeleted;
  const FavoriteCard({
    Key? key,
    required this.favorite,
    required this.onDeleted,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(favorite),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDeleted,
        ),
      ),
    );
  Future<void> deleteFavorite(int id) async {
    try {
      final result = await _datasource.deleteFavorite(id);
      if (result != null) {
        favorites.removeWhere((element) => element.id == id);
        searchResults.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete favorite: $e");
    }
  }
}