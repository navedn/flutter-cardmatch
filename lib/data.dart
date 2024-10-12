import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> fillsourceArray() {
  return [
    'assets/images/Card1.png',
    'assets/images/Card1.png',
    'assets/images/Card2.png',
    'assets/images/Card2.png',
    'assets/images/Card3.png',
    'assets/images/Card3.png',
    'assets/images/Card4.png',
    'assets/images/Card4.png',
    'assets/images/Card5.png',
    'assets/images/Card5.png',
    'assets/images/Card6.png',
    'assets/images/Card6.png',
    'assets/images/Card7.png',
    'assets/images/Card7.png',
    'assets/images/Card8.png',
    'assets/images/Card8.png',
    'assets/images/Card9.png',
    'assets/images/Card9.png',
  ];
}

enum Level { Hard, Medium, Easy }

List getSourceArray(Level level) {
  List<String> levellist = [];
  List sourceArray = fillsourceArray();
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levellist.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levellist.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      levellist.add(sourceArray[i]);
    }
  }
  levellist.shuffle();

  return levellist;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = [];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  }

  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardstateKeys = [];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      cardstateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardstateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      cardstateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardstateKeys;
}
