/// ## 📜 Curtains Library
/// Provides super simple scrim 📜 [Curtains], or shadow decorations,
/// by wrapping a scrollable child, alluding to unrevealed content
/// while not at the start or end.
///
/// ### Reference
/// - Advanced usage with 📜 [Curtains.fancy]
/// - Animated usage with 📜 [Curtains.regal]
/// - [Elevation] paradigm handled by [`👥 package:shadows`](https://pub.dev/packages/shadows)
///   - Check it out for some neat [`Box`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxShadows.html)[`Shadow`](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowUtils.html) [utilities](https://pub.dev/documentation/shadows/latest/shadows/BoxShadowsUtils.html) that mesh with 📜 `Curtains`
library curtains;

import 'package:flutter/widgets.dart';

import '../curtains.dart';

/// ## 📜 Curtains
/// Wraps a scrollable [child] with scrim decorations
/// while not at the start or end, alluding to unrevealed content.
///
/// Choose simple [Curtains] or [Curtains.fancy] for initializing
/// custom [BoxDecoration]s, or select [Curtains.regal] for a
/// `fancy` experience with animation support.
/// ___
/// ### Simple 📜 Curtains
/// Provide a scrolling [child].
/// Specify scrim shadows by `double` [elevation] property.
/// - Default `elevation` is `9.0`
/// - [color] may be overridden
///
/// Initialize [scrollDirection] to match scrollable child:
/// - [Axis.vertical] (default) or [Axis.horizontal]
///
/// ```
/// final curtains = Curtains(
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
/// ✝ See: [Elevation.asBoxShadows]
/// ___
/// ### Fancy 📜 Curtains
/// All the ease of positioning provided by the default constructor,
/// but swap out the bespoke [elevation] `double` and provide one or both
/// of full-fat [BoxDecoration]s [startCurtain], [endCurtain].
///
/// Leaving a `Curtain` parameter `null` will render [NILL] in that position.
///
/// With a non-negative, two-entry `List<double>` [sensitivity],
/// the scrims of this 📜 [Curtains] will appear later and disappear sooner.
/// - `sensitivity[0]` defines start [_Curtain] sensitivity
/// - `sensitivity[1]` defines end [_Curtain] sensitivity
/// > Default `sensitivity` is `const [0,0]`.
///
/// Optionally define [Curtains.spread] for "girthier" scrims,
/// allowing [BoxDecoration.gradient] passes.
///
/// ```
/// final fancy = Curtains.fancy(
///   /// 🕴 Default constructor 📜 [Curtains] employs `Elevation.asBoxDecoration` to
///   /// render its decorations; but feel free to use these static methods, too,
///   /// if you opt for 👥 [package:shadows].
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
/// ___
/// ### Regal 📜 Curtains
/// All the ease of positioning provided by the default constructor
/// and the customization support of [Curtains.fancy], but support
/// is provided for handling animations intrinsically with
/// a [duration] and/or [curve]―or leave it up to 📜 [Curtains] defaults.
///
/// ```
/// final regal = Curtains.regal(
///   startCurtain: buildCurtain(),
///   endCurtain: buildCurtain(isStart: false),
///   // Provide `spread` to [Curtains] for decoration support beyond [BoxShadow]s.
///   // (Gives "girth" to individual [_Curtain] containers; otherwise `0`.)
///   spread: 50.0,
///   // ⚖ `start` appears once scrolled `350` px beyond start
///   // ⚖ `end` appears once scrolled `175` px beyond end
///   sensitivity: const [350.0, 175.0], // ⚖
///   // Regal 📜 Curtains are animated:
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
///     BoxShadow(color: Color(0x66FF0000), spreadRadius: 10.0, blurRadius: 30.0),
///     BoxShadow(color: Color(0x22FF0000), spreadRadius: 60.0, blurRadius: 150.0),
///   ],
/// );
/// ```
class Curtains extends StatefulWidget {
  /// A constant, empty [BoxDecoration].
  ///
  /// The decoration used by a [_Curtain] when it is not
  /// rendering its prescribed 📜 [Curtains] decoration.
  static const NILL = BoxDecoration();

