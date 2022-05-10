// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
              popupItemDisabled: isItemDisabled,
              onChanged: itemSelectionChanged,
              //selectedItem: "",
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                cursorColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20,),
            DropdownSearch<String>.multiSelection(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
              popupItemDisabled: isItemDisabled,
              onChanged: print,
              selectedItems: ["Brazil"],
            ),
            SizedBox(height: 20,),
            DropdownSearch(
              mode: Mode.DIALOG,
              items: ["Brazil", "France", "Tunisia", "Canada"],
              dropdownSearchDecoration: InputDecoration(labelText: "Name"),
              onChanged: print,
              selectedItem: "Tunisia",
              validator: (String? item) {
                if (item == null) return "Required field";
                else if (item == "Brazil") return "Invalid item";
                else return null;
              },
            ),
            SizedBox(height: 20,),
            DropdownSearch(
              mode: Mode.BOTTOM_SHEET,
              items: ["Brazil", "France", "Tunisia", "Canada"],
              dropdownSearchDecoration: InputDecoration(labelText: "Name"),
              onChanged: print,
              selectedItem: "Tunisia",
              validator: (String? item) {
                if (item == null) return "Required field";
                else if (item == "Brazil") return "Invalid item";
                else return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isItemDisabled(String s) {
    //return s.startsWith('I');

    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }

  void itemSelectionChanged(String? s) {
    print(s);
  }

}

