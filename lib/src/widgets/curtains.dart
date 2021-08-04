/// ## 📜 Curtains
/// Provides `Curtains` and other named variety
library curtains;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:shadows/shadows.dart';

import '../models/sensitivity.dart';

// ignore: constant_identifier_names
const _350ms = Duration(milliseconds: 350);

/// ## 📜 Curtains
/// | [![images of curtains as 📜 Curtains](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainCurtains_square_small.gif)](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainCurtains.gif 'images of curtains as 📜 Curtains. Click for full size.') | Wraps a scrollable [child] with scrim decorations while not at the start or end, alluding to unrevealed content. |
/// |:--|:--|
//  Wraps a scrollable [child] with scrim decorations while
//  not at the start or end, alluding to unrevealed content.
///
/// Choose animated [Curtains] or [Curtains.instant] to provide custom \
/// [Decoration]s, or select [Curtains.elevated] for a simpler syntax \
/// with `double` [elevation] instead of individual `Decoration`s.
///
/// With non-negative [Sensitivity], the scrims of this 📜 `Curtains` \
/// will change state before the scrollable reaches a min/max extent.
/// - `sensitivity.start` defines [startCurtain] tolerance to min extent.
/// - `sensitivity.end` defines [endCurtain] tolerance to max extent.
///
/// Before any scrolling occurs [endCurtain] initializes visible, even if \
/// the 📜 `Curtains` wrap a scrollable not long enough to scroll.
/// - If this does not fit the situation, consider [endInitVisible].
/// - Also available is [startInitVisible]. Defaults `false`.
///
/// ---
/// {@tool snippet}
///
/// ### Elevated 📜 Curtains
/// Provide a scrolling [child]. \
/// Specify scrim shadows by `double` [elevation] property.
/// - Default `elevation` is `9.0`
/// - [color] may be overridden, but the Material-defined opacity is maintained
///
/// Initialize [scrollDirection] to match scrollable child:
/// - [Axis.vertical] (default) or [Axis.horizontal]
///
/// ✝ See: [Elevation.asBoxShadows]
/// ```
/// final curtains = Curtains.elevated(
///   child: ListView(
///     children: List.generate(
///       25,
///       (i) => ListTile(title: Text('ListTile #: ${i+1}')),
///     ),
///   ),
///   elevation: 24.0 // optional, defaults to `9.0`
///   // Optional color; will maintain Material elevation opacities.✝
///   color: Colors.red
/// );
/// ```
/// {@end-tool}
///
/// ---
/// {@tool snippet}
///
/// ### Instant 📜 Curtains
/// All the ease of positioning provided by the [Curtains.elevated] constructor, \
/// but swap out the bespoke [elevation] `double` and provide one or both of \
/// full-fat [Decoration]s [startCurtain] and [endCurtain].
///
/// Leaving a `Curtain` parameter `null` will render an empty decoration
/// in that position.
///
/// Optionally define [Curtains.spread] for "girthier" scrims, \
/// allowing, for example, [BoxDecoration.gradient] passes.
///
/// ```
/// final curtains = Curtains.instant(
///   /// 🕴 Named constructor 📜 [Curtains.elevated] employs
///   /// `Elevation.asBoxDecoration` to render its decorations; but feel free
///   /// to use these static methods, too, opting for 👥 [package:shadows].
///   startCurtain: const BoxDecoration(. . .) // Elevation.asBoxDecoration(12.0), // 🕴
///   endCurtain: BoxDecoration(boxShadow: Elevation.asBoxShadows(12.0)), // 🕴
///   child: ListView(
///     children: List.generate(
///       25,
///       (i) => ListTile(title: Text('ListTile #${i+1}')),
///     ),
///   ),
/// );
/// ```
/// {@end-tool}
///
/// ---
/// {@tool snippet}
///
/// ### Animated 📜 Curtains
/// All the ease of positioning provided by the [Curtains.elevated] constructor, \
/// and the customization support of [Curtains.instant], but animations support \
/// means these 📜 `Curtains` intrinsically morph with a [duration] and/or [curve];
/// or leave it up to the defaults.
///
/// ```
/// final curtains = Curtains(
///   startCurtain: buildCurtain(),
///   endCurtain: buildCurtain(isStart: false),
///   // Provide `spread` to [Curtains] for decoration support beyond [BoxShadow]s.
///   // (Gives "girth" to individual [_Curtain] containers; otherwise `0`.)
///   spread: 50.0,
///   // `start` appears once scrolled `350` px beyond start
///   // `end` appears once scrolled `175` px beyond end
///   sensitivity: const Sensitivity(350.0, 175.0),
///   // 📜 Curtains are animated:
///   duration: const Duration(milliseconds: 600),
///   curve: Curves.fastOutSlowIn,
///   // ↔ If wrapping a horizontal scrollable, initialize here, too:
///   scrollDirection: Axis.horizontal, // ↔
///   child: ListView(
///     scrollDirection: Axis.horizontal, // ↔
///     itemExtent: 100.0,
///     children: List.generate(
///       25,
///       (i) => ListTile(title: Text('ListTile #${i+1}')),
///     ),
///   ),
/// );
///
/// BoxDecoration buildCurtain({bool isStart = true}) => BoxDecoration(
///   gradient: LinearGradient(
///     colors: [Colors.green[400]!, Colors.green[400]!.withOpacity(0)],
///     begin: (isStart) ? Alignment.centerLeft : Alignment.centerRight,
///     end: (isStart) ? Alignment.centerRight : Alignment.centerLeft,
///   ),
///   boxShadow: const [
///     BoxShadow(color: Color(0x22FF0000), spreadRadius: 0.0, blurRadius: 5.0),
//      ignore: lines_longer_than_80_chars
///     BoxShadow(color: Color(0x66FF0000), spreadRadius: 10.0, blurRadius: 30.0),
//      ignore: lines_longer_than_80_chars
///     BoxShadow(color: Color(0x22FF0000), spreadRadius: 60.0, blurRadius: 150.0),
///   ],
/// );
/// ```
/// {@end-tool}
///
class Curtains extends StatefulWidget {
  /// | [![images of curtains as 📜 Curtains](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainCurtains_square_small.gif)](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainCurtains.gif 'images of curtains as 📜 Curtains. Click for full size.') | Wraps a scrollable [child] with scrim decorations while not at the start or end, alluding to unrevealed content. |
  /// |:--|:--|
  //  Wraps a scrollable [child] with scrim decorations while
  //  not at the start or end, alluding to unrevealed content.
  ///
  /// Construct animated 📜 `Curtains` that require a scrollable [child] \
  /// and allow for `Decoration` [startCurtain] and [endCurtain] customization \
  /// as well as [duration] & [curve] for morphing state changes.
  /// - Leaving a `Curtain` parameter `null` will render no curtain
  ///   in that position.
  ///
  /// ---
  /// Parameter [scrollDirection] defaults to [Axis.vertical]
  ///   like [ListView].
  /// - Initialize this property to match the child's `scrollDirection`.
  ///
  /// Parameter [textDirection] defaults to `Directionality.of(context)`, \
  /// but may be overridden.
  ///
  /// With non-negative [Sensitivity], the scrims of this 📜 `Curtains` \
  /// will change state before the scrollable reaches a min/max extent.
  /// - `sensitivity.start` defines [startCurtain] tolerance to min extent.
  /// - `sensitivity.end` defines [endCurtain] tolerance to max extent.
  ///
  /// Optionally define [spread] for "girthier" scrims,
  /// allowing, for example, [BoxDecoration.gradient].
  ///
  /// ---
  /// See [Curtains.elevated] constructor for simpler syntax `double elevation`, \
  /// or see [Curtains.instant] to eliminate animation support.
  ///
  /// To use `double elevation` and the related Material [Elevation] shadow \
  /// conversions like a simple 📜 `Curtains.elevated`, elect to employ
  /// 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s [Elevation.asBoxShadows] \
  /// when constructing the [startCurtain] or [endCurtain].
  ///
  /// ---
  /// - Before any scrolling occurs [endCurtain] initializes visible, even if \
  ///   this 📜 `Curtains` wraps a scrollable not long enough to scroll.
  ///   - If this does not fit the situation, consider [endInitVisible].
  ///   - Also available is [startInitVisible]. Defaults `false`.
  ///
  /// See class documentation for full examples: 📜 [Curtains].
  const Curtains({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.startCurtain,
    this.endCurtain,
    this.spread = 0.0,
    this.sensitivity = Sensitivity.none,
    this.startInitVisible = false,
    this.endInitVisible = true,
    this.alignment,
    this.textDirection,
    this.clipBehavior = Clip.hardEdge,
    required this.child,
    this.duration = _350ms,
    this.curve = Curves.easeOut,
  })  : _isDrawn = false,
        elevation = null,
        color = null,
        super(key: key);