  /// Wraps a scrollable [child] with scrim shadows
  /// while not at the start or end, alluding to unrevealed content.
  ///
  /// Construct simple 📜 [Curtains] that only require
  /// a scrollable [child].
  /// ___
  /// - Parameter [elevation] defaults to `9.0` and [color] may be overridden
  ///   - For more information, see: 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s
  ///   [`Elevation.asBoxDecoration`](https://pub.dev/documentation/shadows/latest/shadows/Elevation/asBoxDecoration.html).
  /// - Parameter [scrollDirection] defaults to [Axis.vertical] (like [ListView]).
  ///   - Initialize this property to match the child's `scrollDirection`.
  /// - Parameter [directionality] defaults to `Directionality.of(context)`,
  ///   but may be overridden.
  ///
  /// See class documentation for full examples: 📜 [Curtains]
  /// ___
  /// - Before any scrolling occurs, `end` [_Curtain] initializes visible,
  ///   even if this 📜 [Curtains] wraps a scrollable
  ///   that is not long enough to scroll.
  ///   - If this does not fit the situation, consider 📜 [Curtains.fancy]
  ///   with customizable `start` and `end` [_Curtain]s where respective
  ///   [BoxDecoration]s may be controlled programmatically.
  /// ```
  ///   endCurtain: (_listItems.length>2) ? _curtainDecoration : Curtains.NILL
  /// ```
  const Curtains({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.elevation = 9.0,
    this.color,
    required this.child,
    this.clipBehavior = Clip.hardEdge,
    this.directionality,
  })  : startCurtain = null,
        endCurtain = null,
        spread = null,
        sensitivity = const [0, 0],
        duration = const Duration(),
        curve = const Cubic(0, 0, 0, 0),
        super(key: key);

  /// Wraps a scrollable [child] with scrim decorations
  /// while not at the start or end, alluding to unrevealed content.
  ///
  /// Construct `fancy` 📜 [Curtains] that require
  /// a scrollable [child] and allow for `BoxDecoration`
  /// [startCurtain] & [endCurtain] customization.
  /// - Leaving a `Curtain` parameter `null` will render [NILL] in that position.
  ///
  /// With a non-negative, two-entry `List<double>` [sensitivity],
  /// the scrims of this 📜 [Curtains] will change state
  /// before the scrollable reaches a max extent.
  /// - `sensitivity[0]` defines start [_Curtain] sensitivity.
  /// - `sensitivity[1]` defines end [_Curtain] sensitivity.
  /// - Such that `sensitivity[0] == 50` will make this 📜 [Curtains]
  ///   `start`ing [_Curtain] change visibility at a point
  ///   50px away from scrollable `start`.
  /// - Default `sensitivity` is `const [0,0]`.
  ///
  /// Optionally define [Curtains.spread] for "girthier" scrims,
  /// allowing [BoxDecoration.gradient] passes.
  /// ___
  /// See default `const` constructor for simpler syntax with `double elevation`,
  /// or see [Curtains.regal] to add animation support.
  ///
  /// To use `double elevation` and the related Material [Elevation]
  /// shadow conversions like a simple 📜 Curtains, elect to employ
  /// 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s [Elevation.asBoxShadows]
  /// when constructing the [startCurtain] or [endCurtain].
  /// ___
  /// - Before any scrolling occurs, `end` [_Curtain] initializes visible,
  ///   even if this 📜 [Curtains] wraps a scrollable
  ///   that is not long enough to scroll.
  ///   - If this does not fit the situation, consider controlling
  ///   the [endCurtain] `BoxDecoration` programmatically.
  /// ```
  ///   endCurtain: (_listItems.length>2) ? _curtainDecoration : Curtains.NILL
  /// ```
  /// ___
  /// - Parameter [scrollDirection] defaults to [Axis.vertical] (like [ListView]).
  ///   - Initialize this property to match the child's `scrollDirection`.
  /// - Parameter [directionality] defaults to `Directionality.of(context)`,
  ///   but may be overridden.
  ///
  /// See class documentation for full examples: 📜 [Curtains]
  /// ___
  /// Assertation `List<double> >= double` is an `extension` on `List<double>`.
  /// See: [_SensitivityList].
  const Curtains.fancy({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.startCurtain,
    this.endCurtain,
    this.spread,
    this.sensitivity = const [0, 0],
    required this.child,
    this.clipBehavior = Clip.hardEdge,
    this.directionality,
  })  : elevation = null,
        color = null,
        duration = const Duration(),
        curve = const Cubic(0, 0, 0, 0),
        assert(sensitivity >= 0),
        super(key: key);

