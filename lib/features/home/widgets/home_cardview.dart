
import'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import'package:tubes2_uas_kelompok3/data/breeds/responsesmodel/breeds_responses_model

class HomeCard extends StatelessWidget {
final BreedsResponsesModel image;
final VoidCallback onFavoritePressed;
final voidCallback onLikePressed;
const homeCard({super.key, required this.image, required this.onFavoritePressed, required this.onLikePressed})

@override
widget build(BuilContext context){
return Card(
  color: Colors.blue,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        _buildTextSection(),
        const SizedBox(height: 10),
        buildActionSection(),
      ],
    ),
  ),
);
Widget _buildTextSection() {
  return Column(
    children: [
      Text(
       "Nama Kucing : $(image.name)",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Text(
       "Deskripsi Kucing : $(image.description)",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    ],
  );
}
Widget _buildActionSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: onFavoritePressed,
        icon: const Icon(Icons.favorite),
      ),
      IconButton(
        onPressed: onLikePressed,
        icon: const Icon(Icons.thumb_up),
      ),
    ],
  );
}
