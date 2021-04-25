/// Demo Source Code
library curtains_demo;

import 'package:flutter/material.dart';

import 'package:curtains/curtains.dart';

class CodeViewer extends StatelessWidget {
  const CodeViewer(
    this.data, {
    Key? key,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 4.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFF3C2121)),
        child: Curtains.regal(
          startCurtain: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x44FF4444),
                spreadRadius: 20,
                blurRadius: 40,
              )
            ],
          ),
          endCurtain: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xAA990000),
                spreadRadius: 20,
                blurRadius: 40,
              )
            ],
          ),
          sensitivity: const [15, 40],
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 75,
              top: 15,
              right: 15,
              bottom: 15,
            ),
            child: SelectableText.rich(
              TextSpan(
                text: data,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    height: 1.5,
                    shadows: const [Shadow(offset: Offset(0, 1))]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SourceCode extends StatelessWidget {
  const SourceCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CodeViewer(
      r'''
/// ## 📜 Curtains Demonstration
library curtains_demo;

import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:curtains/curtains.dart';

import 'source_code.dart';

void main() => runApp(CurtainsDemo());

/// This demonstration.
late BuildContext curtainsDemo;

///     const DURATION = Duration(milliseconds: 600);
const DURATION = Duration(milliseconds: 600);

///     const CURVE = Curves.fastOutSlowIn;
const CURVE = Curves.fastOutSlowIn;

const TITLES = [
  '📜 Curtains Demo',
  '📜 Fancy Curtains: Axis.horizontal',
  '📜 Regal Curtains: Animations',
  '📜 Regal Curtains: BoxDecorations',
  '📜 Regal Curtains: Curtain Spread & clipBehavior',
  '📜 Regal Curtains: Sensitivity',
];

/// Starts at `TITLES[0]`, '📜 Curtains Demo', but changes as the
/// `>` IconButton over [CurrentDemo] is tapped.
var title = TITLES[0];

/// Hover in most IDEs for context tooltip
/// describing the significance of each Demo.
const DEMOS = [
  CurtainsDemoVertical(),
  FancyCurtainsDemoHorizontal(),
  RegalCurtainsDemoVertical1(),
  RegalCurtainsDemoVertical2(),
  RegalCurtainsDemoHorizontal(),
  RegalCurtainsDemoVertical3(),
];

/// Starts at `0`, [CurtainsDemoVertical], but changes as the
/// `>` IconButton over [CurrentDemo] is tapped.
var currentDemo = 0;

class CurtainsDemo extends StatefulWidget {
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

/// Setup the body of [CurtainsDemo] Scaffold
/// according to the [Axis] of the [currentDemo].
///
/// Provides an `>` IconButton to change [currentDemo].
class CurrentDemo extends StatefulWidget {
  const CurrentDemo({Key? key}) : super(key: key);
  _CurrentDemoState createState() => _CurrentDemoState();
}

class _CurrentDemoState extends State<CurrentDemo> {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      (currentDemo != 1 && currentDemo != 4)
          ? HEADER_VERTICAL
          : HEADER_HORIZONTAL,
      DEMOS[(currentDemo == -1) ? 0 : currentDemo],
      (currentDemo != 1 && currentDemo != 4)
          ? FOOTER_VERTICAL
          : FOOTER_HORIZONTAL,
    ];

    return WillPopScope(
      child: Stack(
        children: <Widget>[
          (currentDemo == -1)
              ? const SourceCode()
              : (currentDemo != 1 && currentDemo != 4)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: children,
                    )
                  : Row(children: children),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
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
            right: (currentDemo != 1 && currentDemo != 4)
                ? (currentDemo == -1)
                    ? -1920
                    : 16
                : -4,
            child: IconButton(
              icon: Icon(Icons.code),
              color: (currentDemo != 1 && currentDemo != 4)
                  ? Colors.red
                  : Colors.blue,
              iconSize: (currentDemo != 1 && currentDemo != 4) ? 70 : 50,
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
                          child: const Text('\n  E X I T  \n'),
                          onPressed: () {
                            willPop = true;
                            SystemChannels.platform.invokeMethod(
                              'SystemNavigator.pop',
                            );
                          },
                        ),
                        ElevatedButton(
                          child: const Text('\n  S T A Y  \n'),
                          onPressed: () => Navigator.pop(context),
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
    );
  }
}

/// 🕴 Consider [Material.elevation], but see [Elevation].
class CurtainsDemoVertical extends StatelessWidget {
  /// 🕴 Consider [Material.elevation], but see [Elevation].
  const CurtainsDemoVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains(
        elevation: 24, // Consider [Material.elevation], but see [Elevation].🕴
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: generatedListVertical,
        ),
      ),
    );
  }
}

class FancyCurtainsDemoHorizontal extends StatelessWidget {
  /// ↔ When instantiating, 📜 [Curtains] may be created
  /// on the [Axis.horizontal] if it needs to match a
  /// horizontally-scrolling `child`.
  ///
  /// 🔛 [Curtains.directionality] can manually
  /// trigger RTL (but Curtains does check).
  ///
  /// 🕴 Default constructor 📜 [Curtains] uses
  /// [Elevation.asBoxDecoration] to render its decorations;
  /// but feel free to use these static methods, too.
  /// - with 👥 [`package:shadows`](https://pub.dev/packages/shadows)
  const FancyCurtainsDemoHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🕴
    final List<BoxShadow> _shadow = (Elevation.asBoxShadows(
              24,
              color: Colors.red,
            ) +
            const [
              BoxShadow(color: Colors.yellow, spreadRadius: 10, blurRadius: 10),
              BoxShadow(color: Colors.green, spreadRadius: 5, blurRadius: 25),
            ])
        // Material elevation `List<BoxShadow>`s have 3x shadows
        // - Kept at Material-standard opacities with `kElevationShadowOpacityRamp`
        // We added 2x shadows which we will now modify.
        //
        // (Simply demonstrating `rampOpacity` util from
        // 👥 Shadows - https://pub.dev/packages/shadows)
        .rampOpacity(kElevationShadowOpacityRamp + [0.2, 0.25]);

    return Expanded(
      child: Curtains.fancy(
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

class RegalCurtainsDemoVertical1 extends StatelessWidget {
  /// ⏰ [Curtains.regal] has intrinsic animation support.
  /// Provide `duration` and/or `curve` or let 📜 [Curtains] default.
  const RegalCurtainsDemoVertical1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains.regal(
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

class RegalCurtainsDemoVertical2 extends StatelessWidget {
  /// 🌈 [Curtains.fancy] and [Curtains.regal] support
  /// full-fat [BoxDecoration]s in lieu of `elevation`.
  const RegalCurtainsDemoVertical2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains.regal(
        startCurtain: FANCY_START, // 🌈
        endCurtain: buildFancyEnd(), // 🌈
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

class RegalCurtainsDemoHorizontal extends StatelessWidget {
  /// ```
  /// // [buildFancyEnd] has a `gradient` that
  /// // is not visible without [Curtains.spread].
  /// endCurtain: buildFancyEnd(Axis.horizontal), // (explains [Axis] pass)
  /// spread: 25, // Provide "girth" to [_Curtain]s for [Gradient] support.
  ///
  /// // `BoxDecoration.gradient` clips itself, but [BoxShadows],
  /// // which the simplest 📜 [Curtains] relies on for [Curtains.elevation],
  /// // need a [ClipRect] in order to not overflow.
  /// // - Manually disable clipping with [clipBehavior] initialized `Clip.none`
  /// // - This will alter the Widget tree depth
  /// clipBehavior: Clip.none,
  /// ```
  const RegalCurtainsDemoHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains.regal(
        scrollDirection: Axis.horizontal,
        startCurtain: FANCY_START,
        // [buildFancyEnd] has a `gradient` that
        // is not visible without [Curtains.spread].
        endCurtain: buildFancyEnd(Axis.horizontal), // (explains [Axis] pass)
        spread: 25, // Provide "girth" to [_Curtain]s for [Gradient] support.
        duration: DURATION,
        curve: CURVE,
        // `BoxDecoration.gradient` clips itself, but [BoxShadows],
        // which the simplest 📜 [Curtains] relies on for [Curtains.elevation],
        // need a [ClipRect] in order to not overflow.
        // - Manually disable clipping with [clipBehavior] initialized `Clip.none`
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

class RegalCurtainsDemoVertical3 extends StatelessWidget {
  /// ⚖ With a two-entry `List<double>` [Curtains.sensitivity],
  /// the 📜 [Curtains] scrims will appear later and disappear sooner.
  const RegalCurtainsDemoVertical3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Curtains.regal(
        startCurtain: FANCY_START,
        endCurtain: buildFancyEnd(),
        // ⚖ `start` appears once scrolled `350` px beyond start
        // ⚖ `end` appears once scrolled `175` px beyond end
        sensitivity: const [350.0, 175.0], // ⚖
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

const FANCY_START = BoxDecoration(
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

BoxDecoration buildFancyEnd([Axis? axis]) => BoxDecoration(
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

final List<Widget> generatedListVertical = List.generate(
  35,
  (i) => Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: ListTile(
      tileColor: Colors.red.withOpacity(0.05),
      leading: buildLeading(Axis.vertical, i),
      title: TITLE_VERTICAL,
      subtitle: SUBTITLE_VERTICAL,
    ),
  ),
);

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
          TITLE_HORIZONTAL,
          SUBTITLE_HORIZONTAL,
        ],
      ),
    ),
  ),
);

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

const TITLE_VERTICAL = Text(
  'Foo Bar Boo Baz',
  style: TextStyle(fontSize: 20),
);

const SUBTITLE_VERTICAL = Text('Lorem ipsum dolor sit amet');

const TITLE_HORIZONTAL = Text(
  'Foo\nBar\nBoo\nBaz',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 36),
);

const SUBTITLE_HORIZONTAL = Text(
  '\nLorem\nipsum\ndolor\nsit\namet\nlorem\nipsum\ndolor\nsit\namet',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 22),
);

const STYLE = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

const HEADER_VERTICAL = SizedBox(
  height: 90,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x44FF0000)),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        'Vertical ListView 👤 Header',
        style: STYLE,
      ),
    ),
  ),
);

const FOOTER_VERTICAL = SizedBox(
  height: 60,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x4400C3FF)),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        'Vertical ListView 🦶 Footer',
        style: STYLE,
      ),
    ),
  ),
);

const HEADER_HORIZONTAL = SizedBox(
  width: 80,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x44FF0000)),
    child: Center(
      child: Text(
        'H\nO\nR\nI\nZ\nO\nN\nT\nA\nL\n\n'
        '👤\n\nH\nE\nA\nD\nE\nR',
        textAlign: TextAlign.center,
        style: STYLE,
      ),
    ),
  ),
);

const FOOTER_HORIZONTAL = SizedBox(
  width: 60,
  child: DecoratedBox(
    decoration: BoxDecoration(color: Color(0x4400C3FF)),
    child: Center(
      child: Text(
        'H\nO\nR\nI\nZ\nO\nN\nT\nA\nL\n\n'
        '🦶\n\nF\nO\nO\nT\nE\nR',
        textAlign: TextAlign.center,
        style: STYLE,
      ),
    ),
  ),
);



🍀🍀🍀




/// Demo Source Code
library curtains;

import 'package:flutter/material.dart';
import 'package:curtains/curtains.dart';

class CodeViewer extends StatelessWidget {
  const CodeViewer(
    this.data, {
    Key? key,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 4.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFF3C2121)),
        child: Curtains.regal(
          startCurtain: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x44FF4444),
                spreadRadius: 20,
                blurRadius: 40,
              )
            ],
          ),
          endCurtain: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xAA990000),
                spreadRadius: 20,
                blurRadius: 40,
              )
            ],
          ),
          sensitivity: const [15, 40],
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 75,
              top: 15,
              right: 15,
              bottom: 15,
            ),
            child: SelectableText.rich(
              TextSpan(
                text: data,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    height: 1.5,
                    shadows: const [Shadow(offset: Offset(0, 1))]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SourceCode extends StatelessWidget {
  const SourceCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CodeViewer(
      ' /* this page */  ',
    );
  }
}
  ''',
    );
  }
}
