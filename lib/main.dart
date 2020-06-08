import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy/CartPage.dart';
import 'package:proxy/Item.dart';
import 'package:proxy/Menu.dart';

import 'Cart.dart';

void main() => runApp(
    MultiProvider(

        providers: [
          ChangeNotifierProvider<Menu>(
            create: (_)=>Menu(),
          ),

          ProxyProvider<Menu,Cart>(
            update: (_,menu,cart)=>Cart(menu),
          )


        ],
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
        title: 'Material App',
        home: Scaffold(

          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: (){

                  var cart=Provider.of<Cart>(context,listen: false);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                  cart.add();
                  cart.itemsSelected.forEach((element) {
                    print("   ${element.name} and ${element.quantity}  \n ");
                  });

                  print("Total Calorie intake is ${cart.calculateCalorie()}");


                },

              )
            ],
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(

              child: ListView.builder(
                itemCount: Provider.of<Menu>(context,listen: false).items.length,
                itemBuilder: (context,index){

                  return buildListTile(context, Provider.of<Menu>(context,listen: false).items[index]);
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
      contentPadding: EdgeInsets.all(16),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: ()=>Provider.of<Menu>(context,listen: false).increment(item)
          ),
          /*Text("${Provider.of<Menu>(context,listen: true).getQuantity(item)}"),*/
          Consumer<Menu>(
            builder: (context, menu, child) => Text('${item.quantity}'),
          ),
          IconButton(
            icon: Icon(Icons.minimize),
            onPressed: ()=>Provider.of<Menu>(context,listen: false).decrement(item),
          )

        ],
      ),
      title: Text('${item.name}'),
    ),
  );

}

