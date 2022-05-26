import 'package:flutter/material.dart';
import 'dart:async';

class AJDanimate extends StatefulWidget {
  const AJDanimate(
      {super.key,
      required this.child,
      this.delay = 1000,
      this.duration = 800,
      this.begin = const Offset(0.0, -0.35),
      this.end = Offset.zero,
      this.curve = Curves.decelerate
      }
      );
  final Widget child;
  final int delay;
  final int duration;
  final Offset  begin;
  final Offset  end;
  final Curve  curve;
  @override
  State<AJDanimate> createState() => _AJDanimateState();
}

class _AJDanimateState extends State<AJDanimate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    final curve =
        CurvedAnimation(parent: _controller, curve: widget.curve);

    _animOffset =
        Tween<Offset>(begin: widget.begin, end:widget.end)
            .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(position: _animOffset, child: widget.child),
    );
  }
}
