import 'package:flutter/material.dart';
import 'package:new_app_v2/services/DeviceInfoService.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:orquestador/config/KeysApp.dart';
// import 'package:orquestador/models/RequestToken.dart';
// import 'package:orquestador/models/ResponseToken.dart';
// import 'package:orquestador/services/DeviceInfoService.dart';
// import 'package:orquestador/services/ApiService.dart';
// import 'package:orquestador/utils/Logic.dart';
// import 'package:orquestador/views/MainAppView.dart';
// import 'package:orquestador/widgets/DefaultTextField.dart';
// import 'package:orquestador/services/SharedPreferenceService.dart';
import 'dart:io';

import 'package:new_app_v2/views/MainAppView.dart';
import 'package:new_app_v2/widgets/DefaultTextField.dart';

class RegisterDeviceView extends StatefulWidget {
  @override
  _RegisterDeviceViewState createState() => _RegisterDeviceViewState();
}

class _RegisterDeviceViewState extends State<RegisterDeviceView> {
  // Logic logic = Logic();

  double labelTextSize = 50;
  double opacityloading = 0.0;

  Map<String, dynamic> _deviceData = <String, dynamic>{};

  void validateToken(String device, String tokenapp) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          opacityloading = 1.0;
        });

        // var requestData =
        //     RequestToken(device, _deviceData['androidId'], tokenapp);

        // ApiService.getTokenService(requestData).then((response) {
        //   saveDataPreference(response, tokenapp, device).then((value) {});

        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => MainAppView(),
        //       ),
        //       (route) => false);
        // }
        // ).catchError((error) {
        //   String strError = error ?? "Ocurrío un error al validar el token.";
        //   showMessageText(strError);
        // });
      }
    } on SocketException catch (_) {
      showMessageText("Revisar su conexión a internet");
    } catch (ex) {
      showMessageText("Ocurrió un error insesperado al validar el token");
    }
  }

  void showMessageText(String text) {
    print(text);
    setState(() {
      opacityloading = 0.0;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    });
  }

  Widget getLoadingWidget() {
    return Opacity(
      opacity: opacityloading,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              "Validando",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> saveDataPreference(
  //     ResponseToken responseToken, String tokenapp, String devicename) async {
  //   SharedPreferenceService.instance.setString(KeysApp.devicename, devicename);
  //   SharedPreferenceService.instance
  //       .setString(KeysApp.clientdeviceid, responseToken.clientDeviceId);
  //   SharedPreferenceService.instance
  //       .setString(KeysApp.branchid, responseToken.branchId);
  //   SharedPreferenceService.instance
  //       .setString(KeysApp.branchname, responseToken.branchName);
  //   SharedPreferenceService.instance
  //       .setString(KeysApp.organizationid, responseToken.organizationId);
  //   SharedPreferenceService.instance
  //       .setString(KeysApp.organizationname, responseToken.organizacionName);
  //   SharedPreferenceService.instance.setString(KeysApp.token, tokenapp);
  // }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController deviceNameTextController =
      TextEditingController();
  final TextEditingController tokenTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //tokenTextController.text = 'ehikhydsq3NZ4taj9hhx61g4lbAmyhlVUwA2';
    DeviceInfoService.initPlatformState().then((data) {
      _deviceData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 14),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.width / 2.5,
                      child: Image.asset('assets/icons/user_women.png', color: Colors.pinkAccent,)),
                ),
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: (MediaQuery.of(context).size.height / 24)),
                    child: Column(
                      children: [
                        DefaultTextField(
                          controller: deviceNameTextController,
                          fieldName: 'Nombre del dispositivo',
                          validator: (String? value) {
                            return value!.isEmpty
                                ? 'Introduzca el nombre del dispositivo'
                                : null;
                          },
                          prefixIcon: ImageIcon(
                            AssetImage('assets/icons/phone_icon.png'),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 35),
                        DefaultTextField(
                            controller: tokenTextController,
                            fieldName: 'Token',
                            validator: (String? value) {
                              return value!.isEmpty
                                  ? 'Introduzca su token'
                                  : null;
                            },
                            prefixIcon: ImageIcon(
                              AssetImage('assets/icons/token_icon.png'),
                              color: Theme.of(context).primaryColor,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  // tokenTextController.text =
                                  //     await logic.scanBarcode();
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.qr_code_scanner_rounded,
                                  color: Theme.of(context).primaryColor,
                                ))),
                      ],
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: TextStyle(fontSize: 20)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        try {
                          validateToken(deviceNameTextController.text,
                              tokenTextController.text);
                        } catch (ex) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(ex.toString())));
                        }
                      }
                    },
                    child: Text('Validar')),
              ),
              getLoadingWidget()
            ],
          ),
        ),
      ),
    );
  }
}
