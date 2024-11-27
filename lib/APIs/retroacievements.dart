import 'dart:async';
import 'dart:convert';
import 'package:arcade/structs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RetroacievementsAPI {
  static Future<Game> getGameExtended(int id, Game game) async {
    final gameExtendedResponse = await http.get(
      Uri.parse(
        "https://retroachievements.org/API/API_GetGameExtended.php?i=$id&y=$API_KEY_RETROACHIEVEMENTS",
      ),
    );
    if (gameExtendedResponse.statusCode == 200) {
      switch (jsonDecode(gameExtendedResponse.body) as Map<String, dynamic>) {
        case {
          'ImageBoxArt': String gridArtAddress,
          'ImageIngame': String heroArtAddress,
          'ImageTitle': String logoArtAddress,
          'ImageIcon': String iconArtAddress,
        }:
          {
            game.id.retroachievements = id;
            game.gridArt.retroachievements = Image.network(
              'https://retroachievements.org$gridArtAddress',
            );
            game.heroArt.retroachievements = Image.network(
              'https://retroachievements.org$heroArtAddress',
            );
            game.logoArt.retroachievements = Image.network(
              'https://retroachievements.org$logoArtAddress',
            );
            game.iconArt.retroachievements = Image.network(
              'https://retroachievements.org$iconArtAddress',
            );
            return game;
          }
      }
    }
    throw Exception(
      'Error ${gameExtendedResponse.statusCode}: Failed to load game.',
    );
  }
}
