import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pisti/playingCard.dart';

class PlayTable extends StatefulWidget {
  @override
  _PlayTableState createState() => _PlayTableState();
}

class _PlayTableState extends State<PlayTable> {
  List<PlayingCard> sortedDeck = [];
  List<PlayingCard> randomPlayingDeck = [];
  List<PlayingCard> myHand = [];
  List<PlayingCard> oppoHand = [];
  List<PlayingCard> myCollectedDeck = [];
  List<PlayingCard> oppoCollectedDeck = [];
  List<PlayingCard> groundDeck = [];

  int oppoScore = 0;
  int myScore = 0;
  bool myTurn = true;

  @override
  void initState() {
    super.initState();
    _fillSortedDeck();
    _createRandomDeck();
    _fillMyAndOppoHand();
  }

  void _fillSortedDeck() {
    CardSuit.values.forEach((suit) {
      CardType.values.forEach((type) {
        sortedDeck.add(PlayingCard(
          cardType: type,
          cardSuit: suit,
        ));
      });
    });
  }

  void _createRandomDeck() {
    Random random = Random();

    while (sortedDeck.length > 0) {
      int randomNumber = random.nextInt(sortedDeck.length);

      randomPlayingDeck.add(sortedDeck.removeAt(randomNumber));
    }
  }

  void _fillMyAndOppoHand() {
    for (var i = 0; i < 5; i++) {
      myHand.add(randomPlayingDeck.removeLast());
    }
    for (var j = 0; j < 5; j++) {
      oppoHand.add(randomPlayingDeck.removeLast());
    }
  }

  void _clickedCard(int index) {
    if (groundDeck.length == 0) {
      groundDeck.add(myHand.removeAt(index));
      myTurn = false;
    } else if (groundDeck.length == 1) {
      if (groundDeck[0].cardType == myHand[index].cardType) {
        //TODO PISTI
        myScore += 10;
      } else {
        groundDeck.add(myHand.removeAt(index));
      }
    } else if (groundDeck.length > 1) {
      if (groundDeck[0].cardType == myHand[index].cardType) {
        while (groundDeck.length > 0) {
          myCollectedDeck.add(groundDeck.removeLast());
        }
        myCollectedDeck.add(myHand.removeAt(index));
      } else {
        groundDeck.add(myHand.removeAt(index));
      }
    }
  }

  Widget cardViewWidget(PlayingCard card) {
    return Container(
      decoration: BoxDecoration(
        
        color: Colors.white,
        border: Border.all(
          color: Colors.red,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 100.0,
      width: MediaQuery.of(context).size.width / 5,
      child: Column(
        children: <Widget>[
          Text(
            _returnAssetUrl(card),
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    oppoHand[0].cardType.toString() +
                        oppoHand[0].cardSuit.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    oppoHand[1].cardType.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    oppoHand[2].cardType.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    oppoHand[3].cardType.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    oppoHand[4].cardType.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Container(
              child: Text("Score: " + oppoScore.toString()),
            ),
            Container(
              child: Column(children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: groundDeck.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(groundDeck[index].cardType.toString());
                  },
                ),
              ]),
            ),
            Container(
              child: Text("Score: " + myScore.toString()),
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: myHand.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _clickedCard(index);
                        });
                      },
                      child: cardViewWidget(myHand[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//switch case asset url döndür

_returnAssetUrl(PlayingCard card) {
  switch (card.cardType) {
    case CardType.one:
      if (card.cardSuit == CardSuit.clubs) {
        return "one club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "one diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "one heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "one spades";
      }
      break;

    case CardType.two:
      if (card.cardSuit == CardSuit.clubs) {
        return "two club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "two diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "two heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "two spades";
      }
      break;

    case CardType.three:
      if (card.cardSuit == CardSuit.clubs) {
        return "three club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "three diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "three heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "three spades";
      }
      break;
    case CardType.four:
      if (card.cardSuit == CardSuit.clubs) {
        return "four club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "four diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "four heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "four spades";
      }
      break;
    case CardType.five:
      if (card.cardSuit == CardSuit.clubs) {
        return "five club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "five diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "five heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "five spades";
      }
      break;
    case CardType.six:
      if (card.cardSuit == CardSuit.clubs) {
        return "six club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "six diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "six heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "six spades";
      }
      break;

    case CardType.seven:
      if (card.cardSuit == CardSuit.clubs) {
        return "seven club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "seven diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "seven heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "seven spades";
      }
      break;

    case CardType.eight:
      if (card.cardSuit == CardSuit.clubs) {
        return "eight club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "eight diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "eight heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "eight spades";
      }
      break;

    case CardType.nine:
      if (card.cardSuit == CardSuit.clubs) {
        return "nine club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "nine diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "nine heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "nine spades";
      }
      break;

    case CardType.ten:
      if (card.cardSuit == CardSuit.clubs) {
        return "ten club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "ten diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "ten heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "ten spades";
      }
      break;

    case CardType.jack:
      if (card.cardSuit == CardSuit.clubs) {
        return "jack club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "jack diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "jack heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "jack spades";
      }
      break;

    case CardType.queen:
      if (card.cardSuit == CardSuit.clubs) {
        return "queen club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "queen diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "queen heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "queen spades";
      }
      break;

    case CardType.king:
      if (card.cardSuit == CardSuit.clubs) {
        return "king club";
      } else if (card.cardSuit == CardSuit.diamonds) {
        return "king diamonds";
      } else if (card.cardSuit == CardSuit.hearts) {
        return "king heart";
      } else if (card.cardSuit == CardSuit.spades) {
        return "king spades";
      }
      break;
    default:
  }
}
