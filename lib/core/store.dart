import 'package:catalog/models/cartmodel.dart';
import 'package:catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore{
  Catalogmodel catalog;
  Cartmodel cart;
  Mystore(){
    catalog=Catalogmodel();
    cart=Cartmodel();
    cart.catalog=catalog;
  }
}