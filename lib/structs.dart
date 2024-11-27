import 'package:flutter/material.dart';

class User {
  ServiceData<String> username = ServiceData<String>();
  ServiceData<Image> avatar = ServiceData<Image>();
  ServiceData<String> description = ServiceData<String>();
  ServiceData<DateTime> joindate = ServiceData<DateTime>();
  List<Game>? games;
}

class Game {
  ServiceData<int> id = ServiceData<int>();
  ServiceData<Image> gridArt = ServiceData<Image>();
  ServiceData<Image> heroArt = ServiceData<Image>();
  ServiceData<Image> logoArt = ServiceData<Image>();
  ServiceData<Image> iconArt = ServiceData<Image>();
}

class ServiceData<T> {
  T? googleDrive;
  T? epicGames;
  T? gog;
  T? microsoft;
  T? retroachievements;
  T? steam;

  T? available() {
    if (googleDrive != null) {
      return googleDrive!;
    } else if (steam != null) {
      return steam!;
    } else if (retroachievements != null) {
      return retroachievements!;
    } else if (gog != null) {
      return gog!;
    } else if (epicGames != null) {
      return epicGames!;
    } else if (microsoft != null) {
      return microsoft!;
    }
    return null;
  }
}
