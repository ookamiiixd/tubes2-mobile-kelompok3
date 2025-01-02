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