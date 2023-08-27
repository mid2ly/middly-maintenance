import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool visibleMiddly = false;
  bool visible_Middly = true;
  bool visibleMid2ly = true;
  bool visibleMiddlyKorean = true;
  final Duration duration = const Duration(milliseconds: 600);

  sceneZero() {
    setState(() {
      visibleMiddly = false;
      visible_Middly = true;
      visibleMid2ly = true;
      visibleMiddlyKorean = true;
    });
  }

  sceneFirst() {
    setState(() {
      visibleMiddly = true;
      visible_Middly = true;
      visibleMid2ly = true;
      visibleMiddlyKorean = true;
    });
  }

  sceneSecond() {
    setState(() {
      visibleMiddly = true;
      visible_Middly = false;
      visibleMid2ly = true;
      visibleMiddlyKorean = true;
    });
  }

  sceneThird() {
    setState(() {
      visibleMiddly = true;
      visible_Middly = false;
      visibleMid2ly = false;
      visibleMiddlyKorean = true;
    });
  }

  sceneFor() {
    setState(() {
      visibleMiddly = true;
      visible_Middly = false;
      visibleMid2ly = false;
      visibleMiddlyKorean = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: sceneZero, child: const Text('0')),
          TextButton(onPressed: sceneFirst, child: const Text('1')),
          TextButton(onPressed: sceneSecond, child: const Text('2')),
          TextButton(onPressed: sceneThird, child: const Text('3')),
          TextButton(onPressed: sceneFor, child: const Text('4'))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MiddlyKoreanAnimated(
              visible: visibleMiddlyKorean,
              duration: duration,
              child: MiddlyAnimated(
                visible: visibleMiddly,
                duration: duration,
                child: _middlyAnimated(
                  duration: duration,
                  visible: visible_Middly,
                  child: Mid2lyAnimated(
                    duration: duration,
                    visible: visibleMid2ly,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sceneFirst,
      ),
    );
  }
}

class MiddlyAnimated extends StatelessWidget {
  const MiddlyAnimated({
    super.key,
    required this.duration,
    required this.visible,
    required this.child,
  });

  final Duration duration;
  final bool visible;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: duration,
      offset: visible ? const Offset(0, 0) : const Offset(0, -0.7),
      child: AnimatedOpacity(
        duration: duration,
        opacity: visible ? 1 : 0,
        child: child,
      ),
    );
  }
}

class _middlyAnimated extends StatelessWidget {
  const _middlyAnimated({
    super.key,
    required this.duration,
    required this.visible,
    required this.child,
  });

  final Duration duration;
  final bool visible;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSlide(
          duration: duration,
          offset: visible ? const Offset(0, 0) : const Offset(0, -0.7),
          child: AnimatedOpacity(
            duration: duration,
            opacity: visible ? 1 : 0,
            child: Center(
              child: const Text(
                'Middly',
                style: TextStyle(fontSize: 150),
              ),
            ),
          ),
        ),
        AnimatedSlide(
          duration: duration,
          offset: visible ? const Offset(0, 0.7) : const Offset(0, 0),
          child: AnimatedOpacity(
            duration: duration,
            opacity: visible ? 0 : 1,
            child: child,
          ),
        ),
      ],
    );
  }
}

class Mid2lyAnimated extends StatelessWidget {
  const Mid2lyAnimated({
    super.key,
    required this.duration,
    required this.visible,
  });

  final Duration duration;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'mid',
          style: TextStyle(fontSize: 150),
        ),
        Stack(
          children: [
            AnimatedSlide(
              duration: duration,
              offset: visible ? const Offset(0, 0) : const Offset(0, -0.7),
              child: AnimatedOpacity(
                  duration: duration,
                  opacity: visible ? 1 : 0,
                  child: const Text(
                    'd',
                    style: TextStyle(fontSize: 150),
                  )),
            ),
            AnimatedSlide(
              duration: duration,
              offset: visible ? const Offset(0, 0.7) : const Offset(0, 0),
              child: AnimatedOpacity(
                  duration: duration,
                  opacity: visible ? 0 : 1,
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 150),
                  )),
            ),
          ],
        ),
        const Text(
          'ly',
          style: TextStyle(fontSize: 150),
        ),
      ],
    );
  }
}

class MiddlyKoreanAnimated extends StatelessWidget {
  const MiddlyKoreanAnimated({
    super.key,
    required this.duration,
    required this.visible,
    required this.child,
  });

  final Duration duration;
  final bool visible;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSlide(
          duration: duration,
          offset: visible ? const Offset(0, 0) : const Offset(0, -0.7),
          child: AnimatedOpacity(
            duration: duration,
            opacity: visible ? 1 : 0,
            child: child,
          ),
        ),
        AnimatedSlide(
          duration: duration,
          offset: visible ? const Offset(0, 0.7) : const Offset(0, 0),
          child: AnimatedOpacity(
            duration: duration,
            opacity: visible ? 0 : 1,
            child: Center(
              child: const Text(
                '미들리',
                style: TextStyle(fontSize: 150),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
