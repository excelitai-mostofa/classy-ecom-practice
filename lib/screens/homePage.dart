import 'package:flutter/material.dart';
import 'package:practice_classy_ecom/models/all_products.dart';
import 'package:practice_classy_ecom/services/productApiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final apiService = ApiRequest();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),


      body: FutureBuilder(
        future: apiService.allProductApiReq(),
          builder: (context, data) {
          if(data.hasError){
            print(data.error.toString());
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items = data.data as List<Products>;
            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(
                              image: NetworkImage(
                                  'https://classyecommerce.excelitaiportfolio.com/'+items[index].productThambnail.toString()
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].productName.toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child: Text(items[index].id.toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].brandId.toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].categoryId.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].subcategoryId.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].subsubcategoryId.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productCode.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productQty.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productTags.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productSize.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].sellingPrice.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].discountPrice.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productShortDescp.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productLongDescp.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].hotDeals.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].featured.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].specialOffer.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].specialDeals.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].status.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].productViews.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].vedio.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].createdAt.toString(),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].updatedAt.toString(),),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          }
      ),
    );
  }
}
