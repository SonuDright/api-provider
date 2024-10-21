import 'package:api_provider/provider_class/api_provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_api/home_page_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (Contax)=>RazorPayApiProvider(

    ),
    child: MaterialApp(
      home:HomeScreenApiRazorPay() ,
    ),);
  }
}

