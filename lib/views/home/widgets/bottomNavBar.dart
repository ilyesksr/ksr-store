import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/res/colors.dart';
import 'package:ksr_store_app/res/constant.dart';

import '../../../bloc/AppCubit/app_cubit.dart';

class MyButtomNavigationBar extends StatelessWidget {
  const MyButtomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: cPrimaryColor,
            iconTheme:
                MaterialStatePropertyAll(IconThemeData(size: kLargeIcon)),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorShape: ContinuousRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(kBorderRadius)))),
        child: NavigationBar(
          destinations: [
            myNavigationDestination(Icons.home_outlined, 'home', Icons.home),
            myNavigationDestination(
                Icons.favorite_outline, 'favorite', Icons.favorite),
            myNavigationDestination(
                Icons.shopping_cart_outlined, 'cart', Icons.shopping_cart),
            myNavigationDestination(
                Icons.person_outline, 'person', Icons.person),
          ],
          selectedIndex: context.read<AppCubit>().pageIndex,
          onDestinationSelected: (value) {
            context.read<AppCubit>().changeBottomBarIndex(value);
          },
        ),
      );
    });
  }
}

NavigationDestination myNavigationDestination(
    IconData icon, String lable, IconData enableIcon) {
  return NavigationDestination(
      icon: Icon(
        icon,
        color: cShadeBlue,
      ),
      label: lable,
      selectedIcon: Icon(
        enableIcon,
        color: Colors.white,
      ));
}