  /// | [![images of curtains as 📜 Curtains](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainCurtains_square_small.gif)](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/curtainCurtains.gif 'images of curtains as 📜 Curtains. Click for full size.') | Wraps a scrollable [child] with scrim decorations while not at the start or end, alluding to unrevealed content. |
  /// |:--|:--|
  //  Wraps a scrollable [child] with scrim decorations while
  //  not at the start or end, alluding to unrevealed content.
  ///
  /// Construct `instant` 📜 `Curtains` that require a scrollable [child] \
  /// and allow for `Decoration` [startCurtain] and [endCurtain] customization.
  /// - These `Curtains.instant` are so-named because they are not animated
  ///   like [new Curtains].
  /// - Leaving a `Curtain` parameter `null` will render no decoration
  ///   in that position.
  ///
  /// ---
  /// Parameter [scrollDirection] defaults to [Axis.vertical] like [ListView].
  /// - Initialize this property to match the child's `scrollDirection`.
  ///
  /// Parameter [textDirection] defaults to `Directionality.of(context)`, \
  /// but may be overridden.
  ///
  /// With non-negative [Sensitivity], the scrims of this 📜 `Curtains` \
  /// will change state before the scrollable reaches a min/max extent.
  /// - `sensitivity.start` defines [startCurtain] tolerance to min extent.
  /// - `sensitivity.end` defines [endCurtain] tolerance to max extent.
  ///
  /// Optionally define [spread] for "girthier" scrims,
  /// allowing, for example, [BoxDecoration.gradient].
  ///
  /// ---
  /// To use `double elevation` and the related Material [Elevation]
  /// shadow conversions like a simple 📜 `Curtains.elevated`, elect to employ
  /// 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s [Elevation.asBoxShadows]
  /// when constructing the [startCurtain] or [endCurtain].
  ///
  /// ---
  /// - Before any scrolling occurs [endCurtain] initializes visible, even if \
  ///   this 📜 `Curtains` wraps a scrollable not long enough to scroll.
  ///   - If this does not fit the situation, consider [endInitVisible].
  ///   - Also available is [startInitVisible]. Defaults `false`.
  ///
  /// See class documentation for full examples: 📜 [Curtains].
  const Curtains.instant({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.startCurtain,
    this.endCurtain,
    this.spread = 0.0,
    this.sensitivity = Sensitivity.none,
    this.startInitVisible = false,
    this.endInitVisible = true,
    this.alignment,
    this.textDirection,
    this.clipBehavior = Clip.hardEdge,
    required this.child,
  })   : _isDrawn = false,
        elevation = null,
        color = null,
        duration = null,
        curve = null,
        super(key: key);

