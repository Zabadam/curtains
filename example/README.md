# 📜 Curtains
[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/Curtains.png)](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html 'pub.dev Documentation')

Wrap a scrollable with scrim 📜 `Curtains` while not at the start or end, alluding to unrevealed content.

[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/CurtainsDemo.gif 'First demo in the Example app') &nbsp; ![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/Curtains_Code.png 'Not the exact code running in the gif next door, but it is this easy!')](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L205 'First demo in the Example source')

# 📖 Reference
Peruse the [pub.dev documention](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html 'pub.dev Documentation') for a full breakdown.
- Advanced usage with 📜 [`Curtains.fancy`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/Curtains.fancy.html 'pub.dev Documentation') & 📜 [`Curtains.regal`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/Curtains.regal.html 'pub.dev Documentation')
- [`Elevation`](https://pub.dev/documentation/curtains/latest/curtains/Elevation-class.html 'pub.dev Documentation')'s two static methods for passing a
  `double elevation` through [`kElevationToShadow`](https://api.flutter.dev/flutter/material/kElevationToShadow-constant.html 'Flutter API ref doc: top-level constant `kElevationToShadow`')
  - [`Elevation.asBoxShadows(double elevation)`](https://pub.dev/documentation/curtains/latest/curtains/Elevation/asBoxShadows.html 'pub.dev Documentation')
  - [`Elevation.asBoxDecoration(double elevation)`](https://pub.dev/documentation/curtains/latest/curtains/Elevation/asBoxDecoration.html 'pub.dev Documentation')
- [`Curtains.NILL`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/NILL-constant.html 'pub.dev Documentation') for `const BoxDecoration()`
- [`_SensitivityList`](https://github.com/Zabadam/curtains/blob/main/lib/src/curtains.dart#L519 '/lib/src/curtains.dart#L519'), a `List` extension for verifying [`Curtains.sensitivity`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/sensitivity.html 'pub.dev Documentation')

&nbsp;


# 🧫 Examples
See demonstrations of the 📜 `Curtains` package for Flutter:
- [📜 `Curtains` Demo source: `/example/lib/main.dart`](https://github.com/Zabadam/curtains/tree/main/example/lib/main.dart '📜 Curtains Demo source: `/example/lib/main.dart`')
- [📜 `Curtains` Demo APK](https://github.com/Zabadam/curtains/blob/main/example/build/app/outputs/apk/release/app-release.apk '📜 Curtains Demo APK')

## Simple 📜 `Curtains`
```dart
Widget build(BuildContext context) {
  return Curtains(
    child: ListView(
      children: List.generate(
        25,
        (i) => ListTile(title: Text('ListTile #${i+1}')),
      ),
    ),
    // Consider [Material.elevation], but see [Elevation]; defaults `9.0`.
    elevation: 24,
  );
}
```
> [It's *that* easy!](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L205 'First demo in the Example source')

## Fancy 📜 `Curtains`
```dart
Curtains.fancy(
  /// 🕴 Default constructor 📜 [Curtains] employs `Elevation.asBoxDecoration` to
  /// render its decorations; but feel free to use these static methods, too.
  startCurtain: Elevation.asBoxDecoration(12.0), // 🕴
  endCurtain: BoxDecoration(boxShadow: Elevation.asBoxShadows(12.0)), // 🕴
  child: ListView(
    children: List.generate(
      25,
      (i) => ListTile(title: Text('ListTile #${i+1}')),
    ),
  ),
);
```
> [It's *similarly* easy!](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L218 'Second demo in the Example source')

## Regal 📜 `Curtains`
[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/RegalCurtainsDemo_Sensitivity.gif 'Custom animated BoxDecoration scrim Curtains and initialized `sensitivity`')](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L351 '/example/lib/main.dart#L351')
> [This instance of regal 📜 `Curtains` has custom, animated BoxDecorations as well as `sensitivity` at the start and end.](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L351 '/example/lib/main.dart#L351')

```dart
Curtains.regal(
  // If wrapping a horizontal scrollable, initialize here, too.
  scrollDirection: Axis.horizontal, // ↔
  startCurtain: buildCurtain(),
  endCurtain: buildCurtain(isStart: false),
  // Provide `spread` to [Curtains] for decoration support beyond [BoxShadow]s.
  // (Gives "girth" to individual [_Curtain] containers; otherwise `0`.)
  spread: 50.0,
  // ⚖ `start` appears once scrolled `350` px beyond start
  // ⚖ `end` appears once scrolled `175` px beyond end
  sensitivity: const [350.0, 175.0],
  // Regal 📜 Curtains are animated.
  duration: const Duration(milliseconds: 600),
  curve: Curves.fastOutSlowIn,
  child: ListView(
    scrollDirection: Axis.horizontal, // ↔
    itemExtent: 100.0,
    children: List.generate(
      25,
      (i) => ListTile(title: Text('ListTile #${i+1}')),
    ),
  ),
);

BoxDecoration buildCurtain({bool isStart = true}) => BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.green[400]!, Colors.green[400]!.withOpacity(0)],
    begin: (isStart) ? Alignment.centerLeft : Alignment.centerRight,
    end: (isStart) ? Alignment.centerRight : Alignment.centerLeft,
  ),
  boxShadow: const [
    BoxShadow(color: Color(0x22FF0000), spreadRadius: 0.0, blurRadius: 5.0),
    BoxShadow(color: Color(0x66FF0000), spreadRadius: 10.0, blurRadius: 30.0),
    BoxShadow(color: Color(0x22FF0000), spreadRadius: 60.0, blurRadius: 150.0),
  ],
);
```
> [But look here, and we can get pretty complex and creative.](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L351 'Final demo in the Example source')
>
> [Notice the `spread` initialization for `gradient` support in the `_Curtain`s.](https://github.com/Zabadam/curtains/blob/main/lib/src/curtains.dart#L482 '`_Curtain` class')

# 🐞 Bugs
One known **bug**:
- [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L332 '/example/lib/main.dart#L332'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L397 '/example/lib/main.dart#L397').
