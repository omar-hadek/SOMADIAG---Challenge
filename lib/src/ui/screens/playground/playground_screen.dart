// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'package:somadiac_challenge/src/data/caracters_data.dart';
import 'package:somadiac_challenge/src/ui/screens/playground/widget/control_button.dart';

class PlayGroundScreen extends StatefulWidget {
  final CharacterModel character;

  const PlayGroundScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<PlayGroundScreen> createState() => _PlayGroundScreenState();
}

class _PlayGroundScreenState extends State<PlayGroundScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  bool isMovingUp = false;
  bool isMovingDown = false;

  void moveDown() {
    if (isMovingDown) return;
    isMovingUp = false;
    isMovingDown = true;
    setState(() {});
  }

  void moveUp() {
    if (isMovingUp) return;
    isMovingDown = false;
    isMovingUp = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWebScreen = MediaQuery.of(context).size.width >= 600;
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: kIsWeb ? true : false,
      onKey: kIsWeb
          ? (event) {
              if (event is RawKeyDownEvent) {
                // print('key pressed $event');
                if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
                  moveUp();
                }
                if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
                  moveDown();
                }
              }
            }
          : null,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.character.name,
            ),
            centerTitle: true,
          ),
          body: Container(
            color: widget.character.color.withAlpha(25),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              children: [
                AnimatedPositioned(
                  top: !isMovingUp
                      ? null
                      : isWebScreen
                          ? 100
                          : 150,
                  bottom: !isMovingDown
                      ? null
                      : isWebScreen
                          ? 100
                          : 150,
                  right: null,
                  left: null,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceIn,
                  child: Center(
                    child: Hero(
                      tag: widget.character.path,
                      child: Container(
                        height: isWebScreen ? 250 : 200,
                        width: isWebScreen ? 250 : 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: Lottie.asset(
                          widget.character.path,
                          controller: _controller,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          onLoaded: (composition) {
                            _controller
                              ..duration = composition.duration
                              ..repeat();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                if (!kIsWeb)
                  Positioned(
                    top: 80,
                    child: ControlButton(
                      color: widget.character.color,
                      icon: Icons.arrow_upward_outlined,
                      onPressed: moveUp,
                    ),
                  ),
                if (!kIsWeb)
                  Positioned(
                    bottom: 80,
                    child: ControlButton(
                      color: widget.character.color,
                      icon: Icons.arrow_downward,
                      onPressed: moveDown,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
