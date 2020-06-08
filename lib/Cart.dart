import 'dart:wasm';

import 'Item.dart';
import 'Menu.dart';

class Cart{

 Menu menu;
 List<Item> itemsSelected=[];

 Cart(this.menu);

 void add(){

   itemsSelected=menu.returnItems();
  // menu.resetAll();
 }

 int calculateCalorie(){
   int sum=0;
   itemsSelected.forEach((element) {
     sum += element.quantity*element.calorie;
   });

   return sum;
 }

 void resetCart(){

   itemsSelected=null;

 }

}