import 'package:app_do_clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: textInputDecoration,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  cityName = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      cityName,
                    );
                  },
                  child: const Text(
                    'Volte para a tela principal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 40.0),
              //   child: ElevatedButton(
              //     onPressed:

              //     child: const Text(
              //       'Volte para a tela principal',
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 15,
              //         horizontal: 40,
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       side: BorderSide.none,
              //       minimumSize: const Size(45, 70),
              //       primary: blue,
              //       onPrimary: Colors.white,
              //       textStyle: const TextStyle(
              //         fontSize: 17,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
