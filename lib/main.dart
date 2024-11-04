import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../Data/Helpers/cart_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BussinessLogic/ApiBloc/api_bloc.dart';
import 'BussinessLogic/AuthBloc/auth_bloc.dart';
import 'Constants/routes.dart';
import 'Constants/theme.dart';
import 'Data/Repositories/auth_repository.dart';
import 'Data/Repositories/data_repository.dart';
import 'Presentation/Screens/Registration/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase in quick way
  //Todo: will initilize it in secure way
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          appId: '1:26595385082:android:7cbdc42d0c472fbb117343',
          messagingSenderId: '26595385082',
          projectId: 'horeca-7e68d', apiKey: 'AIzaSyCJBnMW7UBzsGER4RvMZJ5WIez-O4hr3fE')
  );
  //Todo: handle it with token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');
  runApp( MyApp(name: name,));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String? name;
   MyApp({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepository())),
        BlocProvider(create: (context) => ApiBloc(DataRepository())),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          title: 'Horeca Smart ',
          theme:AppTheme.theme,
          debugShowCheckedModeBanner: false,
          home: const Login(),
        routes: AppRoutes.routes,
        ),
      ),
    );
  }
}

