import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:kipling/Loader/color_loader_3.dart';

showLoader() {
  BotToast.showAttachedWidget(
      attachedBuilder: (_) => Center(
            child: ColorLoader3(
              radius: 40,
              dotRadius: 12,
            ) /*Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.black45,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/default_loader.gif')),
        )*/
            ,
          ),
      // duration: Duration(seconds: 3),
      target: Offset(520, 520));
}

hideLoader() {
  BotToast.closeAllLoading();
  BotToast.cleanAll();
}