  /// Wraps a scrollable [child] with scrim decorations
  /// while not at the start or end, alluding to unrevealed content.
  ///
  /// Construct `regal` 📜 [Curtains] that require
  /// a scrollable [child] and allow for `BoxDecoration`
  /// [startCurtain] & [endCurtain] customization, as well as
  /// [duration] & [curve] for intrinsically animated state changes.
  /// - Leaving a `Curtain` parameter `null` will render [NILL] in that position.
  ///
  /// With a non-negative, two-entry `List<double>` [sensitivity],
  /// the scrims of this 📜 [Curtains] will change state
  /// before the scrollable reaches a max extent.
  /// - `sensitivity[0]` defines start [_Curtain] sensitivity.
  /// - `sensitivity[1]` defines end [_Curtain] sensitivity.
  /// - Such that `sensitivity[0] == 50` will make this 📜 [Curtains]
  ///   `start`ing [_Curtain] change visibility at a point
  ///   50px away from scrollable `start`.
  /// - Default `sensitivity` is `const [0,0]`.
  ///
  /// Optionally define [Curtains.spread] for "girthier" scrims,
  /// allowing [BoxDecoration.gradient] passes.
  /// ___
  /// See default `const` constructor for simpler syntax with `double elevation`,
  /// or see [Curtains.fancy] to eliminate the animation support.
  ///
  /// To use `double elevation` and the related Material [Elevation]
  /// shadow conversions like a simple 📜 Curtains, elect to employ
  /// 👥 [`package:shadows`](https://pub.dev/packages/shadows)'s [Elevation.asBoxShadows]
  /// when constructing the [startCurtain] or [endCurtain].
  /// ___
  /// - Before any scrolling occurs, `end` [_Curtain] initializes visible,
  ///   even if this 📜 [Curtains] wraps a scrollable
  ///   that is not long enough to scroll.
  ///   - If this does not fit the situation, consider controlling
  ///   the [endCurtain] `BoxDecoration` programmatically.
  /// ```
  ///   endCurtain: (_listItems.length>2) ? _curtainDecoration : Curtains.NILL
  /// ```
  /// ___
  /// - Parameter [scrollDirection] defaults to [Axis.vertical] (like [ListView]).
  ///   - Initialize this property to match the child's `scrollDirection`.
  /// - Parameter [directionality] defaults to `Directionality.of(context)`,
  ///   but may be overridden.
  ///
  /// See class documentation for full examples: 📜 [Curtains]
  /// ___
  /// Assertation `List<double> >= double` is an `extension` on `List<double>`.
  /// See: [_SensitivityList].
  const Curtains.regal({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.startCurtain,
    this.endCurtain,
    this.spread,
    this.sensitivity = const [0, 0],
    required this.child,
    this.clipBehavior = Clip.hardEdge,
    this.directionality,
    this.duration = const Duration(milliseconds: 350),
    this.curve = Curves.easeOut,
  })  : elevation = null,
        color = null,
        assert(sensitivity >= 0),
        super(key: key);

  /// Use [scrollDirection] parameter to match
  /// the scrolling direction of [child].
  /// - This positions the [_Curtain]s accordingly
  /// - Defaults to [Axis.vertical] (like [ListView])
  final Axis scrollDirection;

  /// Recreation of [Material.elevation] utilizing Flutter's native
  /// `Map<int, List<BoxShadow>` [kElevationToShadow].
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
  /// ___
  /// Because Material's elevation `BoxShadow`s have offsets,
  /// they do tend to behave better with vertically-scrolling content.
  ///
  /// Upgrade to [Curtains.fancy] or [Curtains.regal]
  /// for a full-fat `BoxDecorati`ng experience.
  final double? elevation;

  /// When using [elevation] to style this 📜 [Curtains],
  /// a [color] may be provided to stylize the Material elevation-like shadows.
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
  ///   [BoxShadowsUtils.rampOpacity] to further modify opacity.
  ///
  /// Ignored when constructing `fancy` or `regal` 📜 `Curtains`.
  final Color? color;

  /// The [BoxDecoration] to display at the start of the scrollable child
  /// when there is content behind/underneath it.
  /// > (When the start of the scrollable has been scrolled away from.)
  ///
  /// Left `null`, a [Curtains.NILL] empty decoration is provided.
  ///
  /// Consider a `const BoxDecoration()`.
  final BoxDecoration? startCurtain;

  /// The [BoxDecoration] to display at the end of the scrollable child
  /// when there is content beyond/underneath it.
  /// > (When the end of the scrollable has not been reached.)
  ///
  /// Left `null`, a [Curtains.NILL] empty decoration is provided.
  ///
  /// Consider a `const BoxDecoration()`.
  final BoxDecoration? endCurtain;

