import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'Item.dart';

class Menu extends ChangeNotifier{

  List<Item> items=[

    Item(1,"Burger",20),
    Item(2,"Chowmin",30),
    Item(3,"Pasta",25),
    Item(4,"Noodles",40),
    Item(5,"Dosa",10),
    Item(6,"Diet Coke",3)

  ];

  void increment(Item item){
    item.quantity++;
    notifyListeners();
  }
  void decrement(Item item){
      if(item.quantity>0){
        item.quantity--;
      }
      notifyListeners();
  }

  List<Item> returnItems(){

    return items;

  }

  void resetAll(){
    items.forEach((element) {element.quantity=0;});
    notifyListeners();
  }

  int getQuantity(Item item){
    return item.quantity;
  }
}