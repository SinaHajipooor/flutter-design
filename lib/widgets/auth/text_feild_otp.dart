import 'package:flutter/material.dart';

Widget textFeildOtp({required BuildContext context, required bool first, required bool last}) {
  return Container(
    height: 85,
    child: AspectRatio(
      aspectRatio: 0.7,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) FocusScope.of(context).nextFocus();
          if (value.length == 0 && first == false) FocusScope.of(context).previousFocus();
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}
