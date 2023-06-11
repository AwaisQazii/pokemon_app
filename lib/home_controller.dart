import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/pokemon_model.dart';
import 'package:pokemon_app/service.dart';

class HomeController extends GetxController {
  int offset = 0;
  RxList<Pokemon> pokemonList = <Pokemon>[].obs;

  Future<void> getPokemonData() async {
    final response = await ApiService.getData(offset);
    if (response != null) {
      final data = jsonDecode(response);
      final resultList = List<Pokemon>.from(data['results'].map((e) => Pokemon.fromJson(e))).toList();

      pokemonList.addAll(resultList);

      offset += 10;
    } else {
      debugPrint("error");
    }
  }

  @override
  void onInit() {
    getPokemonData();
    super.onInit();
  }
}
