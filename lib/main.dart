import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/AppCubit/app_cubit.dart';
import 'package:ksr_store_app/bloc/CartCubit/cart_cubit.dart';
import 'package:ksr_store_app/bloc/FavoritesCubit/favorites_cubit.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/res/themes/myTheme.dart';
import 'package:ksr_store_app/views/addProducts/addProducts.dart';
import 'package:ksr_store_app/views/home/widgets/productsInfo.dart';
import 'package:ksr_store_app/views/mainView.dart';

import 'bloc/HomeCubit/home_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AppCubit()..checkConnectivity(),
    child: const KsrStoreApp(),
  ));
}

class KsrStoreApp extends StatelessWidget {
  const KsrStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.getTheme(context.read<AppCubit>().isDark),
          routes: {
            '/': (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => HomeCubit()..loadData()),
                    BlocProvider(
                      create: (_) => FavoritesCubit(),
                    ),
                    BlocProvider(
                      create: (_) => CartCubit(),
                    ),
                  ],
                  child: const MainView(),
                ),
            kProductsInfoRoute: (context) => ProductInfo(),
            kaddProductsRoute: (context) => AddProductPage(),
          },
        );
      },
    );
  }
}
