# 📜 Curtains
[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/Curtains.png)](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html 'pub.dev Documentation')

Wrap a scrollable with scrim 📜 `Curtains` while not at the start or end, alluding to unrevealed content.

[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/CurtainsDemo.gif 'First demo in the Example app') &nbsp; ![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/Curtains_Code.png 'Not the exact code running in the gif next door, but it is this easy!')](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L207 'First demo in the Example source')


# 📖 Reference
Peruse the [📜 `Curtains` pub.dev documention](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html 'pub.dev Documentation') for a full breakdown.
- Advanced usage with 📜 [`Curtains.fancy`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/Curtains.fancy.html 'pub.dev Documentation')
- Animated usage with 📜 [`Curtains.regal`](https://pub.dev/documentation/curtains/latest/curtains/Curtains/Curtains.regal.html 'pub.dev Documentation')
- This is simple package to use, but it is also a package that was easy to implement.
  - It is overly documented so that any beginners may learn from its code.
  - Utilizes a simple `NotificationListener` in lieu of `ScrollController`, which were both elusive when starting with Flutter.

## 🕴 Elevation
The [`Elevation`](https://pub.dev/documentation/shadows/latest/shadows/Elevation-class.html) paradigm is handled by [`👥 package:shadows`](https://pub.dev/packages/shadows)
  - Check it out for some neat [`Box`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)[`Shadow`](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowUtils.html) [utilities](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowsUtils.html) that mesh with 📜 `Curtains`.

&nbsp;

# 🧫 Examples
See demonstrations of this Flutter package:
- [📜 `Curtains` Demo source: `/example/lib/main.dart`](https://github.com/Zabadam/curtains/tree/main/example/lib/main.dart '📜 Curtains Demo source: `/example/lib/main.dart`')
- [📜 `Curtains` Demo APK](https://github.com/Zabadam/curtains/blob/main/example/build/app/outputs/apk/release/app-release.apk '📜 Curtains Demo APK')

## Simple 📜 `Curtains`
```dart
final curtains = Curtains(
  child: ListView(
    children: List.generate(
      25,
      (i) => ListTile(title: Text('ListTile #: ${i+1}')),
    ),
  ),
  elevation: 24.0 // optional, defaults to `9.0`
  // Optional color; will maintain Material elevation opacities.✝
  color: Colors.red
);
```
> [It's *that* easy!](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L207 'First demo in the Example source')
>
> ✝ [👥 `Shadows`](https://pub.dev/packages/shadows) - [See: `Elevation.asBoxShadows`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)

&nbsp;

## Fancy 📜 `Curtains`
```dart
final fancy = Curtains.fancy(
  /// 🕴 Default constructor 📜 [Curtains] employs `Elevation.asBoxDecoration` to
  /// render its decorations; but feel free to use these static methods, too,
  /// if you opt for 👥 [package:shadows].
  startCurtain: const BoxDecoration(. . .) // Elevation.asBoxDecoration(12.0), // 🕴
  endCurtain: BoxDecoration(boxShadow: Elevation.asBoxShadows(12.0)), // 🕴
  child: ListView(
    children: List.generate(
      25,
      (i) => ListTile(title: Text('ListTile #${i+1}')),
    ),
  ),
);
```
> [It's *similarly* easy!](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L225 'Second demo in the Example source')

&nbsp;

## Regal 📜 `Curtains`
[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/RegalCurtainsDemo_Sensitivity.gif 'Custom animated BoxDecoration scrim Curtains and initialized `sensitivity`')](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L363 'Final demo in the Example source')
> [This instance of regal 📜 `Curtains` has custom, animated BoxDecorations as well as `sensitivity` at the start and end.](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L363 'Final demo in the Example source')

```dart
final regal = Curtains.regal(
  startCurtain: buildCurtain(),
  endCurtain: buildCurtain(isStart: false),
  // Provide `spread` to [Curtains] for decoration support beyond [BoxShadow]s.
  // (Gives "girth" to individual [_Curtain] containers; otherwise `0`.)
  spread: 50.0,
  // ⚖ `start` appears once scrolled `350` px beyond start
  // ⚖ `end` appears once scrolled `175` px beyond end
  sensitivity: const [350.0, 175.0], // ⚖
  // Regal 📜 Curtains are animated:
  duration: const Duration(milliseconds: 600),
  curve: Curves.fastOutSlowIn,
  // ↔ If wrapping a horizontal scrollable, initialize here, too:
  scrollDirection: Axis.horizontal, // ↔
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
> [But look here, and we can get pretty complex and creative.](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L363 'Final demo in the Example source')
>
> [Notice the `spread` initialization for `gradient` support in the `_Curtain`s.](https://github.com/Zabadam/curtains/blob/main/lib/src/curtains.dart#L569 '`_Curtain` class')

&nbsp;

# 🐞 Bugs
One known **bug**:
1. [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L344 '/example/lib/main.dart#L344'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L408 '/example/lib/main.dart#L408').