  /// For cases where [startCurtain] or [endCurtain] necessitates
  /// [_Curtain]s with girth―either `height` or `width`, considering [axis].
  /// - Such as a [BoxDecoration] with `gradient` instead of simply `boxShadow`.
  ///
  /// Left `null`, each [_Curtain] in this 📜 [Curtains] is girthless,
  /// rendering only its `List<BoxShadow>`.
  ///
  /// A non-zero [spread] *should* allow for [BoxDecoration.backgroundBlendMode]
  /// when `Color`s or `Gradient`s are used, but is bugged at the moment.
  //  TODO: Fix [BlendMode] support.
  final double? spread;

  /// With a non-negative, two-entry `List<double>` [sensitivity],
  /// the scrims of this 📜 [Curtains] will change state
  /// before the scrollable reaches a max extent.
  /// - `sensitivity[0]` defines start [_Curtain] sensitivity
  /// - `sensitivity[1]` defines end [_Curtain] sensitivity
  /// - Such that `sensitivity[0] == 50` will make this 📜 [Curtains]
  ///   `start`ing [_Curtain] change visibility at a point
  ///   50px away from scrollable `start`
  ///
  /// Default `sensitivity` is `const [0,0]`.
  final List<double> sensitivity;

  /// The scrollable [child] of this 📜 [Curtains].
  ///
  /// Assumed to scroll horizontally,
  /// otherwise initialize [scrollDirection] to `Axis.vertical`.
  final Widget child;

  /// By default this 📜 [Curtains] is [ClipRect]-ed
  /// for easy [BoxShadow] support.
  ///
  /// Initialize [clipBehavior] to [Clip.none] to not render this
  /// `ClipRect`, altering the tree depth if modified post-build.
  ///
  /// [Clip.antiAlias] or [Clip.antiAliasWithSaveLayer]
  /// may be passed if necessary.
  final Clip clipBehavior;

  /// The local [TextDirection]. If `null`, then
  /// the ambient `Directionality.of(context)` is obtained.
  ///
  /// Determines, for a [scrollDirection] `==` [Axis.horizontal]
  /// scrolling [child], if the `start` of the scrollable
  /// is at the left end or right.
  final TextDirection? directionality;

  /// When drawing 📜 [Curtains.regal], state changes are
  /// intrinsically animated over this [curve].
  final Curve curve;

  /// When drawing 📜 [Curtains.regal], state changes are
  /// intrinsically animated over this [duration].
  final Duration duration;

  /// If [widget.elevation] is established, employ [Elevation].
  ///
  /// Otherwise consider [isStartCurtain]
  /// and return appropriate [BoxDecoration] (or `null`).
  BoxDecoration? decoration({bool isStartCurtain = true}) {
    return (elevation != null)
        ? Elevation.asBoxDecoration(elevation!, color: color)
        : (isStartCurtain)
            ? startCurtain
            : endCurtain;
  }

  @override
  _CurtainsState createState() => _CurtainsState();
}

class _CurtainsState extends State<Curtains> {
  bool _isStartCurtainVisible = false;
  bool _isEndCurtainVisible = true; // Before any [ScrollUpdateNotification]s

  /// Render 📜 [Curtains] wrapping a scrollable whose
  /// [Position]ed [_Curtain]s, under correct circumstances, are visible
  /// with determined [BoxDecorations] to scrim the start/end.
  @override
  Widget build(BuildContext context) {
    final curtains = Stack(
      children: [
        Positioned.fill(child: widget.child),
        _Curtain(
          this.widget,
          isVisible: _isStartCurtainVisible,
        ),
        _Curtain(
          this.widget,
          isVisible: _isEndCurtainVisible,
          isStartCurtain: false,
        ),
      ],
    );

    /// 💖 Heart of Curtains
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        // Ensure this 📜 [Curtains] tightly wraps a scrollable child.
        // Hover over `depth` to see why.
        if (notification.depth == 0) {
          // By default, `widget.sensitivity` is `[0,0]`.
          //
          // `metrics.extent...` makes this super simple;
          // no `ScrollController` required!
          _isStartCurtainVisible =
              (notification.metrics.extentBefore > widget.sensitivity[0]);
          _isEndCurtainVisible =
              (notification.metrics.extentAfter > widget.sensitivity[1]);
          setState(() {});
        }
        return false; // Allow Notification to continue bubbling.
      },

