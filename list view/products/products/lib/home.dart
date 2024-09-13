import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dio dio = Dio();
  List<Products> products = [];
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    getproduct();
    super.initState();
    scrollController.addListener(loadmore);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
        
      ),
      body: SizedBox(
        height:MediaQuery.sizeOf(context).height,
        child: ListView.builder(
          itemCount:products.length ,
          itemBuilder: (context, index) {
            final listproducts = products[index];
            return ListTile(
              leading: Text(
                listproducts.id.toString(),
              ),
              title: Text(
                listproducts.title.toString(),
              ),
              subtitle: Text(
                "\$${listproducts.price.toString()}",
              ),
              trailing: Image(image: NetworkImage(listproducts.thumbnail!),
              width: 150,),
            );
          },
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          controller:scrollController,
          

        ),
      ),
    );
  }
  void loadmore(){
      if (scrollController.position.pixels==scrollController.position.maxScrollExtent){
        getproduct();
      }
  }
  Future<void > getproduct()
async{
  try {
    final response = await dio.get('https://dummyjson.com/products?limit=10&skip=${products.length}&select=title,price');
    final List data = response.data["products"];
    final List<Products> newproducts = data.map((p)=> Products.fromJson(p)).toList();
    setState(() {
      products.addAll(newproducts);
    });

  } catch (e) {
    
  }
} }