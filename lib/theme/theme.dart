import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8d4e2a),
      surfaceTint: Color(0xff8d4e2a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbca),
      onPrimaryContainer: Color(0xff703715),
      secondary: Color(0xff765848),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbca),
      onSecondaryContainer: Color(0xff5c4032),
      tertiary: Color(0xff855318),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdcbd),
      onTertiaryContainer: Color(0xff693c00),
      error: Color(0xff006874),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff9eeffd),
      onErrorContainer: Color(0xff004f58),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a15),
      onSurfaceVariant: Color(0xff52443d),
      outline: Color(0xff85736b),
      outlineVariant: Color(0xffd7c2b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb690),
      primaryFixed: Color(0xffffdbca),
      onPrimaryFixed: Color(0xff341100),
      primaryFixedDim: Color(0xffffb690),
      onPrimaryFixedVariant: Color(0xff703715),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff2b160a),
      secondaryFixedDim: Color(0xffe6beab),
      onSecondaryFixedVariant: Color(0xff5c4032),
      tertiaryFixed: Color(0xffffdcbd),
      onTertiaryFixed: Color(0xff2c1600),
      tertiaryFixedDim: Color(0xfffcb975),
      onTertiaryFixedVariant: Color(0xff693c00),
      surfaceDim: Color(0xffe8d7cf),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xfffceae3),
      surfaceContainerHigh: Color(0xfff6e5dd),
      surfaceContainerHighest: Color(0xfff0dfd8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b2706),
      surfaceTint: Color(0xff8d4e2a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9e5c37),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a3023),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff866656),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff522e00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff966125),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff003c44),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff187884),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff170f0b),
      onSurfaceVariant: Color(0xff41332d),
      outline: Color(0xff5f4f48),
      outlineVariant: Color(0xff7a6a62),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb690),
      primaryFixed: Color(0xff9e5c37),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff814522),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff866656),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4e3f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff966125),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7a4a0e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3bc),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xfff6e5dd),
      surfaceContainerHigh: Color(0xffebd9d2),
      surfaceContainerHighest: Color(0xffdfcec7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e1e00),
      surfaceTint: Color(0xff8d4e2a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff733a17),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3e261a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5f4334),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff442500),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6c3e02),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff003238),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff00515a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362923),
      outlineVariant: Color(0xff55463f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb690),
      primaryFixed: Color(0xff733a17),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff562403),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5f4334),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff462d20),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6c3e02),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4d2a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5b6af),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede6),
      surfaceContainer: Color(0xfff0dfd8),
      surfaceContainerHigh: Color(0xffe2d1ca),
      surfaceContainerHighest: Color(0xffd4c3bc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb690),
      surfaceTint: Color(0xffffb690),
      onPrimary: Color(0xff542202),
      primaryContainer: Color(0xff703715),
      onPrimaryContainer: Color(0xffffdbca),
      secondary: Color(0xffe6beab),
      onSecondary: Color(0xff432b1d),
      secondaryContainer: Color(0xff5c4032),
      onSecondaryContainer: Color(0xffffdbca),
      tertiary: Color(0xfffcb975),
      onTertiary: Color(0xff4a2900),
      tertiaryContainer: Color(0xff693c00),
      onTertiaryContainer: Color(0xffffdcbd),
      error: Color(0xff82d3e0),
      onError: Color(0xff00363d),
      errorContainer: Color(0xff004f58),
      onErrorContainer: Color(0xff9eeffd),
      surface: Color(0xff1a120e),
      onSurface: Color(0xfff0dfd8),
      onSurfaceVariant: Color(0xffd7c2b9),
      outline: Color(0xffa08d84),
      outlineVariant: Color(0xff52443d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff8d4e2a),
      primaryFixed: Color(0xffffdbca),
      onPrimaryFixed: Color(0xff341100),
      primaryFixedDim: Color(0xffffb690),
      onPrimaryFixedVariant: Color(0xff703715),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff2b160a),
      secondaryFixedDim: Color(0xffe6beab),
      onSecondaryFixedVariant: Color(0xff5c4032),
      tertiaryFixed: Color(0xffffdcbd),
      onTertiaryFixed: Color(0xff2c1600),
      tertiaryFixedDim: Color(0xfffcb975),
      onTertiaryFixedVariant: Color(0xff693c00),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff413732),
      surfaceContainerLowest: Color(0xff140c09),
      surfaceContainerLow: Color(0xff221a15),
      surfaceContainer: Color(0xff271e19),
      surfaceContainerHigh: Color(0xff322823),
      surfaceContainerHighest: Color(0xff3d332e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3be),
      surfaceTint: Color(0xffffb690),
      onPrimary: Color(0xff431900),
      primaryContainer: Color(0xffc87f57),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdd4c0),
      onSecondary: Color(0xff372014),
      secondaryContainer: Color(0xffac8978),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd5ad),
      onTertiary: Color(0xff3a1f00),
      tertiaryContainer: Color(0xffbf8445),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xff98e9f7),
      onError: Color(0xff002a30),
      errorContainer: Color(0xff499ca9),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a120e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed8ce),
      outline: Color(0xffc2aea5),
      outlineVariant: Color(0xff9f8d84),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff713816),
      primaryFixed: Color(0xffffdbca),
      onPrimaryFixed: Color(0xff230900),
      primaryFixedDim: Color(0xffffb690),
      onPrimaryFixedVariant: Color(0xff5b2706),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff1f0c03),
      secondaryFixedDim: Color(0xffe6beab),
      onSecondaryFixedVariant: Color(0xff4a3023),
      tertiaryFixed: Color(0xffffdcbd),
      onTertiaryFixed: Color(0xff1e0d00),
      tertiaryFixedDim: Color(0xfffcb975),
      onTertiaryFixedVariant: Color(0xff522e00),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff4d423d),
      surfaceContainerLowest: Color(0xff0d0604),
      surfaceContainerLow: Color(0xff251c17),
      surfaceContainer: Color(0xff2f2621),
      surfaceContainerHigh: Color(0xff3b302c),
      surfaceContainerHighest: Color(0xff463b36),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece4),
      surfaceTint: Color(0xffffb690),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb087),
      onPrimaryContainer: Color(0xff1a0600),
      secondary: Color(0xffffece4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2baa7),
      onSecondaryContainer: Color(0xff180701),
      tertiary: Color(0xffffeddf),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff8b571),
      onTertiaryContainer: Color(0xff150800),
      error: Color(0xffcdf7ff),
      onError: Color(0xff000000),
      errorContainer: Color(0xff7ecfdc),
      onErrorContainer: Color(0xff000e10),
      surface: Color(0xff1a120e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece4),
      outlineVariant: Color(0xffd3beb5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff713816),
      primaryFixed: Color(0xffffdbca),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb690),
      onPrimaryFixedVariant: Color(0xff230900),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6beab),
      onSecondaryFixedVariant: Color(0xff1f0c03),
      tertiaryFixed: Color(0xffffdcbd),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfffcb975),
      onTertiaryFixedVariant: Color(0xff1e0d00),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff594e48),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271e19),
      surfaceContainer: Color(0xff382e2a),
      surfaceContainerHigh: Color(0xff443934),
      surfaceContainerHighest: Color(0xff50443f),
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
