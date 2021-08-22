import 'package:flutter/material.dart';

import 'package:spectrum/spectrum.dart';
import 'package:template/template.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const DemoFrame());

/// An [InkWell] that calls `url_launcher`'s [launch] method when tapped,
/// linking to all packages by zaba.app. Slots well into an [AppBar.actions].
final zabaFrog = InkWell(
  onTap: () => launch('https://pub.dev/publishers/zaba.app/packages'),
  child: const FittedBox(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Text('🐸', style: TextStyle(fontSize: 40)),
    ),
  ),
);

/// [MaterialApp] frame.
class DemoFrame extends StatelessWidget {
  /// [MaterialApp] frame.
  const DemoFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.indigoAccent.shade700;

    return AnimatedTheme(
      data: ThemeData.from(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: color.asMaterialColor),
      ),
      duration: const Duration(milliseconds: 450),
      child: Builder(
        builder: (BuildContext _context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            color: color,
            theme: Theme.of(_context),
            home: Demo(color),
            // home:
            //  const Material(color: Colors.transparent, child: SliderDemo()),
          );
        },
      ),
    );
  }
}

/// Construct a [new Demo] `Widget` to fill a [DemoFrame].
class Demo extends StatelessWidget {
  /// Fill a [DemoFrame] with a [Scaffold] and [AppBar] whose body is a
  /// [PageView]. The `children` of this swiping page view are . . .
  const Demo(this.color, {Key? key}) : super(key: key);

  /// This initial color from [DemoFrame] is provided along to children.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('template'),
        actions: [zabaFrog],
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: const [Template()],
      ),
    );
  }
}
