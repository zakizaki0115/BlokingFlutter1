import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'changenotifier.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Favorites is Empty'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: IconButton(
              onPressed: () {
                setState(() {
                  appState.favorites.remove(pair);
                  appState.alllist.remove(pair);
                });
              },
              icon: Icon(Icons.delete),
            ),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
