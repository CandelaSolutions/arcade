import 'dart:async';
import 'dart:convert';
import 'package:arcade/structs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SteamAPI {
  static Future<User> getOwnedGames(int id, User user) async {
    final gameExtendedResponse = await http.get(
      Uri.parse(
        "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=$key&steamid=$API_KEY_STEAM",
      ),
    );
    if (gameExtendedResponse.statusCode == 200) {
      switch (jsonDecode(gameExtendedResponse.body) as Map<String, dynamic>) {
        case {
          'game_count': int gameCount,
          'games': List<Map<String, dynamic>> games,
        }:
          {
            return user;
          }
      }
    }
    throw Exception(
      'Error ${gameExtendedResponse.statusCode}: Failed to load user.',
    );
  }
}
