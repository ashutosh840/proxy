import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';
import 'Item.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(

            child: ListView.builder(
                itemCount: Provider.of<Cart>(context,listen: false).itemsSelected.length ,
                itemBuilder:(context,index){
                  return  buildListTile(context,Provider.of<Cart>(context,listen: false).itemsSelected[index] );

                },
            )
          ),
        ),
      ),
    );
  }
}

Widget buildListTile(BuildContext context,Item item){

  return Card(

    child: ListTile(
      title: Text(item.name),
      subtitle: Text('${item.quantity}'),
    ),

  );

}
