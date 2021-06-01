/// ## 📜 Curtains Demonstration
library curtains_demo;

import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:curtains/curtains.dart';

import 'source_code.dart';

/// This demonstration.
late BuildContext curtainsDemo;

///     const DURATION = Duration(milliseconds: 600);
// ignore: constant_identifier_names
const DURATION = Duration(milliseconds: 600);

///     const CURVE = Curves.fastOutSlowIn;
// ignore: constant_identifier_names
const CURVE = Curves.fastOutSlowIn;

/// Ordered List of demo names.
// ignore: constant_identifier_names
const TITLES = [
  '📜 Curtains Demo - Elevated',
  '📜 Instant Curtains: Axis.horizontal',
  '📜 Curtains: Animations',
  '📜 Curtains: BoxDecorations',
  '📜 Curtains: Curtain Spread & clipBehavior',
  '📜 Curtains: Sensitivity',
  '📜 Curtains: Any Decoration',
];

/// Starts at `TITLES[0]`, '📜 Curtains Demo', but changes as the
/// `>` IconButton over [CurrentDemo] is tapped.
var title = TITLES[0];

/// Hover in most IDEs for context tooltip
/// describing the significance of each Demo.
// ignore: constant_identifier_names
const DEMOS = [
  ElevatedCurtainsDemo(),
  InstantCurtainsDemo(),
  CurtainsDemoVertical1(),
  CurtainsDemoVertical2(),
  CurtainsDemoHorizontal1(),
  CurtainsDemoVertical3(),
  CurtainsDemoHorizontal2(),
];

/// Starts at `0`, [ElevatedCurtainsDemo], but changes as the
/// `>` IconButton over [CurrentDemo] is tapped.
var currentDemo = 0;

void main() => runApp(const CurtainsDemo());

/// {@macro curtains_demo}
class CurtainsDemo extends StatefulWidget {
  /// {@template curtains_demo}
  /// A [MaterialApp] frame for this entire demonstration.
  /// {@endtemplate}
  const CurtainsDemo({Key? key}) : super(key: key);

  @override
  _CurtainsDemoState createState() => _CurtainsDemoState();
}

class _CurtainsDemoState extends State<CurtainsDemo> {
  @override
  Widget build(BuildContext context) {
    curtainsDemo = context; // Allows easy rebuild from [CurrentDemo]
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.red),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            automaticallyImplyLeading: false,
            toolbarHeight: (currentDemo == -1) ? 80 : null,
          ),
          body: const CurrentDemo(),
        ),
      ),
    );
  }
}

/// {@macro current_demo}
class CurrentDemo extends StatefulWidget {
  /// {@template current_demo}
  /// Setup the body of [CurtainsDemo] Scaffold
  /// according to the [Axis] of the [currentDemo].
  ///
  /// Provides an > `IconButton` to change [currentDemo].
  /// {@endtemplate}
  const CurrentDemo({Key? key}) : super(key: key);

  @override
  _CurrentDemoState createState() => _CurrentDemoState();
}

