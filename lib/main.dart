import 'package:flutter/material.dart';
import 'package:ar_test_project/routes/main_index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ARApp());
  // runApp(EasyLocalization(
  //   supportedLocales: const [Locale('en'), Locale('ko')],
  //   startLocale: Locale(language != null && language!.languageCode != null ? language!.languageCode! : 'en'),
  //   path: 'assets/lang',
  //   child: MultiBlocProvider(
  //     providers: BlocInitialize.providers,
  //     child: const ARApp(),
  //   ),
  // ));
}

class ARApp extends StatefulWidget {
  const ARApp({super.key});

  @override
  State<ARApp> createState() => _ARAppState();
}

class _ARAppState extends State<ARApp> {
  @override
  void initState() {
    // context.setLocale(Locale(language!.languageCode ?? 'en'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AR Project',
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        builder: EasyLoading.init(),
        theme: ThemeData(brightness: Brightness.light, fontFamily: APP_FONT_FAMILY),
        routes: Routes.routes,
        home: const HomeView());
  }
}
