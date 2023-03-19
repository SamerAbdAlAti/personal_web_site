import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_web_site/core/maneger/cubit/app_cubit.dart';
import 'package:personal_web_site/res.dart';

import '../../../../core/share/color.dart';
import '../manager/model/menu_model.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (c, p) => c.menuCurrentIndex != p.menuCurrentIndex,
      builder: (context, state) {
        AppCubit cubit=AppCubit.get(context);
        final widthSize = MediaQuery.of(context).size.width;

        return Column(
          children: [
            ...List.generate(menuList.length, (index) {
              final MenuModel model=menuList[index];
              return Padding(
                padding: const EdgeInsets.all(20).copyWith(
                  top: index == 0 ? 40 : 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          cubit.menuCurrentIndexMethod(index: index);
                        },
                        padding: EdgeInsets.zero,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: widthSize>1300?56:40,
                              child: Stack(
                                children: [
                                  AnimatedContainer(
                                    width: state.menuCurrentIndex == index
                                        ? 200
                                        : 40,
                                    height: 40,
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffc5ff),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        model.text,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          color: Color(0xff212121),
                                          fontWeight: FontWeight.w600,
                                          height: 1.125,
                                        ),
                                        textHeightBehavior: const TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*الدائرة */
                            SizedBox(
                              height: 40,
                              width: 200,
                              child: Row(
                                children: [

                                  AnimatedRotation(
                                    turns: state.menuCurrentIndex==index?1.0: 0.0,

                                    duration: const Duration(milliseconds: 600),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: state.menuCurrentIndex == index
                                            ? AppColor.lightPink
                                            : AppColor.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          model.iconPath,
                                          height: index==1?16:20,

                                          colorFilter: ColorFilter.mode(
                                            state.menuCurrentIndex == index
                                                ? AppColor.white
                                                : AppColor.blackColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /* ال container اليمين */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