class _CurrentDemoState extends State<CurrentDemo> {
  @override
  Widget build(BuildContext context) {
    final isHorizontal =
        (currentDemo != 1 && currentDemo != 4 && currentDemo != 6);

    final children = <Widget>[
      isHorizontal ? headerVertical : headerHorizontal,
      DEMOS[(currentDemo == -1) ? 0 : currentDemo],
      isHorizontal ? footerVertical : footerHorizontal,
    ];

    return WillPopScope(
      onWillPop: () async {
        if (currentDemo == -1) {
          setState(() {
            currentDemo = 0;
            title = TITLES[0];
            (curtainsDemo as Element).markNeedsBuild();
          });
          return false;
        }
        var willPop = false;
        Scaffold.of(context).showBottomSheet<void>(
          (_) => GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 200,
              color: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Exit 📜 Curtains Demo?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            willPop = true;
                            SystemChannels.platform.invokeMethod(
                              'SystemNavigator.pop',
                            );
                          },
                          child: const Text('\n  E X I T  \n'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('\n  S T A Y  \n'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        return willPop;
      },
      child: Stack(
        children: <Widget>[
          (currentDemo == -1)
              ? const SourceCode()
              : isHorizontal
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: children,
                    )
                  : Row(children: children),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            color: (currentDemo == -1) ? Colors.white : Colors.black,
            iconSize: 70,
            onPressed: () => setState(
              () {
                HapticFeedback.vibrate();
                currentDemo =
                    (currentDemo == DEMOS.length - 1) ? 0 : currentDemo + 1;
                title = TITLES[currentDemo];
                (curtainsDemo as Element).markNeedsBuild();
              },
            ),
          ),
          Positioned(
            top: 0,
            right: isHorizontal
                ? (currentDemo == -1)
                    ? -1920
                    : 16
                : -4,
            child: IconButton(
              icon: const Icon(Icons.code),
              color: isHorizontal ? Colors.red : Colors.blue,
              iconSize: isHorizontal ? 70 : 50,
              onPressed: () => setState(() {
                HapticFeedback.vibrate();
                currentDemo = -1;
                title = '📜 Curtains Demo: Source Code\n'
                    '🔎 Pinch to Zoom  👆 Tap and Hold to Select';
                (curtainsDemo as Element).markNeedsBuild();
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🕴 Consider [Material.elevation], but see [Elevation].
class ElevatedCurtainsDemo extends StatelessWidget {
  /// 🕴 Consider [Material.elevation], but see [Elevation].
  const ElevatedCurtainsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains.elevated(
        elevation: 24, // Consider [Material.elevation], but see [Elevation].🕴
        // endCurtainInitVisible: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: generatedListVertical,
        ),
      ),
    );
  }
}

/// {@macro instant_curtains}
class InstantCurtainsDemo extends StatelessWidget {
  /// {@template instant_curtains}
  /// ↔ When instantiating, 📜 [Curtains] may be created on [Axis.horizontal]
  /// if they need to match a horizontally-scrolling `child`.
  ///
  /// 🔛 [Curtains.textDirection] can manually trigger RTL
  /// (but Curtains does check).
  ///
  /// 🕴 Simple constructor 📜 [Curtains.elevated] uses
  /// [Elevation.asBoxDecoration] to render its decorations;
  /// but feel free to use these static methods, too.
  /// - with 👥 [`package:shadows`](https://pub.dev/packages/shadows)
  /// {@endtemplate}
  const InstantCurtainsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🕴
    final _shadow = (Elevation.asBoxShadows(24, color: Colors.red) +
            const [
              BoxShadow(color: Colors.yellow, spreadRadius: 10, blurRadius: 10),
              BoxShadow(color: Colors.green, spreadRadius: 5, blurRadius: 25),
            ])
        // Material elevation `List<BoxShadow>`s have 3x shadows
        // - Kept at Material-standard opacities
        //   with `kElevationShadowOpacityRamp`
        // We added 2x shadows which we will now modify.
        //
        // (Simply demonstrating `rampOpacity` util from
        // 👥 Shadows - https://pub.dev/packages/shadows)
        .rampOpacity(kElevationShadowOpacityRamp + [0.2, 0.25]);

    return Expanded(
      child: Curtains.instant(
        scrollDirection: Axis.horizontal, // ↔
        // directionality: TextDirection.rtl, // Manually trigger RTL 🔛
        startCurtain: BoxDecoration(boxShadow: _shadow),
        endCurtain: Elevation.asBoxDecoration(12, color: Colors.purple), // 🕴
        child: ListView(
          scrollDirection: Axis.horizontal, // ↔
          itemExtent: 100.0,
          physics: const BouncingScrollPhysics(),
          children: generatedListHorizontal,
        ),
      ),
    );
  }
}

/// {@macro vertical1}
class CurtainsDemoVertical1 extends StatelessWidget {
  /// {@template vertical1}
  /// ⏰ [Curtains] has intrinsic animation support.
  /// Provide `duration` and/or `curve` or let 📜 [Curtains] default.
  /// {@endtemplate}
  const CurtainsDemoVertical1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains(
        startCurtain: Elevation.asBoxDecoration(12), // 🕴
        endCurtain: BoxDecoration(boxShadow: Elevation.asBoxShadows(24)), // 🕴
        duration: DURATION, // ⏰
        curve: CURVE, // ⏰
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: generatedListVertical,
        ),
      ),
    );
  }
}

/// {@macro vertical2}
class CurtainsDemoVertical2 extends StatelessWidget {
  /// {@template vertical2}
  /// [Curtains] and [Curtains.instant] support
  /// full-fat [BoxDecoration]s in lieu of `elevation`.
  /// {@endtemplate}
  const CurtainsDemoVertical2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains(
        startCurtain: startCurtain, // 🌈
        endCurtain: buildEndCurtain(), // 🌈
        duration: DURATION,
        curve: CURVE,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: generatedListVertical,
        ),
      ),
    );
  }
}

