import 'package:flutter/material.dart';
import 'package:parvaz_event/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const TextStyle defaultTextStyle = TextStyle(fontFamily: 'IranYekan', color: Colors.white);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: defaultTextStyle.copyWith(
              fontSize: 96, fontWeight: FontWeight.w300),
          displayMedium: defaultTextStyle.copyWith(
              fontSize: 60, fontWeight: FontWeight.w400),
          displaySmall: defaultTextStyle.copyWith(
              fontSize: 48, fontWeight: FontWeight.w400),
          headlineMedium: defaultTextStyle.copyWith(
              fontSize: 34, fontWeight: FontWeight.w400),
          headlineSmall: defaultTextStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.w400),
          titleLarge: defaultTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600),
          titleMedium: defaultTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.w500),
          bodyLarge: defaultTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400),
          bodyMedium: defaultTextStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400),
          bodySmall: defaultTextStyle.copyWith(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white38),
          labelLarge: defaultTextStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w500),
        ),
        colorScheme: const ColorScheme.dark(
          primary: LightTheme.primaryColor,
          onPrimary: LightTheme.onPrimaryColor,
          primaryContainer: LightTheme.primaryVariantColor,
          onPrimaryContainer: LightTheme.onPrimaryVariantColor,
          surface: LightTheme.surfaceColor,
          onSurface: LightTheme.onSurfaceColor,
          background: LightTheme.backgroundColor,
          onBackground: LightTheme.onBackgroundColor
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(LightTheme.primaryColor), foregroundColor: MaterialStatePropertyAll(LightTheme.onPrimaryColor), )
        ),
        dividerTheme: const DividerThemeData(color: Colors.grey, indent: 12, endIndent: 12, space: 0)
      ),
      // home: const Home()
    );
  }
}
