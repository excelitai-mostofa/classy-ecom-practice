import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practice_classy_ecom/models/all_products.dart';

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
}