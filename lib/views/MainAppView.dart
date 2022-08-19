import 'package:flutter/material.dart';
import 'package:new_app_v2/widgets/DefaultTextField.dart';

class MainAppView extends StatefulWidget {
  @override
  _MainAppViewState createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }
  final formKey = GlobalKey<FormState>();
  final TextEditingController gasGroupTextController = TextEditingController();
  final TextEditingController gasStationTextController =
      TextEditingController();
  final TextEditingController deviceNameTextController =
      TextEditingController();
  Widget getBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: Image.asset('assets/icons/user_women.png', color: Colors.pink,)),
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: (MediaQuery.of(context).size.height / 40)),
                    child: Column(
                      children: [
                        // DefaultTextField(
                        //   enabled: false,
                        //   controller: gasGroupTextController,
                        //   fieldName: 'Grupo gasolinero',
                        //   prefixIcon: ImageIcon(
                        //       AssetImage('assets/icons/gas_group_icon.png'),
                        //       color: Theme.of(context).primaryColor),
                        // ),
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.height / 25),
                        DefaultTextField(
                          enabled: false,
                          controller: gasStationTextController,
                          fieldName: 'Emprendimiento',
                          prefixIcon: Icon(Icons.add_business, color: Theme.of(context).primaryColor),
                          // prefixIcon: ImageIcon(
                          //     Icon(icon),
                          //     // AssetImage('assets/icons/gas_station_icon.png'),
                          //     color: Theme.of(context).primaryColor),

                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        DefaultTextField(
                          enabled: false,
                          controller: deviceNameTextController,
                          fieldName: 'Nombre del dispositivo',
                          prefixIcon: ImageIcon(
                              AssetImage('assets/icons/phone_icon.png'),
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}