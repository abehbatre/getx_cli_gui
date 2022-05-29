import 'package:flutter/material.dart';

// —————————————————————————————————————————————————————————————————————————————
// ## BASE COLOR = https://www.figma.com/file/3Im8vjBMrqwZnMBL1qUEQU/Design-Tokens-1.0---%5BDiskette%5D?node-id=711%3A9041
// —————————————————————————————————————————————————————————————————————————————

// —————————————————————————————————————————————————————————————————————————————
// primary
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorPrimary = MaterialColor(
  _colorPrimaryValue,
  <int, Color>{
    50: Color(0xFFF3F6FE),
    100: Color(0xFFDBE3FC),
    200: Color(0xFFB8C8F9),
    300: Color(0xFF90A5EE),
    400: Color(0xFF7080DD),
    500: Color(0xFF455DC7),
    600: Color(0xFF3246AB),
    700: Color(0xFF22328F),
    800: Color(0xFF162173),
    900: Color(0xFF0D165F),
  },
);
const int _colorPrimaryValue = 0xFF455DC7;
const colorPrimaryDark = Color(0xFF3246AB);
const colorPrimaryLight = Color(0xFFF3F6FE);

// —————————————————————————————————————————————————————————————————————————————
// secondary / accent
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorAccent = MaterialColor(
  _colorAccentValue,
  <int, Color>{
    50: Color(0xFFFFF8EE),
    100: Color(0xFFFFEACB),
    200: Color(0xFFFFDDA9),
    300: Color(0xFFFFCF87),
    400: Color(0xFFFFC164),
    500: Color(0xFFFFBA53),
    600: Color(0xFFDB953C),
    700: Color(0xFFB77329),
    800: Color(0xFF93541A),
    900: Color(0xFF7A3E0F),
  },
);
const int _colorAccentValue = 0xFFFFBA53;
const colorAccentDark = Color(0xFFDB953C);
const colorAccentLight = Color(0xFFFFF8EE);

// —————————————————————————————————————————————————————————————————————————————
// default / neutral
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorNeutral = MaterialColor(
  _colorNeutralValue,
  <int, Color>{
    50: Color(0xFFF6F7F9),
    100: Color(0xFFE5E7EA),
    150: Color(0xFFD8DCE0),
    200: Color(0xFFC7CBCF),
    250: Color(0xFFB4B8BC),
    300: Color(0xFF9EA9AD),
    400: Color(0xFF7F8790),
    500: Color(0xFF676E76),
    600: Color(0xFF596066),
    700: Color(0xFF454C52),
    800: Color(0xFF383F45),
    900: Color(0xFF000C17),
  },
);
const int _colorNeutralValue = 0xFF676E76;
const colorNeutralDark = Color(0xFF454C52);
const colorNeutralLight = Color(0xFFD8DCE0);
const colorNeutralSuperLight = Color(0xFFE5E7EA);

// —————————————————————————————————————————————————————————————————————————————
// disclaimer
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorDisclaimer = MaterialColor(
  _colorDisclaimerValue,
  <int, Color>{
    50: Color(0xFFFFF9F2),
    100: Color(0xFFFEF2E5),
    200: Color(0xFFFBC895),
    300: Color(0xFFF9B26F),
    400: Color(0xFFF7A259),
    500: Color(0xFFF69348),
    600: Color(0xFFF08845),
    700: Color(0xFFE87A41),
    800: Color(0xFFE06C3D),
    900: Color(0xFFD55536),
  },
);
const int _colorDisclaimerValue = 0xFFF69348;
const colorDisclaimerDark = Color(0xFFE06C3D);
const colorDisclaimerLight = Color(0xFFFFF9F2);

// —————————————————————————————————————————————————————————————————————————————
// info
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorInfo = MaterialColor(
  _colorInfoValue,
  <int, Color>{
    50: Color(0xFFE8F9FE),
    100: Color(0xFFD1F2FC),
    200: Color(0xFFA4E2FA),
    300: Color(0xFF74C7F1),
    400: Color(0xFF50AAE3),
    500: Color(0xFF1D81D1),
    600: Color(0xFF1564B3),
    700: Color(0xFF0E4B96),
    800: Color(0xFF093479),
    900: Color(0xFF052564),
  },
);
const int _colorInfoValue = 0xFF1D81D1;
const colorInfoDark = Color(0xFF093479);
const colorInfoLight = Color(0xFFE8F9FE);

// —————————————————————————————————————————————————————————————————————————————
// warning
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorWarning = MaterialColor(
  _colorWarningValue,
  <int, Color>{
    50: Color(0xFFFFFDF3),
    100: Color(0xFFFFFAE6),
    200: Color(0xFFFFF3CE),
    300: Color(0xFFFFEBB6),
    400: Color(0xFFFFE4A4),
    500: Color(0xFFFFD786),
    600: Color(0xFFDBAF61),
    700: Color(0xFFB78943),
    800: Color(0xFF93662A),
    900: Color(0xFF7A4D19),
  },
);
const int _colorWarningValue = 0xFFFFD786;
const colorWarningDark = Color(0xFF93662A);
const colorWarningLight = Color(0xFFFFFDF3);

// —————————————————————————————————————————————————————————————————————————————
// success
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorSuccess = MaterialColor(
  _colorSuccessValue,
  <int, Color>{
    50: Color(0xFFE9F5F2),
    100: Color(0xFFBDE1D9),
    200: Color(0xFF91CEC0),
    300: Color(0xFF64BAA6),
    400: Color(0xFF38A68D),
    500: Color(0xFF229C80),
    600: Color(0xFF1B7D66),
    700: Color(0xFF145E4D),
    800: Color(0xFF0E3E33),
    900: Color(0xFF071F1A),
  },
);
const int _colorSuccessValue = 0xFF229C80;
const colorSuccessDark = Color(0xFF0E3E33);
const colorSuccessLight = Color(0xFFE9F5F2);

// —————————————————————————————————————————————————————————————————————————————
// error
// —————————————————————————————————————————————————————————————————————————————
const MaterialColor colorError = MaterialColor(
  _colorErrorValue,
  <int, Color>{
    50: Color(0xFFFFF4F5),
    100: Color(0xFFFEEDEE),
    200: Color(0xFFFFC0BB),
    300: Color(0xFFF57E7B),
    400: Color(0xFFF7696F),
    500: Color(0xFFEB373E),
    600: Color(0xFFCA283C),
    700: Color(0xFFA91B3A),
    800: Color(0xFF881135),
    900: Color(0xFF700A32),
  },
);
const int _colorErrorValue = 0xFFEB373E;
const colorErrorDark = Color(0xFF881135);
const colorErrorLight = Color(0xFFFFF4F5);

// —————————————————————————————————————————————————————————————————————————————
// basic color !!
// —————————————————————————————————————————————————————————————————————————————
const colorWhite = Color(0xFFFFFFFF);
const colorBlack = Color.fromARGB(255, 0, 0, 0);