  /// Wraps a scrollable [child] with scrim shadows while \
  /// not at the start or end, alluding to unrevealed content.
  ///
  /// Construct simple `elevated` 📜 `Curtains` that only require \
  /// a scrollable [child]. Instead of [Decoration]s for each curtain, \
  /// supply `double` [elevation] that is shared by both.
  ///
  /// ---
  /// Parameter [scrollDirection] defaults to [Axis.vertical] like [ListView].
  /// - Initialize this property to match the child's `scrollDirection`.
  ///
  /// Parameter [textDirection] defaults to `Directionality.of(context)`, \
  /// but may be overridden.
  ///
  /// With non-negative [Sensitivity], the scrims of this 📜 `Curtains` \
  /// will change state before the scrollable reaches a min/max extent.
  /// - `sensitivity.start` defines [startCurtain] tolerance to min extent.
  /// - `sensitivity.end` defines [endCurtain] tolerance to max extent.
  ///
  /// ---
  /// Parameter [elevation] defaults to `9.0` and [color] may be overridden
  /// - For more information, see: 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s
  ///   [`Elevation`](https://pub.dev/documentation/shadows/latest/shadows/Elevation-class.html)
  ///   static methods, such as [Elevation.asBoxShadows]
  ///   and [Elevation.asBoxDecoration]
  ///
  /// ---
  /// - Before any scrolling occurs, `end` curtain initializes visible,
  ///   even if this 📜 [Curtains] wraps a scrollable not long enough to scroll.
  ///   - If this does not fit the situation, consider [endInitVisible].
  ///   - Also available is [startInitVisible]. Defaults `false`.
  ///
  /// See class documentation for full examples: 📜 [Curtains]
  ///
  /// [![animated gif showing elevated 📜 Curtains](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/elevated.gif)](https://raw.githubusercontent.com/Zabadam/curtains/main/doc/elevated.gif 'Animated gif showing elevated 📜 Curtains. Since recording, elevated Curtains are now animated by default! Click for full size.')
  const Curtains.elevated({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.elevation = 9.0,
    this.color,
    this.sensitivity = Sensitivity.none,
    this.startInitVisible = false,
    this.endInitVisible = true,
    this.alignment,
    this.textDirection,
    this.clipBehavior = Clip.hardEdge,
    required this.child,
    this.duration = _350ms,
    this.curve = Curves.easeOut,
  })  : _isDrawn = false,
        startCurtain = null,
        endCurtain = null,
        spread = 0.0,
        super(key: key);

