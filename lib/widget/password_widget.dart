import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordInputWidget extends StatefulWidget {
  final TextEditingController passCont;
  const PasswordInputWidget({Key? key, required this.passCont})
      : super(key: key);

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _pass = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
      child: TextField(
        controller: widget.passCont,
        obscureText: _pass,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _pass = !_pass;
                  });
                },
                child: _pass == true
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined)),
            hintText: 'Enter Your Password',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )),
      ),
    );
  }
}
