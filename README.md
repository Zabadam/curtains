# 📜 Curtains
Wrap a scrollable with scrim Curtains while not at the start or end, alluding to unrevealed content.

## [Reference](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html)
- Advanced usage with 📜 [`Curtains.fancy`](https://pub.dev/documentation/curtains/latest/curtains/Curtains-class.html) & 📜 [`Curtains.regal`](https://pub.dev/documentation/curtains/latest/curtains/Curtains-class.html)
- [`Elevation`]'s two static methods for passing
  `elevation` through [`kElevationToShadow`]
  - `Elevation.asBoxShadows(double elevation)`
  - `Elevation.asBoxDecoration(double elevation)`
- [`Curtains.NILL`] for `const BoxDecoration()`
- [`_SensitivityList`], a `List` extension for verifying a [`Curtains.sensitivity`]

&nbsp;


# [Example](https://github.com/Zabadam/curtains/tree/main/example)s
## Simple 📜 Curtains
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
> ### It's *that* easy!
&nbsp;

## Fancy 📜 Curtains
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
> ### It's *similarly* easy!
&nbsp;

## Regal 📜 Curtains
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
> ### But look here, and we can get pretty complex and creative.
&nbsp;

# Bugs
One known **bug**:
- Even with `Curtains.spread` set non-negligibly, `BoxDecoration.backgroundBlendMode` does not work correctly.
