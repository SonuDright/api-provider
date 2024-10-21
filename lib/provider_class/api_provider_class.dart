import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/user_provider_model.dart';
import 'package:http/http.dart'as http;

class RazorPayApiProvider with ChangeNotifier{
  String apiKey = 'rzp_test_eIZIvMykcGVVVA';
  String apiSecret = 'sOdqgeGL3FnhJRlmcVX0M3Jr';

  Future<OrderMode?> getData()async{
    var url = Uri.parse("https://api.razorpay.com/v1/orders");
    var responce = await http.get( url, headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},

    );
    if(responce.statusCode==200){
      var used = jsonDecode(responce.body);
      var user = OrderMode.fromJson(used);
      return user;
      notifyListeners();

    }
    else{
      return OrderMode();

    }


  }

}



