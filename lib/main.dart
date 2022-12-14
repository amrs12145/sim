import 'package:flutter/material.dart';

import 'constants/theme.dart';
import 'presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: getMyThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}




// import 'package:breaking_bad_app/app_router.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(BreakingBadApp(appRouter: AppRouter(),));
// }

// class BreakingBadApp extends StatelessWidget {
//   const BreakingBadApp({super.key, required this.appRouter});
//   final AppRouter appRouter;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     debugShowCheckedModeBanner: false,
//       onGenerateRoute: appRouter.generateRoute,
//     );
//   }
// }


