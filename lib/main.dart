import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key _refreshKey = UniqueKey();

  void _handleRefresh() => setState(() {
        _refreshKey = UniqueKey();
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      key: _refreshKey,
      title: 'Middly',
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SingleTrans(handleRefresh: _handleRefresh),
      ),
    );
  }
}

class SingleTrans extends StatelessWidget {
  const SingleTrans({
    super.key,
    required this.handleRefresh,
  });

  final void Function()? handleRefresh;

  @override
  Widget build(BuildContext context) {
    Animate.defaultDuration = 700.ms;
    Animate.defaultCurve = Curves.easeOutQuart;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 102,
            width: 68.5,
            child: Center(
              child: const Text(
                'M',
                style: TextStyle(fontSize: 75),
              )
                  .animate()
                  .then(delay: 2700.ms)
                  .blurXY(end: 25, curve: Curves.easeInQuart)
                  .swap(
                    builder: (_, __) => const Text(
                      'm',
                      style: TextStyle(fontSize: 75),
                    ).animate().blurXY(begin: 25, end: 0),
                  ),
            ),
          ),
          const Text(
            'id',
            style: TextStyle(fontSize: 75),
          ),
          SizedBox(
            height: 102,
            width: 46.5,
            child: Center(
              child: const Text(
                'd',
                style: TextStyle(fontSize: 75),
              )
                  .animate()
                  .then(delay: 4900.ms)
                  .fadeOut()
                  .slideY(begin: 0, end: -0.7)
                  .swap(
                    builder: (_, __) => const Text(
                      '2',
                      style: TextStyle(fontSize: 75),
                    ).animate().fadeIn().slideY(begin: 0.7, end: 0),
                  ),
            ),
          ),
          const Text(
            'ly',
            style: TextStyle(fontSize: 75),
          ),
        ],
      )
          .animate()
          .then(delay: 1000.ms)
          .fadeIn()
          .slideY(begin: -0.7, end: 0)
          .then(delay: 5600.ms)
          .fadeOut()
          .slideY(begin: 0, end: -0.7)
          .swap(
            builder: (_, __) => Text(
              '미들리',
              style: GoogleFonts.ibmPlexSansKr().copyWith(fontSize: 75),
            ).animate().fadeIn().slideY(begin: -0.7, end: 0),
          )
          .then(delay: 1700.ms)
          .fadeOut()
          .slideY(begin: 0, end: -0.7)
          .swap(
            builder: (_, __) => Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 27),
                    const Text(
                      'Middly',
                      style: TextStyle(fontSize: 75),
                    ).animate().fadeIn().slideY(begin: 0.7, end: 0),
                    Text(
                      'A new world is coming soon.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).disabledColor,
                      ),
                    )
                        .animate()
                        .then(delay: 1700.ms)
                        .fadeIn()
                        .slideY(begin: 0.7, end: 0)
                        .then(delay: 1000.ms)
                        .shimmer(
                          curve: Curves.linear,
                          duration: 400.ms,
                        ),
                  ],
                ),
                const SizedBox(
                  height: double.infinity,
                ),
                Positioned.fill(
                  bottom: 30,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: handleRefresh,
                    )
                        .animate()
                        .then(delay: 6000.ms)
                        .fadeIn()
                        .rotate(begin: -0.75)
                        .slideY(begin: 0.7, end: 0),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
