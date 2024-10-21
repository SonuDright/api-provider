import 'package:api_provider/provider_class/api_provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenApiRazorPay extends StatefulWidget {
  const HomeScreenApiRazorPay({super.key});

  @override
  State<HomeScreenApiRazorPay> createState() => _HomeScreenApiRazorPayState();
}

class _HomeScreenApiRazorPayState extends State<HomeScreenApiRazorPay> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<RazorPayApiProvider>(context);
    return Scaffold(
      body:  FutureBuilder(future: user.getData(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var item = snapshot.data?.items;
          var v = snapshot.data;
          return ListView.builder(
            itemCount: item?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("${v?.entity}"),
                  Text("${v?.count}"),
                  Text("${item?[index].id}"),
                  Text("${item?[index].entity}"),
                  Text("${item?[index].amount}"),
                  Text("${item?[index].amountPaid}"),
                  Text("${item?[index].amountDue}"),
                  Text("${item?[index].currency}"),
                  Text("${item?[index].receipt}"),
                  Text("${item?[index].offerId}"),
                  Text("${item?[index].status}"),
                  Text("${item?[index].attempts}"),
                  Text("${item?[index].notes}"),


                ],
              );

            },);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },),



    );
  }
}
