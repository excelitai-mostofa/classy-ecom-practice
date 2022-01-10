import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practice_classy_ecom/models/all_products.dart';
import 'package:practice_classy_ecom/models/logIn_model.dart';

import '../http_api_end_points.dart';

class ApiRequest with ChangeNotifier{
  Future allProductApiReq() async{
    final response = await http.get(Uri.parse(
        'https://classyecommerce.excelitaiportfolio.com/api/products'
    ));
    if(response.statusCode == 200){
      final responseList = jsonDecode(response.body);
      showProducts products = showProducts.fromJson(responseList);
      return products.products;
    }else{
      throw Exception('Failed !!!');
    }
  }






  Future SignInApiRequest(Map<String,dynamic> param) async {
    final response = await http.post(Uri.parse(logInApi),body: param);
    // print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');


    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      LoginDataModel logindata=LoginDataModel.fromJson(data);
      //LogInDataModel list=LogInDataModel.fromJson(data);
      //List<LogInDataModel> products=data.map((data) => LogInDataModel.fromJson(data)).toList();
      return logindata.token.toString();//logindata.message;//data.map((e) => LogInDataModel.fromJson(e)).toList();
    }else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}