/// {@macro horizontal1}
class CurtainsDemoHorizontal1 extends StatelessWidget {
  /// {@template horizontal1}
  /// ```
  /// /// `buildEndCurtain` has a `gradient` that is not visible
  /// /// without [Curtains.spread].
  /// endCurtain: buildFancyEnd(Axis.horizontal), // (explains [Axis] pass)
  /// spread: 25, // Provide "girth" to [_Curtain]s for [Gradient] support.
  ///
  /// /// `BoxDecoration.gradient` clips itself but [BoxShadows], which the
  /// /// simple 📜 [Curtains.elevated] relies on for [Curtains.elevation],
  /// /// need a [ClipRect] in order to not overflow visually.
  /// /// - Manually disable clipping with [clipBehavior] set `Clip.none`
  /// clipBehavior: Clip.none,
  /// ```
  /// {@endtemplate}
  const CurtainsDemoHorizontal1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains(
        scrollDirection: Axis.horizontal,
        startCurtain: startCurtain,

        /// `buildEndCurtain` has a `gradient` that is not visible
        /// without [Curtains.spread].
        endCurtain: buildEndCurtain(Axis.horizontal), // (explains [Axis] pass)
        spread: 25, // Provide "girth" to [_Curtain]s for [Gradient] support.
        duration: DURATION,
        curve: CURVE,

        /// `BoxDecoration.gradient` clips itself but [BoxShadows], which the
        /// simple 📜 [Curtains.elevated] relies on for [Curtains.elevation],
        /// need a [ClipRect] in order to not overflow visually.
        /// - Manually disable clipping with [clipBehavior] set `Clip.none`
        clipBehavior: Clip.none,
        child: ListView(
          scrollDirection: Axis.horizontal,
          itemExtent: 150.0,
          physics: const BouncingScrollPhysics(),
          children: generatedListHorizontal,
        ),
      ),
    );
  }
}

/// {@macro vertical3}
class CurtainsDemoVertical3 extends StatelessWidget {
  /// {@template vertical3}
  /// ⚖ With a `Sensitivity` [Curtains.sensitivity],
  /// the 📜 [Curtains] scrims will appear later and disappear sooner.
  /// {@endtemplate}
  const CurtainsDemoVertical3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains(
        startCurtain: startCurtain,
        endCurtain: buildEndCurtain(),
        // `start` appears once scrolled `350` px beyond start
        // `end` appears once scrolled `175` px beyond end
        sensitivity: const Sensitivity(350.0, 175.0),
        duration: DURATION,
        curve: CURVE,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: generatedListVertical,
        ),
      ),
    );
  }
}

/// {@macro horizontal2}
class CurtainsDemoHorizontal2 extends StatelessWidget {
  /// {@template horizontal2}
  /// The `startCurtain` and `endCurtain` fields accept more than just
  /// [BoxDecoration]s. Any old [Decoration] will do!
  /// {@endtemplate}
  const CurtainsDemoHorizontal2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration buildCurtain({isStart = true}) => ShapeDecoration(
          shadows: [
            BoxShadow(
              color: const Color(0xAA000000),
              spreadRadius: -15,
              blurRadius: 100,
              offset: Offset(isStart ? -75 : 75, 0),
            )
          ],
          image: DecorationImage(
            image: isStart
                ? const NetworkImage('https://i.imgur.com/kvtuWIe.png')
                : const NetworkImage('https://i.imgur.com/hYyYJ0I.png'),
            alignment: Alignment.topCenter,
          ),

          /// Demonstrative
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(0, 500)),
          ),
        );

    return Expanded(
      child: Curtains(
        scrollDirection: Axis.horizontal,
        startCurtain: buildCurtain(),
        endCurtain: buildCurtain(isStart: false),
        // spread: 167, // real horizontal resolution
        spread: 100,
        duration: DURATION,
        curve: CURVE,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: generatedListHorizontal,
        ),
      ),
    );
  }
}

