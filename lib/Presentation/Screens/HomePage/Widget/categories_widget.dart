import 'package:flutter/material.dart';
import '../../../../BussinessLogic/ApiBloc/api_bloc.dart';
import '../../../../BussinessLogic/ApiBloc/api_event.dart';


class ButtonList extends StatefulWidget {
  final ApiBloc apiBloc;

  const ButtonList({super.key, required this.apiBloc});

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final buttonLabels = ['Milk', 'Drinks', 'Vegetables', 'Others'];

    return SizedBox(
      height: height * 0.075,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonLabels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: width * 0.35,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedButtonIndex = index; 
                  });
                  widget.apiBloc.add(FetchItems(buttonLabels[index])); 
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: _selectedButtonIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      buttonLabels[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
