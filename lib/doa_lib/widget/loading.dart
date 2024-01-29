import 'package:doa/doa_lib/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends PopupRoute {
  static Loading? _currentHud;
  // show loading
  static void show() async {
    try {
      if (_currentHud != null) {
        _currentHud?.navigator?.pop();
      }
      Loading hud = Loading();
      _currentHud = hud;
      await Navigator.push(Get.context!, hud);
    } catch (e) {
      _currentHud = null;
    }
  }

  //hide loading
  static void hide() async {
    try {
      _currentHud?.navigator?.pop();
      _currentHud = null;
    } catch (e) {
      _currentHud = null;
    }
  }

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => kThemeAnimationDuration;

  @override
  bool get barrierDismissible => false;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // print(STATE(context).sendProgress);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black26,
          ),
          Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: LOADING_ICON(context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack LOADING_ICON(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      const LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin, color: Colors.orange),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: IMAGE_ASSET(
              "assets/bni_logo.png",
            ),
          )),
    ]);
  }
}

///34 different types animation enums.
enum Indicator {
  circleStrokeSpin,
}

/// Entrance of the loading.
class LoadingIndicator extends StatelessWidget {
  /// Indicate which type.
  final Indicator? indicatorType;

  /// The color you draw on the shape.
  final Color? color;
  final List<Color>? colors;
  const LoadingIndicator({
    Key? key,
    @required this.indicatorType,
    this.color,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actualColor = color ?? Theme.of(context).primaryColor;
    return DecorateContext(
      decorateData: DecorateData(
          indicator: indicatorType, color: actualColor, colors: colors),
      child: AspectRatio(
        aspectRatio: 1,
        child: _buildIndicator(),
      ),
    );
  }

  _buildIndicator() {
    switch (indicatorType) {
      case Indicator.circleStrokeSpin:
        return CircleStrokeSpin();
      default:
        throw Exception("no related indicator type:$indicatorType");
    }
  }
}

@immutable
class DecorateData {
  final Color? color;
  final Indicator? indicator;
  final List<Color>? colors;

  const DecorateData(
      {@required this.indicator, this.color = Colors.white, this.colors});

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final DecorateData typedOther = other;
    return color == typedOther.color &&
        colors == typedOther.colors &&
        indicator == typedOther.indicator;
  }

  @override
  int get hashCode => Object.hash(color, indicator);

  @override
  String toString() {
    return 'DecorateData{color: $color, indicator: $indicator}';
  }
}

class DecorateContext extends InheritedWidget {
  final DecorateData? decorateData;

  DecorateContext({
    Key? key,
    @required this.decorateData,
    @required Widget? child,
  }) : super(key: key, child: child!);

  @override
  bool updateShouldNotify(DecorateContext oldWidget) =>
      oldWidget.decorateData == decorateData;

  static DecorateContext of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }
}

/// CircleStrokeSpin.
class CircleStrokeSpin extends StatelessWidget {
  const CircleStrokeSpin({super.key});

  @override
  Widget build(BuildContext context) {
    final color = DecorateContext.of(context).decorateData!.color;
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: color)),
      child: const CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
