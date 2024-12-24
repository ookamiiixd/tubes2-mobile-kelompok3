import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes2_uas_kelompok/features/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderSection(),
              Expanded(
                child: Obx(() => controller.images.isNotEmpty
                    ? buildImageList(controller) : buildLoading()),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildHeaderSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Halo, Kucing Lovers!",
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Temukan Kucing lucu untuk dijadikan walpaper!",
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
Widget _buildImageList(HomeController controller) {
  return ListView.builder(
    itemCount: controller.images.length,
    itemBuilder: (context, index) {
      final image = controller.images[index];
      return HomeCard(
        image: image,
        onFavoritePressed: () => controller.onFavoritePressed(image.id),
        onLikePressed: () => controller.onLikePressed(image.id),
      );
    },
  );
}

Widget _buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

