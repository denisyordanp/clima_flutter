import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
  color: Colors.black
);

const kConditionTextStyle = TextStyle(
  fontSize: 70.0,
);

const kInputDecoration = InputDecoration(
    filled: true,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: "Enter city name",
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(10)
        ),
        borderSide: BorderSide.none
    )
);
