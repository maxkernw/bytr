import 'package:flutter/material.dart';

import '../models/address.dart';
import '../models/user.dart';

enum TradeStatus { like, dislike }

class TradeProvider extends ChangeNotifier {
  List<User> _users = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;
  List<User> get users => _users;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;
  void setScreenSize(Size screenSize) => _screenSize = screenSize;
  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  TradeProvider() {
    resetTrades();
  }
  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    switch (status) {
      case TradeStatus.like:
        like();
        break;
      case TradeStatus.dislike:
        dislike();
        break;
      default:
        break;
    }
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  void resetTrades() {
    _users = <User>[
      const User(
          name: 'Bob',
          apartment: Apartment(
              landlord: "Stockholmshem",
              rooms: 4,
              sqm: 75,
              elevator: true,
              floor: 4),
          address: Address(
              postalcode: "12070",
              street: "Högbergsgatansgränd 75A",
              city: "Stockholm"),
          images: [
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13660.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13659.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13658.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13657.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file12581.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file14655.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file14659.jpg"
          ]),
      const User(
          name: 'Bosse',
          address: Address(
              postalcode: "11123",
              street: "Göteborgsgatan 3",
              city: "Göteborg"),
          apartment: Apartment(
              landlord: "SvB", rooms: 4, sqm: 99, elevator: false, floor: 4),
          images: [
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13658.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13657.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file12581.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file14655.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file14659.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13660.jpg",
            "https://marknad.byggvesta.se/byggvesta/files/jpg/file13659.jpg",
          ])
    ].toList();

    notifyListeners();
  }

  TradeStatus? getStatus() {
    final x = _position.dx;
    const delta = 100;
    if (x >= delta) {
      return TradeStatus.like;
    }
    if (x <= -delta) {
      return TradeStatus.dislike;
    }
    return null;
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);

    _nextCard();
    notifyListeners();
  }

  void dislike() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);

    _nextCard();
    notifyListeners();
  }

  Future _nextCard() async {
    if (users.isEmpty) {
      return;
    }

    await Future.delayed(const Duration(microseconds: 500));
    _users.removeLast();

    resetPosition();
  }
}
