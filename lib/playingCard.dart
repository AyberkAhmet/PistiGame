import 'package:flutter/material.dart';

enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

class PlayingCard {
  CardSuit cardSuit;
  CardType cardType;

  PlayingCard({
    @required this.cardSuit,
    @required this.cardType,
  });
}