import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tread256/features/auth/controler/login_screen_controller.dart';
import 'package:tread256/routes/app_routes.dart';
import 'core/bindings/controller_binder.dart';
import 'core/utils/theme/theme.dart';
import 'core/common/widgets/shimmer_loading.dart';

class Tread256 extends StatelessWidget {
  const Tread256({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return FutureBuilder<String>(
          future: LoginController.getInitialRoute(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShimmerCircle(size: 60),
                        SizedBox(height: 20),
                        ShimmerText(height: 20, width: 200),
                      ],
                    ),
                  ),
                ),
              );
            }
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: snapshot.data ?? AppRoute.getLoginScreen(),
              getPages: AppRoute.routes,
              initialBinding: ControllerBinder(),
              themeMode: ThemeMode.system,
              theme: AppTheme.getLightTheme(context),
              darkTheme: AppTheme.getDarkTheme(context),
              builder: EasyLoading.init(),
            );
          },
        );
      },
    );
  }
}
