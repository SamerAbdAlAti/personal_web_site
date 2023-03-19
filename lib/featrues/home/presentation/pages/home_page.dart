import 'package:flutter/material.dart';
import 'package:personal_web_site/core/share/color.dart';
import 'package:personal_web_site/res.dart';

import '../widgets/00_menu_list.dart';
import '../widgets/01_just_circular_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    print(widthSize);
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: widthSize >= 1300 ? 300 : 80,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Column(

                    children: [
                      const SizedBox(width: 80,),
                      Image.asset(
                        Res.profile_image,
                        height: widthSize >= 1300 ? 128 : 40,
                      ),
                      if (widthSize > 1300)
                        const MenuList()
                      else
                        const JustCircularMenu(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40).copyWith(left: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
