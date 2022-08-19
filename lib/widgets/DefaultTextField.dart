import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_v2/widgets/DefaultInputDecorator.dart';

//Wrap an instance of this widget with another Flexible if more than one TextField is needed inside the same row.
class DefaultTextField extends StatefulWidget {
  final String fieldName;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onChanged;
  final void Function()? onTap;
  final TextInputType keyboardType;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final int maxLines;
  // Set to true to enable an instance of this widget to react to controller changes made indirectly from instances of this widget on the same parent.
  final bool listenToChanges;
  const DefaultTextField(
      {Key? key,
      required this.controller,
      this.validator,
      required this.fieldName,
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.onTap,
      this.textInputFormatter,
      this.maxLines = 1,
      this.listenToChanges = false})
      : super(key: key);
  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  final double labelTextSize = 50;
  double topLabelPadding = 20;
  bool updatedChild = false;
  late final void Function()? onChanged;

  void prepareField() {
    onChanged = widget.onChanged;
    if (widget.prefixIcon != null) {
      topLabelPadding = 50;
    }
  }

  @override
  void initState() {
    super.initState();
    prepareField();
    if (widget.listenToChanges) {
      widget.controller.addListener(() {
        if (widget.controller.text.isEmpty && updatedChild) {
          setState(() {
            updatedChild = !updatedChild;
          });
          print('Changed updatedChild State to false');
        }

        if (widget.controller.text.isNotEmpty && !updatedChild) {
          updatedChild = !updatedChild;
          setState(() {
            print('Updated State with Listener');
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: topLabelPadding, bottom: 2),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (widget.controller.text != '') ? widget.fieldName : '',
                    style: TextStyle(
                        color: Color(0XFF777499),
                        //fontSize: (labelTextSize - 6).sp),
                        fontSize: (8)),
                  )),
            ),
            Container(
              width: double.infinity,
              child: TextFormField(
                enabled: widget.enabled,
                readOnly: widget.readOnly,
                keyboardType: widget.keyboardType,
                onChanged: (String val) {
                  if (val.length <= 1) setState(() {});
                  if (onChanged != null) {
                    onChanged!();
                  }
                },
                onTap: widget.onTap,
                maxLines: widget.maxLines,
                validator: widget.validator,
                inputFormatters: widget.textInputFormatter,
                style: TextStyle(
                    //color: Color(0XFF777499), fontSize: labelTextSize.sp),
                    color: Color(0XFF777499), fontSize: 10),
                controller: widget.controller,
                decoration: buildDefaultInputDecoration(
                    widget.fieldName, context,
                    suffixIcon: widget.suffixIcon,
                    prefixIcon: widget.prefixIcon),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
