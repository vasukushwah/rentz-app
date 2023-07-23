import 'package:flutter/material.dart';

class AnimatedTextScreen extends StatefulWidget {
  const AnimatedTextScreen({super.key});

  @override
  State<AnimatedTextScreen> createState() => _AnimatedTextScreenState();
}

class _AnimatedTextScreenState extends State<AnimatedTextScreen>
    with SingleTickerProviderStateMixin {
  // Use SingleTickerProviderStateMixin
  late AnimationController _controller;
  late Animation<double> _animationSize;
  late Animation<Offset> _animationPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Animation for changing font size
    _animationSize = Tween<double>(begin: 90, end: 32).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Animation for moving text from center to top
    _animationPosition = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(0, -1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Text')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset:
                  _animationPosition.value * MediaQuery.of(context).size.height,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: _animationSize.value),
                child: const Text("Rentz"),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
