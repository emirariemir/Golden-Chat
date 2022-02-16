import 'package:flutter/material.dart';

// COLORS
const Color kPinkColor = Color(0xFFFC5185);
const Color kBlueColor = Color(0xFF3FC1C9);

const InputDecoration kLoginDecoration = InputDecoration(
  hintText: 'Enter your value here',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.zero),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlueColor, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlueColor, width: 3.0),
  ),
);

const InputDecoration kRegisterDecoration = InputDecoration(
  hintText: 'Enter your value here',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.zero),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPinkColor, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPinkColor, width: 3.0),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.black, width: 2.0),
  ),
);
