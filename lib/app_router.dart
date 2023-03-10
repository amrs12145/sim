import 'package:flutter/material.dart';

class AppRouter {
  static goTo(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}





// import 'package:breaking_bad_app/business_logic/characters_cubit.dart';
// import 'package:breaking_bad_app/constants/strings.dart';
// import 'package:breaking_bad_app/data/api/characters_api.dart';
// import 'package:breaking_bad_app/data/repository/char_repository.dart';
// import 'package:breaking_bad_app/presentation/screens/characters.dart';
// import 'package:breaking_bad_app/presentation/screens/characters_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   late CharactersRepository charactersRepository;
//   late CharactersCubit charactersCubit;

//   AppRouter() {
//     charactersRepository = CharactersRepository(CharApi());
//     charactersCubit = CharactersCubit(charactersRepository);
//   }

//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case charactersScreen:
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider(
//                 create: (BuildContext context) => charactersCubit,
//               child: CharactersScreen(),
//             )
//         );
//       case charactersDetailsScreen:
//         return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
//     }
//   }
// }




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


