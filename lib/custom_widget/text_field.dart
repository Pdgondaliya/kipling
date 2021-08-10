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
    ValueChanged<String>? onChanged,
    bool? isPassword,
    TextInputType? keyboard}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        height: displayHeight(context) * 0.051,
        child: TextFormField(
            style: TextStyle(
                color: Color(0xff010001), fontFamily: 'Kipling_Regular'),
            keyboardType: keyboard,
            controller: controller,
            obscureText: isPassword == true ? true : false,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: hint,
                hintStyle: const TextStyle(
                    fontSize: 17,
                    color: Color(0xff9f9e9f),
                    fontFamily: 'Kipling_Regular'),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1.0),
                ),
                enabled: enable == true ? true : false,
                suffixIcon: suffix != true ? null : suffixIcon,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1.0),
                ))),
      ));
}
