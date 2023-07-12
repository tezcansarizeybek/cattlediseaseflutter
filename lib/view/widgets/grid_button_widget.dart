import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridButtonWidget extends StatelessWidget {
  const GridButtonWidget({Key? key, required this.title, this.func})
      : super(key: key);
  final String title;
  final void Function()? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: func,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Get.isDarkMode
                ? Theme.of(context).primaryColorDark.withOpacity(0.5)
                : Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