  /// These `Curtains` behave a little differently. \
  /// Instead of toggling visibility based on the scrollable [child]'s extent,
  /// the [startCurtain] and [endCurtain] are static.
  ///
  /// Toggling either `isStartVisible` or `isEndVisible` will still
  /// intrinsically animate over the given [duration] and [curve].
  const Curtains.drawn({
    Key? key,
    Axis? axis = Axis.vertical,
    this.startCurtain,
    this.endCurtain,
    this.spread = 0.0,
    this.sensitivity = Sensitivity.none,
    bool isStartVisible = true,
    bool isEndVisible = true,
    this.alignment,
    this.textDirection,
    this.clipBehavior = Clip.hardEdge,
    Widget? child,
    this.duration = _350ms,
    this.curve = Curves.easeOut,
  })  : _isDrawn = true,
        scrollDirection = axis ?? Axis.vertical,
        child = child ?? const SizedBox(key: Key('DRAWN📜CURTAIN')),
        startInitVisible = isStartVisible, // will be checked on-the-fly
        endInitVisible = isEndVisible, // will be checked on-the-fly
        elevation = null,
        color = null,
        super(key: key);

  /// Match [scrollDirection] to the scrolling direction of [child].
  /// - This positions the curtains accordingly and decides what the
  ///   terms `start` and `end` mean throughought this `Curtains`.
  /// - Defaults to [Axis.vertical], like [ListView]
  final Axis scrollDirection;

  /// The [Decoration] to display at the start of the scrollable child
  /// when there is content behind/underneath it.
  /// (When the start of the scrollable has been scrolled away from.)
  ///
  /// Left `null`, an empty decoration is provided. \
  /// Consider a `const BoxDecoration(. . .)`.
  ///
  /// The `start` value in [sensitivity] correlates to this curtain's
  /// tolerance to the minimum scrollable extent of its child.
  final Decoration? startCurtain;

  /// The [Decoration] to display at the end of the scrollable child
  /// when there is content beyond/underneath it.
  /// (When the end of the scrollable has not been reached.)
  ///
  /// Left `null`, an empty decoration is provided. \
  /// Consider a `const BoxDecoration(. . .)`.
  ///
  /// The `end` value in [sensitivity] correlates to this curtain's
  /// tolerance to the maximum scrollable extent of its child.
  final Decoration? endCurtain;

  /// Recreation of `Material.elevation` utilizing Flutter's native
  /// `Map<int, List<BoxShadow>` [kElevationToShadow].
  ///
  /// Ignored when constructing standard or `instant` 📜 `Curtains`.
  ///
  /// ### That map only contains values for
  /// > ### `key`: `0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24`
  ///
  /// 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s [Elevation]
  /// static decoration methods will utilize the largest valid `key`
  /// that is at least equal to this [elevation] as well as the next highest
  /// available `key`, and [BoxShadow.lerpList] the two
  /// (where `t` for `lerpList` is the percentage between
  /// these two `key`s that [elevation] sits ).
  ///
  /// ___
  /// Because Material's elevation `BoxShadow`s have offsets,
  /// they do tend to behave better with vertically-scrolling content. \
  /// Consider these shadow [Offset]s when using [elevation].
  ///
  /// Upgrade to [Curtains] or [Curtains.instant]
  /// for a full-fat `BoxDecorati`ng experience.
  final double? elevation;

