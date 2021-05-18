import 'package:catalog/core/store.dart';
import 'package:catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartmodel{
// static final cartmodel=Cartmodel._internal();
// Cartmodel._internal();
// factory Cartmodel()=>cartmodel;
  Catalogmodel _catalog;

  final List<int> _itemIds=[];
  Catalogmodel get catalog=>_catalog;
  set catalog(Catalogmodel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }

  //get items in the cart
  List<Item> get items=>_itemIds.map((id)=>_catalog.getbyid(id)).toList();

  //total price calculate
  num get totalprice =>items.fold(0,(total,current)=>total+current.price);

  //Add item
  
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }

  //remove 

  // void remove(Item item){
  //   _itemIds.remove(item.id);
  // }

}

//mutation

class Addmutation extends VxMutation<Mystore>{
  final Item item;

  Addmutation(this.item);

  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }

}

class Removemutation extends VxMutation<Mystore>{
  final Item item;

  Removemutation(this.item);

  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}