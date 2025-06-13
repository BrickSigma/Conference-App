import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff485d92),
      surfaceTint: Color(0xff485d92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdae2ff),
      onPrimaryContainer: Color(0xff304578),
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
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4e4539),
      outline: Color(0xff807567),
      outlineVariant: Color(0xffd2c4b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffb1c5ff),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff001947),
      primaryFixedDim: Color(0xffb1c5ff),
      onPrimaryFixedVariant: Color(0xff304578),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff001947),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff304578),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff3b0906),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff73342c),
      surfaceDim: Color(0xffe2d9cc),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff6eddf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffebe1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1e3466),
      surfaceTint: Color(0xff485d92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff576ca1),
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
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff3d3529),
      outline: Color(0xff5a5144),
      outlineVariant: Color(0xff766b5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffb1c5ff),
      primaryFixed: Color(0xff576ca1),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3e5387),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff576ca1),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3e5387),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa2594f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff844139),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec5b8),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff1e7d9),
      surfaceContainerHigh: Color(0xffe5dcce),
      surfaceContainerHighest: Color(0xffd9d0c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff112a5c),
      surfaceTint: Color(0xff485d92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff32477b),
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
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff332b20),
      outlineVariant: Color(0xff51483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffb1c5ff),
      primaryFixed: Color(0xff32477b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff193063),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff32477b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff193063),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff76362e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff59201a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b8ab),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9efe2),
      surfaceContainer: Color(0xffebe1d4),
      surfaceContainerHigh: Color(0xffdcd3c6),
      surfaceContainerHighest: Color(0xffcec5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb1c5ff),
      surfaceTint: Color(0xffb1c5ff),
      onPrimary: Color(0xff172e60),
      primaryContainer: Color(0xff304578),
      onPrimaryContainer: Color(0xffdae2ff),
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
      surface: Color(0xff17130b),
      onSurface: Color(0xffebe1d4),
      onSurfaceVariant: Color(0xffd2c4b4),
      outline: Color(0xff9b8f80),
      outlineVariant: Color(0xff4e4539),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff485d92),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff001947),
      primaryFixedDim: Color(0xffb1c5ff),
      onPrimaryFixedVariant: Color(0xff304578),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff001947),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff304578),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff3b0906),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff73342c),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2e2921),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1dbff),
      surfaceTint: Color(0xffb1c5ff),
      onPrimary: Color(0xff082355),
      primaryContainer: Color(0xff7b8fc8),
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
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe8dac9),
      outline: Color(0xffbdb0a0),
      outlineVariant: Color(0xff9a8f7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff314679),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff000f31),
      primaryFixedDim: Color(0xffb1c5ff),
      onPrimaryFixedVariant: Color(0xff1e3466),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff000f31),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff1e3466),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff2c0101),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff5e241d),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2c271f),
      surfaceContainerHigh: Color(0xff373229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedefff),
      surfaceTint: Color(0xffb1c5ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffadc1fd),
      onPrimaryContainer: Color(0xff000925),
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
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffceedc),
      outlineVariant: Color(0xffcec1b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff314679),
      primaryFixed: Color(0xffdae2ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb1c5ff),
      onPrimaryFixedVariant: Color(0xff000f31),
      secondaryFixed: Color(0xffdae2ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1c5ff),
      onSecondaryFixedVariant: Color(0xff000f31),
      tertiaryFixed: Color(0xffffdad5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb4a9),
      onTertiaryFixedVariant: Color(0xff2c0101),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff554f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff353027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4c463c),
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
