import 'dart:async';
import 'package:arcade/APIs/retroacievements.dart';
import 'package:arcade/structs.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  late Future<Game> futureGame;

  @override
  void initState() {
    super.initState();
    futureGame = RetroacievementsAPI.getGameExtended(10113, Game());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSurface,
    );
    /*return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),);*/

    return Center(
      child: FutureBuilder<Game>(
        future: futureGame,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.gridArt.available()!;
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator(color: Colors.white);
        },
      ),
    );
  }
}

// Services:
// Google Drive (for games not on services)
// Epic (if it's easy)
// GOG (for Eberron: Dragonshards)
// Microsoft (for Minecraft)
// Retroacievements
// Steam

// Also steamgriddb for selecting alternate covers for stuff
