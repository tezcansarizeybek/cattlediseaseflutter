import 'package:flutter/material.dart';

class MainNavbarWidget extends StatelessWidget {
  const MainNavbarWidget({Key? key, required this.profileFunc})
      : super(key: key);
  final void Function() profileFunc;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: AppBarTheme.of(context).toolbarHeight,
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: profileFunc,
                icon: const Icon(
                  Icons.person,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
