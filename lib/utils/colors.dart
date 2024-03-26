import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(251, 186, 30, 1);

const Color secondaryColor = Color.fromRGBO(37, 37, 37, 1);
const Color backgroundSecondryColor = Color.fromRGBO(255, 222, 164, 1);
const Color backgroundColorDark = Colors.black;
const Color backgroundColorLight = Color(0xFFFFFFFF);
Color cardColorDark = cardColorLight;
Color cardColorLight = secondaryColor.withOpacity(0.3);
const Color chatActionColorLight = Color(0xFFECECEC);
const Color chatActionColorDark = Color(0xFF2C2C2C);

const Color reciveMessagebackColor = Color.fromRGBO(232, 232, 232, 1);
const Color sendMessagebackColor = Color.fromRGBO(246, 215, 118, 0.5);

const Color borderColor = Colors.black26;
LinearGradient primaryGradient = const LinearGradient(
  colors: [
    primaryColor,
    secondaryColor,
  ],
  stops: [0.2, 1.0],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
