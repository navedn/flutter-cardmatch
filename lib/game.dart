import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:flip_card/flip_card.dart';

class CardGame extends StatefulWidget {
  final Level _level;

  CardGame(this._level);

  @override
  _CardGameState createState() => _CardGameState(_level);
}

class _CardGameState extends State<CardGame> {
  _CardGameState(this._level);
  Level _level;
  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool? _wait = false;
  Timer? _timer;
  int _time = 5;
  int _left = 0;
  bool? _isFinished;
  List<dynamic>? _data;
  List<bool>? _cardFlips;
  List<GlobalKey<FlipCardState>>? _cardStateKeys;

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3,
            spreadRadius: 0.8,
            offset: Offset(2.0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(0.4),
      child: Image.asset(
        _data?[index],
      ),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(_level);
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);
    _time = 5;
    _left = (_data!.length ~/ 2);
    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer!.cancel();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    restart();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 4;

    return _isFinished!
        ? Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    restart();
                  });
                },
                child: Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      "Replay?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _time > 0
                          ? Text(
                              '$_time',
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          : Text(
                              'Pairs Left: $_left',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: (itemWidth / itemHeight),
                        ),
                        itemBuilder: (context, index) => _start
                            ? FlipCard(
                                key: _cardStateKeys![index],
                                onFlip: () {
                                  if (!_flip) {
                                    _flip = true;
                                    _previousIndex = index;
                                  } else {
                                    _flip = false;
                                    if (_previousIndex != index) {
                                      if (_data![_previousIndex] !=
                                          _data![index]) {
                                        _wait = true;

                                        Future.delayed(
                                            const Duration(milliseconds: 1500),
                                            () {
                                          _cardStateKeys![_previousIndex]
                                              .currentState!
                                              .toggleCard();
                                          _previousIndex = index;
                                          _cardStateKeys![_previousIndex]
                                              .currentState!
                                              .toggleCard();

                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _wait = false;
                                            });
                                          });
                                        });
                                      } else {
                                        _cardFlips![_previousIndex] = false;
                                        _cardFlips![index] = false;
                                        print(_cardFlips);

                                        setState(() {
                                          _left -= 1;
                                        });
                                        if (_cardFlips!
                                            .every((t) => t == false)) {
                                          print("Won");
                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _isFinished = true;
                                              _start = false;
                                            });
                                          });
                                        }
                                      }
                                    }
                                  }
                                  setState(() {});
                                },
                                flipOnTouch:
                                    _wait! ? false : _cardFlips![index],
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 3,
                                          spreadRadius: 0.8,
                                          offset: Offset(2.0, 1),
                                        )
                                      ]),
                                  margin: EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/images/Back.png",
                                    ),
                                  ),
                                ),
                                back: getItem(index),
                              )
                            : getItem(index),
                        itemCount: _data!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