  /// When using [elevation] to style this 📜 `Curtains`, a [color] may be
  /// provided to stylize the Material elevation-like shadows.
  ///
  /// Ignored when constructing standard or `instant` 📜 `Curtains`.
  ///
  /// Left `null`, default is three different `Color`s for
  /// three different [BoxShadow]s, as seen in [kElevationToShadow]:
  /// ```
  /// const Color _kKeyUmbraOpacity = Color(0x33000000); // opacity = 0.2
  /// const Color _kKeyPenumbraOpacity = Color(0x24000000); // opacity = 0.14
  /// const Color _kAmbientShadowOpacity = Color(0x1F000000); // opacity = 0.12
  /// ```
  /// - Providing a [color] will maintain these opacities in the
  /// resultant `List<BoxShadow>`.
  ///   - Consider 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s
  ///   BoxShadowsUtils \
  ///   `List<BoxShadow>.rampOpacity` to modify opacity.
  final Color? color;

  /// For scenarios where [startCurtain] or [endCurtain] necessitate
  /// curtains with girth ― either `height` or `width`, considering axis.
  /// - Such as a [BoxDecoration] with `gradient` instead of simply `boxShadow`.
  ///
  /// Left `null`, each curtain in this 📜 `Curtains` is girthless,
  /// rendering only its `List<BoxShadow>`.
  ///
  /// A non-zero [spread] *should* allow for [BoxDecoration.backgroundBlendMode]
  /// when `Color`s or `Gradient`s are used, but is buggy at the moment.
  //  TODO: Fix [BlendMode] support.
  final double spread;

  /// With non-negative [Sensitivity], the scrims of this 📜 `Curtains`
  /// will change state before the scrollable reaches a min/max extent.
  /// - `sensitivity.start` defines [startCurtain] tolerance to min extent.
  /// - `sensitivity.end` defines [endCurtain] tolerance to max extent.
  ///
  /// - Such that `sensitivity.start == 50` will make this 📜 `Curtains`
  ///   [startCurtain] toggle visibility at a point 50px away from
  ///   the minimum scrollable extent.
  ///
  /// Default is [Sensitivity.none].
  final Sensitivity sensitivity;

  /// This 📜 `Curtains` controls its visibility by `ScrollUpdateNotification`s.
  /// Override initialization visibility of this curtain with this `bool`.
  ///
  /// By default, the [endCurtain] begins visible before any
  /// [ScrollUpdateNotification]s have been sent by user scroll.
  ///
  /// By default, the [startCurtain] begins invisible, implying the scrollable
  /// begins at its start.
  /// - Which may not always be the case, and would lead to a scenario where
  ///   this `Curtains` has not yet heard any `ScrollNotification`s
  ///   to appropriately render it.
  final bool startInitVisible, endInitVisible;

  /// Override the alignment of the [child] within the `Stack` that houses it
  /// and these 📜 `Curtains`.
  ///
  /// Calculated by [Directionality] (or overridden [textDirection]) by default.
  final AlignmentGeometry? alignment;

  /// The local [TextDirection]. If left `null`, the ambient
  /// `Directionality.of(context)` is obtained.
  ///
  /// Determines, for a [scrollDirection] `==` [Axis.horizontal]
  /// scrolling [child], if the `start` of the scrollable
  /// is at the left end or right.
  final TextDirection? textDirection;

  /// By default this 📜 `Curtains` is [ClipRect]-ed
  /// for easy [BoxShadow] support.
  ///
  /// Initialize [clipBehavior] to [Clip.none] to not render this
  /// `ClipRect`, altering the tree depth if modified post-build.
  /// This would allow clipping in some other way elsewhere in the tree
  /// and save on clip calculations.
  ///
  /// Default is [Clip.hardEdge]. \
  /// [Clip.antiAlias] or [Clip.antiAliasWithSaveLayer]
  /// may be passed if necessary.
  final Clip clipBehavior;

  /// The scrollable [child] of this 📜 `Curtains`.
  ///
  /// Assumed to scroll vertically,
  /// otherwise initialize [scrollDirection] to `Axis.horizontal`.
  final Widget child;

