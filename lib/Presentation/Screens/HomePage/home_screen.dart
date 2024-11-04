import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../BussinessLogic/ApiBloc/api_bloc.dart';
import '../../../BussinessLogic/ApiBloc/api_event.dart';
import '../../../BussinessLogic/ApiBloc/api_state.dart';
import '../../../Data/Repositories/data_repository.dart';
import 'Widget/categories_widget.dart';
import 'Widget/header.dart';
import 'Widget/item_grid.dart';


class HomeScreen extends StatefulWidget {
  final Function(int) onNavigate; 

  const HomeScreen({super.key, required this.onNavigate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiBloc _apiBloc;
  String name = 'Samuel'; // Default name for test
  Future<String> _getNameFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? '';
  }

  @override
  void initState() {
    super.initState();
    _apiBloc = ApiBloc(DataRepository());
    _apiBloc.add(FetchItems('Milk'));
    _getNameFromSharedPreferences().then((user) {
      setState(() {
       // name = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(name: name, onNavigate: widget.onNavigate), 
            const SizedBox(height: 10),
            const Text(
              'What would you like to buy today?',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            ButtonList(apiBloc: _apiBloc), 
            BlocBuilder<ApiBloc, ApiState>(
              bloc: _apiBloc,
              builder: (context, state) {
                return ItemGrid(state: state, height: height); 
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _apiBloc.close();
    super.dispose();
  }
}
