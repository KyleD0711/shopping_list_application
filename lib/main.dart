import 'package:flutter/material.dart';
import 'package:shopping_list_application/pages/opening_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List Application',
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
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
            seedColor: const Color.fromRGBO(74, 203, 203, 1.0),
            primary: const Color.fromRGBO(74, 203, 203, 1.0),
            background: const Color.fromRGBO(245, 224, 183, 1.0),
            secondary: const Color.fromRGBO(207,92,54, 1.0),
            tertiary: const Color.fromRGBO(89,52,79, 1.0), 
            surface: const Color.fromRGBO(74, 203, 203, 1.0)),
        useMaterial3: true,
      ),
      home: const OpeningPage(),
    );
  }
}
