import 'package:device_preview/device_preview.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/s_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SHome(),
    );
  }
}


// enum ScreenSize {
//   small(300),
//   normal(400),
//   large(600),
//   extraLarge(1200);

//   final double size;

//   const ScreenSize(this.size);
// }

// ScreenSize getScreenSize(BuildContext context) {
//   double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
//   if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
//   if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
//   if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
//   return ScreenSize.small;
// }