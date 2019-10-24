import 'package:flutter/material.dart';

class RecordIcons{
  static final List<IconData> iconData = <IconData>[
      Icons.call,
      Icons.school,
      Icons.battery_charging_full,
      Icons.brightness_7,
      Icons.build,
      Icons.business_center,
      Icons.cake,
      Icons.check_circle_outline,
      Icons.departure_board,
      Icons.directions_bike,
      Icons.directions_car
    ];

    static IconData getIcon(String icon){
      switch (icon) {
        case "call":
          return Icons.call;
        case "school":
          return Icons.school;
        case "battery":
          return Icons.battery_charging_full;
        case "call":
          return Icons.call;
        case "call":
          return Icons.call;
        case "call":
          return Icons.call;
        case "call":
          return Icons.call;
          
        default:
          return Icons.check_circle_outline;
      }
    }
}