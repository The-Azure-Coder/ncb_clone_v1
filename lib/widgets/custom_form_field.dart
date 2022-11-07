import 'package:flutter/material.dart';

class CustomFormField extends TextFormField {
  final String Function(String)? OnChangedFunc;
  final String fieldVar;
  final TextEditingController fieldCtrl;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validatorFunc;

  CustomFormField(
      {required String this.fieldVar,
        required TextEditingController this.fieldCtrl,
        String? this.labelText,
        String? this.hintText,
        String Function(String)? this.OnChangedFunc,
        String? Function(String?)? this.validatorFunc});


  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: OnChangedFunc,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        controller: fieldCtrl,
        validator: validatorFunc);
  }
}


