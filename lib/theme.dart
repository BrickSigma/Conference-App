import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7c580d),
      surfaceTint: Color(0xff7c580d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdeac),
      onPrimaryContainer: Color(0xff604100),
      secondary: Color(0xff485d92),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdae2ff),
      onSecondaryContainer: Color(0xff304578),
      tertiary: Color(0xff904a41),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdad5),
      onTertiaryContainer: Color(0xff73342c),
      error: Color(0xff904a41),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff73342c),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff1a1b21),
      onSurfaceVariant: Color(0xff44464f),
      outline: Color(0xff757780),
      outlineVariant: Color(0xffc5c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xfff0bf6d),
      primaryFixed: Color(0xffffdeac),
      onPrimaryFixed: Color(0xff281900),
      primaryFixedDim: Color(0xfff0bf6d),
      onPrimaryFixedVariant: Color(0xff604100),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff001947),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff304578),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff3b0906),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff73342c),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4a3100),
      surfaceTint: Color(0xff7c580d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8d661d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1e3466),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff576ca1),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5e241d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa2594f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e241d),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa2594f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff101116),
      onSurfaceVariant: Color(0xff34363e),
      outline: Color(0xff50525a),
      outlineVariant: Color(0xff6b6d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xfff0bf6d),
      primaryFixed: Color(0xff8d661d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff714e02),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff576ca1),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3e5387),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa2594f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff844139),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6c6cd),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffe8e7ef),
      surfaceContainerHigh: Color(0xffdddce3),
      surfaceContainerHighest: Color(0xffd1d1d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3d2800),
      surfaceTint: Color(0xff7c580d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff634300),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff112a5c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff32477b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff511a14),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff76362e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a14),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2c33),
      outlineVariant: Color(0xff474951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xfff0bf6d),
      primaryFixed: Color(0xff634300),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff462e00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff32477b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff193063),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff76362e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff59201a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb8b8bf),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f0f7),
      surfaceContainer: Color(0xffe2e2e9),
      surfaceContainerHigh: Color(0xffd4d4db),
      surfaceContainerHighest: Color(0xffc6c6cd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff0bf6d),
      surfaceTint: Color(0xfff0bf6d),
      onPrimary: Color(0xff432c00),
      primaryContainer: Color(0xff604100),
      onPrimaryContainer: Color(0xffffdeac),
      secondary: Color(0xffb1c5ff),
      onSecondary: Color(0xff172e60),
      secondaryContainer: Color(0xff304578),
      onSecondaryContainer: Color(0xffdae2ff),
      tertiary: Color(0xffffb4a9),
      onTertiary: Color(0xff561e18),
      tertiaryContainer: Color(0xff73342c),
      onTertiaryContainer: Color(0xffffdad5),
      error: Color(0xffffb4a9),
      onError: Color(0xff561e18),
      errorContainer: Color(0xff73342c),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff121318),
      onSurface: Color(0xffe2e2e9),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color(0xff8f9099),
      outlineVariant: Color(0xff44464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff7c580d),
      primaryFixed: Color(0xffffdeac),
      onPrimaryFixed: Color(0xff281900),
      primaryFixedDim: Color(0xfff0bf6d),
      onPrimaryFixedVariant: Color(0xff604100),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff001947),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff304578),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff3b0906),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff73342c),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd697),
      surfaceTint: Color(0xfff0bf6d),
      onPrimary: Color(0xff352200),
      primaryContainer: Color(0xffb5893e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd1dbff),
      onSecondary: Color(0xff082355),
      secondaryContainer: Color(0xff7b8fc8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd2cc),
      onTertiary: Color(0xff48130e),
      tertiaryContainer: Color(0xffcc7b70),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130e),
      errorContainer: Color(0xffcc7b70),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdbe6),
      outline: Color(0xffb0b1bb),
      outlineVariant: Color(0xff8e9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff614200),
      primaryFixed: Color(0xffffdeac),
      onPrimaryFixed: Color(0xff1a0f00),
      primaryFixedDim: Color(0xfff0bf6d),
      onPrimaryFixedVariant: Color(0xff4a3100),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff000f31),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff1e3466),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff2c0101),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff5e241d),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff43444a),
      surfaceContainerLowest: Color(0xff06070c),
      surfaceContainerLow: Color(0xff1c1d23),
      surfaceContainer: Color(0xff26282d),
      surfaceContainerHigh: Color(0xff313238),
      surfaceContainerHighest: Color(0xff3c3d43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffedd7),
      surfaceTint: Color(0xfff0bf6d),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffecbb6a),
      onPrimaryContainer: Color(0xff130900),
      secondary: Color(0xffedefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffadc1fd),
      onSecondaryContainer: Color(0xff000925),
      tertiary: Color(0xffffece9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffaea3),
      onTertiaryContainer: Color(0xff220000),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea3),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffefeffa),
      outlineVariant: Color(0xffc1c2cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff614200),
      primaryFixed: Color(0xffffdeac),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff0bf6d),
      onPrimaryFixedVariant: Color(0xff1a0f00),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff000f31),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff2c0101),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff4f5056),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1e1f25),
      surfaceContainer: Color(0xff2f3036),
      surfaceContainerHigh: Color(0xff3a3b41),
      surfaceContainerHighest: Color(0xff45464c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
