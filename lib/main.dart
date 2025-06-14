import 'package:conference_app/firebase_options.dart';
import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/schedule_provider.dart';
import 'package:conference_app/models/theme_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/theme.dart';
import 'package:conference_app/views/app/app.dart';
import 'package:conference_app/views/login/login.dart';
import 'package:conference_app/views/login/verify_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  await setupApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ScheduleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context, listen: false).getAuthState();
    Provider.of<ThemeProvider>(context, listen: false).getColorTheme();

    return Consumer<ThemeProvider>(
      builder:
          (context, theme, child) => MaterialApp(
            themeMode: theme.lightTheme ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
            darkTheme: ThemeData(colorScheme: MaterialTheme.darkScheme()),
            debugShowCheckedModeBanner: false,
            home: child,
          ),
      child: Consumer<LoginProvider>(
        builder: (context, auth, child) {
          return !auth.loggedIn
              ? LoginView()
              : auth.isVerified != true
              ? VerifyAccountView()
              : App();
        },
      ),
    );
  }
}
