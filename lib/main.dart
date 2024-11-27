import 'dart:io';

import 'package:arcade/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

void main() {
  runApp(App());
  doWhenWindowReady(() {
    appWindow.title = "Arcade";
    appWindow.show();
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Arcade',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.dark(
            primary: Color.fromARGB(255, 129, 0, 32),
            secondary: Color.fromARGB(255, 202, 48, 45),
          ),
        ),
        home: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 129, 0, 32),
                Color.fromARGB(255, 202, 48, 45),
              ],
              stops: [0, 1],
            ),
          ),
          child: Column(
            children: [
              if (kIsWeb)
                SizedBox(height: 4)
              else if (Platform.isWindows)
                WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: MoveWindow(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Icon(Symbols.joystick),
                              ),
                              Text(
                                "Arcade",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      WindowButtons(),
                    ],
                  ),
                )
              else if (Platform.isAndroid)
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
              Expanded(child: Library()),
            ],
          ),
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
            mouseOver: Color.fromARGB(255, 129, 0, 32),
            iconNormal: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
            mouseOver: Color.fromARGB(255, 129, 0, 32),
            iconNormal: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        CloseWindowButton(
          colors: WindowButtonColors(
            iconNormal: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ],
    );
  }
}

class AppState extends ChangeNotifier {}
