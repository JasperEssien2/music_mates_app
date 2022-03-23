import 'package:flutter/material.dart';
import 'package:music_mates_app/presentation/presentation_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Mates',
      theme: _themeData(context),
      home: const GetStartedScreen(),
      routes: {
        Routes.home: (context) => const HomeScreen(),
        Routes.selectArtist: (context) => const SelectFavouriteArtist(),
      },
    );
  }

  ThemeData _themeData(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    final bottomSheetTheme = BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color(0xff51361a),
      elevation: 5,
    );

    final lightTheme = ThemeData(
      cardColor: Colors.grey[300],
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: bottomSheetTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: titleTextStyle.copyWith(
          color: const Color(0xff232323),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff232323),
        ),
      ),
      colorScheme: const ColorScheme.light(),
    );
    return lightTheme;
  }
}

class Routes {
  Routes._();

  static String home = "HomeScreen";
  static String selectArtist = "SelectArtist";
}