  /// When drawing 📜 [Curtains], state changes are
  /// intrinsically animated over this [duration].
  ///
  /// Default is `350ms`. \
  /// If `null`, falls back to [new Duration].
  ///
  /// Unavailable for [Curtains.instant].
  final Duration? duration;

  /// When drawing 📜 [Curtains], state changes are
  /// intrinsically animated over this [curve].
  ///
  /// Default is [Curves.easeOut]. \
  /// If `null`, falls back to [Curves.linear].
  ///
  /// Unavailable for [Curtains.instant].
  final Curve? curve;

  final bool _isDrawn;

  @override
  _CurtainsState createState() => _CurtainsState();

  @override
  void debugFillProperties(properties) {
    super.debugFillProperties(properties);
    properties
          ..add(FlagProperty('isDrawn',
              value: _isDrawn,
              defaultValue: false,
              ifTrue: 'static as [Curtains.drawn]'))
          ..add(DiagnosticsProperty<Axis>('axis', scrollDirection,
              defaultValue: Axis.vertical))
          ..add(DoubleProperty('elevation', elevation, defaultValue: null))
          ..add(DiagnosticsProperty<Color>('color', color, defaultValue: null))
          ..add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior,
              defaultValue: Clip.hardEdge))
          ..add(DoubleProperty('spread', spread, defaultValue: null))
          ..add(DiagnosticsProperty<Sensitivity>('sensitivity', sensitivity,
              defaultValue: null))
          ..add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment,
              defaultValue: null))
          ..add(DiagnosticsProperty<TextDirection>(
              'textDirection', textDirection, defaultValue: null))
          ..add(DiagnosticsProperty<Duration>('duration', duration,
              defaultValue: null, ifNull: 'is not animated'))
          ..add(DiagnosticsProperty<Curve>('curve', curve,
              defaultValue: null, ifNull: 'is not animated'))
          ..add(DiagnosticsProperty<Decoration>('startCurtain', startCurtain,
              defaultValue: null))
          ..add(DiagnosticsProperty<Decoration>('endCurtain', endCurtain,
              defaultValue: null))
        //
        ;
  }
}

class _CurtainsState extends State<Curtains> {
  // Before any [ScrollUpdateNotification]s
  bool _isStartVisible = false;
  bool _isEndVisible = true;

  bool get drawn => widget._isDrawn;

  @override
  void initState() {
    super.initState();
    // May have been overridden prior to any `ScrollUpdateNotification`s.
    _isStartVisible = widget.startInitVisible;
    _isEndVisible = widget.endInitVisible;
  }

  /// Render 📜 [Curtains] wrapping a scrollable whose [Positioned]
  /// [_Curtain]s, under correct circumstances, are visible with
  /// determined [BoxDecoration]s to scrim the start/end.
  @override
  Widget build(BuildContext context) {
    // Detects `TextDirection` but can be overridden in constructors.
    final directionality = widget.textDirection ??
        Directionality.maybeOf(context) ??
        TextDirection.ltr;

    // Determines alignment by `Directionality`, but may be overridden.
    final alignment = widget.alignment ??
        (widget.scrollDirection == Axis.vertical
            ? Alignment.topCenter
            : directionality == TextDirection.ltr
                ? Alignment.centerLeft
                : Alignment.centerRight);

    final curtains = Stack(
      clipBehavior: widget.clipBehavior,
      alignment: alignment,
      children: [
        Align(alignment: alignment, child: widget.child),

        // if `drawn`? then check for changes to the core value
        // via constructor. Otherwise, traditionally, check the
        // private bool controlled by `NotificationListener`.
        _Curtain(
          widget,
          isVisible: drawn ? widget.startInitVisible : _isStartVisible,
        ),
        _Curtain.end(
          widget,
          isVisible: drawn ? widget.endInitVisible : _isEndVisible,
        ),
      ],
    );

    /// 💖 Heart of Curtains
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        // Ensure this 📜 [Curtains] tightly wraps a scrollable child.
        // Hover over `depth` to see why.
        if (notification.depth == 0 && !widget._isDrawn) {
          // By default, `widget.sensitivity` is `0,0`.
          // `metrics.extent` makes this super simple.
          // No ScrollController required!
          _isStartVisible =
              (notification.metrics.extentBefore > widget.sensitivity.start);
          _isEndVisible =
              (notification.metrics.extentAfter > widget.sensitivity.end);
          setState(() {});
        }
        return false; // Allow Notification to continue bubbling.
      },

