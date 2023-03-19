import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_web_site/core/maneger/cubit/app_cubit.dart';

import '../../../../core/share/color.dart';
import '../manager/model/menu_model.dart';

class JustCircularMenu extends StatelessWidget {
  const JustCircularMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Column(
          children: [
            ...List.generate(
              menuList.length,
              (index) {
                final MenuModel model = menuList[index];
                return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 500),
                      turns: state.menuCurrentIndex==index?1.0: 0.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 56,
                        width: 56,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: state.menuCurrentIndex == index
                              ? AppColor.lightPink
                              : AppColor.white,
                          shape: BoxShape.circle,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            cubit.menuCurrentIndexMethod(index: index);
                          },
                          child: Center(
                            child: SvgPicture.asset(
                              model.iconPath,
                              height: index == 1 ? 20 : 24,
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
                    ));
              },
            )
          ],
        );
      },
    );
  }
}
