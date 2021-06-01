# 📜 Curtains
## [pub.dev Listing](https://pub.dev/packages/curtains) | [API Doc](https://pub.dev/documentation/curtains/latest) | [GitHub](https://github.com/Zabadam/curtains)
#### API References: [`Curtains`](https://pub.dev/documentation/curtains/latest/curtains/Curtains-class.html) | [`Sensitivity`](https://pub.dev/documentation/curtains/latest/curtains/Sensitivity-class.html) | 👥 [`package:shadows`](https://pub.dev/packages/shadows): 🕴 [`Elevation`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxDecoration.html)

<br />

[![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/Curtains.png)](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html 'pub.dev Documentation')

Wrap a scrollable with scrim 📜 `Curtains` while not at the start or end, alluding to unrevealed content.

<br />

| [![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/elevated.gif 'Link to the first demo in the Example app')](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L222 'First demo in the Example source') | [![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/code.png 'Not the exact code running in the gif next door, but it is this easy! Click for full size.')](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/code.png) |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |

<br />

> There has been a breaking change from **[0.9.4+1]** to **[0.9.5]**,
> but it is quite easily fixed. \
> Package still in pre-release.
> 
> A few other small changes have been made that may require minor cleanup \
> if moving to this version from an older one.
> 
> | <h2 style='color:green'>**[0.10.0] (now)**</h2> |   ⬅️   | <h2 style='color:orange'>**[0.9.4+1] (before)**</h2> | \|   | <h2 style='color:green'>**[0.10.0] (now)**</h2> | ⬅️    | <h2 style='color:orange'>**[0.9.4+1] (before)**</h2> |
> | :---------------------------------------------- | :---: | :------------------------------------------------ | :--- | :---------------------------------------------- | :--- | :------------------------------------------------ |
> | `Curtains`                                      |       | `Curtains.regal`                                  | \|   | `Sensitivity sensitivity`                       |      | `List<double> sensitivity`                        |
> | `Curtains.instant`                              |       | `Curtains.fancy`                                  | \|   | `TextDirection textDirection`                   |      | `TextDirection directionality`                    |
> | `Curtains.elevated`                             |       | `Curtains`                                        | \|   | `bool endInitVisible` <h6>⭐</h6>              |      | `bool endCurtainInitVisible`                      |
> 
> #### ⭐ Also now available is `bool startInitVisible`.
> <br />
> 
> Furthermore either `startCurtain` or `endCurtain` [now accepts a more
> abstract `Decoration?`](#any-decoration) \
> as opposed to a restriction to `BoxDecoration?`.

---

## 📚 Table of Contents
- 📜 [Curtains](#-curtains)
- 🧫 [Examples](#-examples)
  - [Elevated 📜 `Curtains`](#elevated--curtains)
  - [Instant 📜 `Curtains`](#instant--curtains)
  - [Animated 📜 `Curtains`](#animated--curtains)
- 📖 [Reference](#-reference)
  - 🕴 [Elevation](#-elevation)
  - [Any `Decoration`](#any-decoration)
- 🐞 [Bugs](#-bugs)
- 🐸 [More by Zaba](#-zabaapp--simple-packages-simple-names)
# 🧫 [Examples](#-table-of-contents 'Scroll up to 📚 Table of Contents')
See demonstrations of this Flutter package:
- [📜 `Curtains` Demo source: `/example/lib/main.dart`](https://github.com/Zabadam/curtains/tree/main/example/lib/main.dart '📜 Curtains Demo source: `/example/lib/main.dart`')
- [📜 `Curtains` Demo APK](https://github.com/Zabadam/curtains/blob/main/example/build/app/outputs/apk/release/app-release.apk '📜 Curtains Demo APK')

## [Elevated 📜 `Curtains`](#-table-of-contents 'Scroll up to 📚 Table of Contents')
In lieu of `Decoration`s, provide a simple number-based `elevation`.
Optionally provide a `color` or specify `duration`.

```dart
final curtains = Curtains.elevated(
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
> ## [It's *that* easy!](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L222 'First demo in the Example source. Since recording, Shadows.elevated are now animated by default!')
>
> #### ✝ [👥 `Shadows`](https://pub.dev/packages/shadows) - [See: `Elevation.asBoxShadows`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)

&nbsp;

## [Instant 📜 `Curtains`](#-table-of-contents 'Scroll up to 📚 Table of Contents')
Special `Curtains` that offer no animation support. \
No `AnimationController`s were hurt in the making of this widget.

```dart
final curtains = Curtains.instant(
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
> ## [It's *similarly* easy!](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L242 'Second demo in the Example source')

&nbsp;

## [Animated 📜 `Curtains`](#-table-of-contents 'Scroll up to 📚 Table of Contents')
Each curtain may be customized independently. The `spread` parameter provides
"girth," either width or height depending on axis, to allow the application
of `Decoration` images, gradients, and fills. 

Without `spread`, the only truly valid form of scrim curtain is the
`List<BoxShadow>` from `BoxDecoration`, `ShapeDecoration`, etc.

| [![](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/sensitivity.gif 'Custom animated BoxDecoration scrim Curtains and initialized `sensitivity`')](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L390 'Penultimate demo in the Example source') | [This instance of 📜 `Curtains`](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L363 'Final demo in the Example source') has </br>custom, animated BoxDecorations <br />as well as [`sensitivity` at the start <br />and end](https://pub.dev/documentation/curtains/latest/curtains/Sensitivity-class.html). |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

```dart
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

final curtains = Curtains(
  startCurtain: buildCurtain(),
  endCurtain: buildCurtain(isStart: false),
  // Provide `spread` to [Curtains] for decoration support beyond [BoxShadow]s.
  // (Gives "girth" to individual curtains; otherwise `0`.)
  spread: 50.0,
  // `start` appears once scrolled `350` px beyond min extent
  // `end` appears once scrolled `175` px beyond (before) max extent
  sensitivity: const Sensitivity.only(start: 350.0, end: 175.0),
  // 📜 Curtains are animated:
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
```
> ### [But look here, and we can get pretty complex and creative.](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L390 'Penultimate demo in the Example source')
>
> ### [Notice the `spread` initialization for `gradient` support.](https://github.com/Zabadam/curtains/blob/main/lib/src/curtains.dart#L619 '`_Curtain` class')

<br />

# 📖 [Reference](#-table-of-contents 'Scroll up to 📚 Table of Contents')
Peruse the [📜 `Curtains` pub.dev documention](https://pub.dev/documentation/curtains/latest/curtains/curtains-library.html 'pub.dev Documentation') for a full breakdown.

- This is simple package to use, but it is also a package that was easy to implement.
  - It is, however, overly documented so that any beginners may learn from its code.
  - Utilizes a simple `NotificationListener` in lieu of `ScrollController`,
  which were both elusive when starting Flutter.

## 🕴 [Elevation](#-table-of-contents 'Scroll up to 📚 Table of Contents')
The [`Elevation`](https://pub.dev/documentation/shadows/latest/shadows/Elevation-class.html) paradigm is handled by [`👥 package:shadows`](https://pub.dev/packages/shadows)
- Check it out for some neat [`Box`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)[`Shadow`](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowUtils.html) [utilities](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowsUtils.html) that mesh with 📜 `Curtains`.

## [Any `Decoration`](#-table-of-contents 'Scroll up to 📚 Table of Contents')
Consider something with a shape by using a `ShapeDecoration` for the curtain
decoration field.

| [![images of curtains as 📜 Curtains](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainsCurtains_square.gif)](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainsCurtains.gif 'images of curtains as 📜 Curtains. Click for full size.') | Or maybe [supplying a `DecorationImage`](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L418 '/example/lib/main.dart#L418') is what you need? |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |


# 🐞 [Bugs](#-table-of-contents 'Scroll up to 📚 Table of Contents')
One known **bug**:
1. [Even with `Curtains.spread` set non-negligibly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L344 '/example/lib/main.dart#L344'), [`BoxDecoration.backgroundBlendMode` does not work correctly](https://github.com/Zabadam/curtains/blob/main/example/lib/main.dart#L408 '/example/lib/main.dart#L408').

<br />

---

## 🐸 [Zaba.app ― simple packages, simple names.](https://pub.dev/publishers/zaba.app/packages 'Other Flutter packages published by Zaba.app')

<details>
<summary>More by Zaba</summary>

### Widgets to wrap other widgets
- ## 🕹️ [xl](https://pub.dev/packages/xl 'implement accelerometer-fueled interactions with a layering paradigm')
- ## 🌈 [foil](https://pub.dev/packages/foil 'implement accelerometer-reactive gradients in a cinch')
- ## 📜 [curtains](https://pub.dev/packages/curtains 'provide animated shadow decorations for a scrollable to allude to unrevealed content')
---
### Container widget that wraps many functionalities
- ## 🌟 [surface](https://pub.dev/packages/surface 'animated, morphing container with specs for Shape, Appearance, Filter, Tactility')
---
### Non-square `IconToo` + ext. `IconUtils` on `Icon`
- ## 🙋‍♂️ [icon](https://pub.dev/packages/icon 'An extended Icon \"too\" for those that are not actually square, plus shadows support + IconUtils')
---
### Side-kick companions, work great alone & employed above
- ## 🏓 [ball](https://pub.dev/packages/ball 'a bouncy, position-mirroring splash factory that\'s totally customizable')
- ## 👥 [shadows](https://pub.dev/packages/shadows 'convert a double-based \`elevation\` + BoxShadow and List\<BoxShadow\> extensions')
</details>
