import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_app_v2/widgets/DefaultTextField.dart';


class PromoterView extends StatefulWidget {
  PromoterView({Key? key}) : super(key: key);

  @override
  _PromoterViewState createState() => _PromoterViewState();
}

class _PromoterViewState extends State<PromoterView> {
  double labelTextSize = 50;
  bool isChecked = false;
  final TextEditingController promoterTextCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Logic.cleanPromoterId();
  }

  // validatePromoter(String promoter) async {
  //   try {
  //     var consecutive = "";
  //     var branchid = "";
  //     var organizationid = "";

  //     await SharedPreferenceService.instance
  //         .getString(KeysApp.qrconsecutive)
  //         .then((value) => consecutive = value);

  //     await SharedPreferenceService.instance
  //         .getString(KeysApp.branchid)
  //         .then((value) => branchid = value);

  //     await SharedPreferenceService.instance
  //         .getString(KeysApp.organizationid)
  //         .then((value) => organizationid = value);

  //     if (consecutive.length == 0)
  //       SharedPreferenceService.instance.setString(KeysApp.qrconsecutive, "0");

  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       await Future.wait([
  //         ApiService.validatePromoter(
  //           promoter,
  //           branchid,
  //           organizationid,
  //         )
  //       ]).then((response) async {
  //         var responseservice = response.first;

  //         SharedPreferenceService.instance.setString(
  //             KeysApp.promoter, responseservice.promoterNumber.toString());

  //         SharedPreferenceService.instance.setString(
  //             KeysApp.userId, responseservice.id);


  //         SharedPreferenceService.instance
  //             .setString(KeysApp.sessionpromoter, isChecked ? "1" : "0");

  //         Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => PumpsView(),
  //             ),
  //             (route) => false);
  //       }).catchError((error) {
  //         String errorlist = error ??
  //             "Ocurrío un error al consultar la información de los servicios.";
  //         showMessageText(errorlist);
  //       });
  //     }
  //   } on SocketException catch (_) {
  //     showMessageText("Revisar su conexión a internet");
  //   } catch (ex) {
  //     showMessageText(
  //         "Ocurrió un error insesperado al solicitar los servicios del dispositivo");
  //   }
  // }

  void showMessageText(String text) {
    print(text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  Widget getCheckSession() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        bottom: 10.0,
        right: 10.0
      ),
      child: CheckboxListTile(
        title: Text("Mantener sesión"),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.blue,
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: MediaQuery.of(context).size.width / 2.5,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Container(
                        child: FittedBox(
                      child: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.pinkAccent,
                        // color: Theme.of(context).primaryColor,
                      ),
                    ))),
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        // left: 80.w,
                        // right: 80.w,
                        top: MediaQuery.of(context).size.height / 15),
                    child: Column(
                      children: [
                        DefaultTextField(
                          controller: promoterTextCtrl,
                          fieldName: 'Clave de acceso',
                          validator: (String? value) {
                            return value!.isEmpty
                                ? 'Introduzca su clave de acceso'
                                : null;
                          },
                          keyboardType: TextInputType.number,
                          prefixIcon: ImageIcon(
                            AssetImage('assets/icons/user_icon.png'),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getCheckSession(),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: TextStyle(fontSize: 20)),
                            // textStyle: TextStyle(fontSize: 55.sp)),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            try {
                              // validatePromoter(promoterTextCtrl.text);
                            } catch (ex) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(ex.toString())));
                            }
                          }
                        },
                        child: Text('Aceptar')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
