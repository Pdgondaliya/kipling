import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';

Widget buildtextfields(
    {required String hint,
    required TextEditingController controller,
    required BuildContext context,
    bool? suffix,
    bool enable = true,
    FormFieldValidator<String>? validator,
    Icon? suffixIcon,
    double? width,
    Function()? onTap,
    bool? isPassword,
    TextInputType? keyboard}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // height: displayHeight(context) * 0.07,
      width: width == null ? double.infinity : width,
      child: TextFormField(
          style: TextStyle(color: Color(0xff010001)),
          keyboardType: keyboard,
          controller: controller,
          obscureText: isPassword == true ? true : false,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  const TextStyle(fontSize: 17, color: Color(0xff9f9e9f)),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1.0),
              ),
              enabled: enable == true ? true : false,
              suffixIcon: suffix != true ? null : suffixIcon,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1.0),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1.0),
              ))),
    ),
  );
}
