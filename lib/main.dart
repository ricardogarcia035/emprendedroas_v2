import 'package:flutter/material.dart';
import 'package:new_app_v2/views/PromoterView.dart';
import 'package:new_app_v2/views/RegisterDeviceView.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/MainAppView.dart';
// import 'package:flutter_flavor/flutter_flavor.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:orquestador/views/MainAppView.dart';

void main() {
  // FlavorConfig(
  //   name: "DEV",
  //   color: Colors.red,
  //   location: BannerLocation.bottomStart,
  //   variables: {
  //     "apkVersionUrl": "https://switmobile.s3.us-east-2.amazonaws.com/version_dev",
  //     "apkUpdateUrl": "https://switmobile.s3.us-east-2.amazonaws.com/Swit_Dev.apk",
  //     "urlApiBase":
  //         "https://3fztqp8vx3.execute-api.us-east-2.amazonaws.com/Development",
  //     "urlApiPABase":
  //         "http://toh-env.eba-aipc2dth.us-east-2.elasticbeanstalk.com/",
  //     "apiKey": "5EpK31AnnT8NwBdoHN6Ll613IC2xbtyV6ptniBTg",
  //     "externalQR":
  //         "http://toh-env.eba-aipc2dth.us-east-2.elasticbeanstalk.com",
  //     "urlApiBase_Dummi": "https://mocki.io/v1/",
  //   },
  // );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color primaryColor = Color(0XFF1A1956);
  Color accentColor = Color(0XFFFF9F68);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        // supportedLocales: [const Locale('es')],
        // debugShowCheckedModeBanner: false,
        // theme: new ThemeData(
        //     backgroundColor: Color(0XFFF1F1F1),
        //     scaffoldBackgroundColor: Color(0XFFFFFFFF),
        //     brightness: Brightness.light,
        //     primaryColor: primaryColor,
        //     accentColor: accentColor,
        //     primaryColorDark: Color(0XFF1C1C1C),
        //     dialogTheme: DialogTheme(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(25),
        //           side: BorderSide(
        //               color: primaryColor, width: 5)),
        //     ),
        //     fontFamily: 'Roboto'),
        // title: 'SWIT DEV',
         home: MainAppView(),
        // home: RegisterDeviceView(),
        // home: PromoterView(),
      
    );
  }
}
