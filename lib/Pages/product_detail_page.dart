import 'package:flutter/material.dart';
import 'products_page.dart';

class ProductDetailPage extends StatelessWidget {
  final item;

  ProductDetailPage({this.item});

  @override
  Widget build(BuildContext context) {
    final String pictureUrl = 'http://192.168.1.13:1337${item.picture['url']}';
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Container(
        decoration: gradientBackground,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Hero(
                tag: item,
                child: Image.network(
                  pictureUrl,
                  width: orientation==Orientation.portrait?600:250,
                  height: orientation==Orientation.portrait? 400:200 ,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(item.name,style: Theme.of(context).textTheme.title,),
            Text('\$${item.price}',style:Theme.of(context).textTheme.title,),
            Flexible(child: SingleChildScrollView(child: Padding(child: Text(item.description),padding: EdgeInsets.only(left: 32,bottom: 32),))),
          ],
        ),
      ),
    );
  }
}
