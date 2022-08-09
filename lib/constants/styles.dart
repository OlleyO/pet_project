import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_colors.dart';

final InputDecoration kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(14.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: AppColors.gray,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: AppColors.blue,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: AppColors.gray,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
);

final TextStyle kTextFieldStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: AppColors.black,
);

final kAppBarTitleStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontStyle: FontStyle.italic,
  fontSize: 16,
  color: AppColors.black,
);

final k16Med = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

final k16SemiBold = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);

final k12SemiBold = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w600,
);

final k12Med = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
);
