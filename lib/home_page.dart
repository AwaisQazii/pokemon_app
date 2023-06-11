import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.pokemonList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: controller.offset,
                  itemBuilder: (context, index) {
                    if (index == controller.pokemonList.length - 1) {
                      controller.getPokemonData();

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final pokemon = controller.pokemonList[index];

                    return Card(
                        child: ListTile(
                      title: Text(
                        pokemon.name!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ));
                  },
                ),
        ),
      ),
    );
  }
}
