import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/spin-to-win.png',
              controller: _controller, onLoaded: (composition) {
            _controller.duration = composition.duration;
          }),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => _controller.stop(),
                  child: const Text('Pause')),
              ElevatedButton(
                  onPressed: () => _controller.forward(),
                  child: const Text('Resume')),
              ElevatedButton(
                  onPressed: () {
                    _controller.repeat();
                    _controller.reset();
                  },
                  child: const Text('Repeat')),
            ],
          )
        ],
      ),
    );
  }
}