///
Container buildLeading(Axis axis, int i) => Container(
      decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          border: Border.all(color: Colors.black, width: 2.0)),
      width: (axis == Axis.vertical) ? 50.0 : 75.0,
      height: (axis == Axis.vertical) ? 50.0 : 75.0,
      child: Text(
        '${i + 1}',
        style: TextStyle(
          fontSize: (axis == Axis.vertical) ? 20 : 34,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1,
        ),
      ),
    );

///
BoxDecoration buildEndCurtain([Axis? axis]) => BoxDecoration(
      // TODO: fix [backgroundBlendMode]
      // backgroundBlendMode: BlendMode.colorDodge,
      gradient: LinearGradient(
        colors: [Colors.green[400]!, Colors.green[900]!.withOpacity(0)],
        begin: (axis == Axis.vertical)
            ? Alignment.bottomCenter
            : Alignment.centerRight,
        end: (axis == Axis.vertical)
            ? Alignment.topCenter
            : Alignment.centerLeft,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.blue,
          spreadRadius: 15.0,
          blurRadius: 20.0,
          offset: Offset(0, 15),
        ),
      ],
    );

///
const startCurtain = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color(0xFFFF0000),
      spreadRadius: 1.0,
      blurRadius: 5.0,
    ),
    BoxShadow(
      color: Color(0xBBFF0000),
      spreadRadius: 10.0,
      blurRadius: 30.0,
    ),
    BoxShadow(
      color: Color(0x66FF0000),
      spreadRadius: 25.0,
      blurRadius: 150.0,
    ),
  ],
);

///
final List<Widget> generatedListVertical = List.generate(
  35,
  (i) => Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: ListTile(
      tileColor: Colors.red.withOpacity(0.05),
      leading: buildLeading(Axis.vertical, i),
      title: titleVertical,
      subtitle: subtitleVertical,
    ),
  ),
);

///
final List<Widget> generatedListHorizontal = List.generate(
  35,
  (i) => Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Container(
      color: Colors.red.withOpacity(0.05),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildLeading(Axis.horizontal, i),
          titleHorizontal,
          subtitleHorizontal,
        ],
      ),
    ),
  ),
);

///
const titleVertical = Text('Foo Bar Boo Baz', style: TextStyle(fontSize: 20));

///
const subtitleVertical = Text('Lorem ipsum dolor sit amet');

///
const titleHorizontal = Text(
  'Foo\nBar\nBoo\nBaz',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 36),
);

///
const subtitleHorizontal = Text(
  '\nLorem\nipsum\ndolor\nsit\namet\nlorem\nipsum\ndolor\nsit\namet',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 22),
);

///
const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

///
const headerVertical = SizedBox(
  height: 90,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x44FF0000)),
    child: Align(
      alignment: Alignment.center,
      child: Text('Vertical ListView 👤 Header', style: style),
    ),
  ),
);

///
const footerVertical = SizedBox(
  height: 60,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x4400C3FF)),
    child: Align(
      alignment: Alignment.center,
      child: Text('Vertical ListView 🦶 Footer', style: style),
    ),
  ),
);

///
const headerHorizontal = SizedBox(
  width: 80,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x44FF0000)),
    child: Center(
      child: Text(
        'H\nO\nR\nI\nZ\nO\nN\nT\nA\nL\n\n'
        '👤\n\nH\nE\nA\nD\nE\nR',
        textAlign: TextAlign.center,
        style: style,
      ),
    ),
  ),
);

///
const footerHorizontal = SizedBox(
  width: 60,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x4400C3FF)),
    child: Center(
      child: Text(
        'H\nO\nR\nI\nZ\nO\nN\nT\nA\nL\n\n'
        '🦶\n\nF\nO\nO\nT\nE\nR',
        textAlign: TextAlign.center,
        style: style,
      ),
    ),
  ),
);