      /// Crop any `Decoration`s to this 📜 [Curtains] by default,
      /// but offer to disable this [ClipRect], altering the tree depth.
      child: (widget.clipBehavior != Clip.none)
          ? ClipRect(
              clipBehavior: widget.clipBehavior,
              child: curtains,
            )
          : curtains,
    );
  }
}

/// One [_Curtain] in a set of directional 📜 [Curtains].
class _Curtain extends StatelessWidget {
  /// One [_Curtain], or `Positioned(Container())`, that calculates
  /// `0` or `null` values in a [Stack]ed set of directional 📜 [Curtains]
  /// - visibility state `bool` [isVisible]
  /// - identifier `bool` [isStartCurtain]
  ///
  /// Consider: directional means `start -> end`.
  const _Curtain(
    this.widget, {
    Key? key,
    required this.isVisible,
    this.isStartCurtain = true,
  }) : super(key: key);

  /// Parent 📜 [Curtains] `Widget` with relevant fields.
  final Curtains widget;

  /// Decide on this `bool` when instantiating a [_Curtain].
  ///
  /// There is only one `start` [_Curtain] and one `end` [_Curtain]
  /// for each 📜 [Curtains].
  final bool isVisible, isStartCurtain;

  /// In a vertical scenario, `left` & `right` obtain `0` and
  /// `top` and `bottom` are determined by [isStartCurtain] as `0` or `null`.
  ///
  /// In horizontal scenario, `top` and `bottom` obtain `0` and
  /// `left` and `right` are determined by
  /// both [isStartCurtain] *AND* [directionality] as `0` or `null`.
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // Detects `TextDirection` but can be overridden in constructors.
    final directionality = widget.directionality ?? Directionality.of(context);

    return Positioned(
      top: widget.scrollDirection == Axis.vertical && isStartCurtain ||
              widget.scrollDirection == Axis.horizontal
          ? 0
          : null,
      bottom: widget.scrollDirection == Axis.vertical && !isStartCurtain ||
              widget.scrollDirection == Axis.horizontal
          ? 0
          : null,
      left: (widget.scrollDirection == Axis.horizontal &&
                  directionality == TextDirection.ltr
              ? isStartCurtain
              : !isStartCurtain || widget.scrollDirection == Axis.vertical)
          ? 0
          : null,
      right: (widget.scrollDirection == Axis.horizontal &&
                  directionality == TextDirection.ltr
              ? !isStartCurtain
              : isStartCurtain || widget.scrollDirection == Axis.vertical)
          ? 0
          : null,

      /// [Curtains] and [Curtains.fancy] initialize [curve] to
      /// `const Cubic(0, 0, 0, 0)`, whereas [Curtains.regal] is animated.
      child: (widget.curve != const Cubic(0, 0, 0, 0))
          ? AnimatedContainer(
              width: (widget.scrollDirection == Axis.vertical)
                  ? _width
                  : isVisible
                      ? widget.spread ?? 0
                      : 0,
              height: (widget.scrollDirection == Axis.vertical)
                  ? widget.spread ?? 0
                  : isVisible
                      ? _height
                      : 0,
              decoration: BoxDecoration.lerp(
                  widget.decoration(isStartCurtain: isStartCurtain),
                  Curtains.NILL,
                  (isVisible) ? 0 : 1),
              duration: widget.duration,
              curve: widget.curve,
            )
          : Container(
              width: (widget.scrollDirection == Axis.vertical)
                  ? _width
                  : isVisible
                      ? widget.spread ?? 0
                      : 0,
              height: (widget.scrollDirection == Axis.vertical)
                  ? widget.spread ?? 0
                  : isVisible
                      ? _height
                      : 0,
              decoration: (isVisible)
                  ? widget.decoration(isStartCurtain: isStartCurtain)
                  : Curtains.NILL,
            ),
    );
  }
}

/// Extension on [List]`<num>`
/// specifically for handling a [Curtains.sensitivity].
extension _SensitivityList on List<num> {
  /// Extension on `List<num>` for [Curtains.sensitivity]
  /// to allow comparing the potential two sensitivity
  /// `double` values to a single [comparator] `double`.
  bool operator >=(double comparator) {
    if (length == 2 && this[0] >= comparator && this[1] >= comparator)
      return true;
    assert(
      false,
      '[SensitivityList] > List.length == 2 ($length) && $this >= $comparator\n'
      '[Curtains.regal] > Provide two non-negative values for [sensitivity]: `<double>[start,end]`',
    );
    return false;
  }
}