      // Crop any `Decoration`s to this 📜 [Curtains] by default,
      // but offer to disable this [ClipRect], altering the tree depth.
      child: (widget.clipBehavior == Clip.none)
          ? curtains
          : ClipRect(clipBehavior: widget.clipBehavior, child: curtains),
    );
  }
}

/// One [_Curtain], or `Positioned(child:Container())`, that calculates
/// `0` or `null` values in a [Stack]ed set of directional 📜 [Curtains]
/// - visibility state `bool` [isVisible]
/// - identifier `bool` [isStart]
///
/// Consider: directional means `start -> end`.
class _Curtain extends StatelessWidget {
  const _Curtain(this.widget, {Key? key, required this.isVisible})
      : isStart = true,
        super(key: key);

  const _Curtain.end(this.widget, {Key? key, required this.isVisible})
      : isStart = false,
        super(key: key);

  /// Parent 📜 [Curtains] `Widget` with relevant fields.
  final Curtains widget;

  /// Decide on this `bool` when instantiating a [_Curtain].
  ///
  /// There is only one `start` [_Curtain] and one `end` [_Curtain]
  /// for each 📜 [Curtains].
  final bool isVisible, isStart;

  /// If `elevation` non-`null` via `Curtains.elevated` constructor,
  /// employ [Elevation]. Otherwise considers [isStartCurtain],
  /// returns appropriate `BoxDecoration?`.
  Decoration? getDecoration(bool isStartCurtain) => (widget.elevation != null)
      ? Elevation.asBoxDecoration(widget.elevation!, color: widget.color)
      : (isStartCurtain)
          ? widget.startCurtain
          : widget.endCurtain;

  /// In horizontal scenario, `left` and `right` are determined by
  /// both [isStart] *AND* [Directionality].
  @override
  Widget build(BuildContext context) {
    // Detects `TextDirection` but can be overridden in constructors.
    final directionality = widget.textDirection ??
        Directionality.maybeOf(context) ??
        TextDirection.ltr;

    final isHorizontal = widget.scrollDirection == Axis.horizontal;
    final isLeft = ((directionality == TextDirection.ltr && isStart) ||
        (directionality != TextDirection.ltr && !isStart));

    // For vertical Curtains, width tries to be maximum.
    // For horizontal Curtains, width tries to be `spread`.
    final width = isHorizontal
        ? isVisible
            ? widget.spread
            : 0.0
        : MediaQuery.maybeOf(context)?.size.width ?? double.maxFinite;
    final height = isHorizontal
        ? MediaQuery.maybeOf(context)?.size.height ?? double.maxFinite
        : isVisible
            ? widget.spread
            : 0.0;

    /// Return positioned _Curtain
    return (widget.curve == null) // then this is [Curtains.instant]
        ? Positioned(
            left: isHorizontal && isLeft ? 0 : null,
            top: !isHorizontal && isStart ? 0 : null,
            right: isHorizontal && !isLeft ? 0 : null,
            bottom: !isHorizontal && !isStart ? 0 : null,
            child: Container(
              width: width,
              height: height,
              decoration:
                  (isVisible) ? getDecoration(isStart) : const BoxDecoration(),
            ),
          )
        : AnimatedPositioned(
            left: isHorizontal && isLeft ? 0 : null,
            top: !isHorizontal && isStart ? 0 : null,
            right: isHorizontal && !isLeft ? 0 : null,
            bottom: !isHorizontal && !isStart ? 0 : null,
            duration: widget.duration ?? const Duration(),
            curve: widget.curve ?? Curves.linear,
            child: IgnorePointer(
              // `Curtains.elevated` and `Curtains.instant` initialize `curve`
              // to `const Cubic(0, 0, 0, 0)`, whereas `Curtains` is animated.
              child: AnimatedOpacity(
                opacity: isVisible ? 1.0 : 0.0,
                duration: widget.duration ?? const Duration(),
                curve: widget.curve ?? Curves.linear,
                child: AnimatedContainer(
                  width: width,
                  height: height,
                  decoration: getDecoration(isStart),
                  duration: widget.duration ?? const Duration(),
                  curve: widget.curve ?? Curves.linear,
                ),
              ),
            ),
          );
  }
}
