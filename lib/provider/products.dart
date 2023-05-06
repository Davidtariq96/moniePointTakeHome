// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../model/productsModel.dart';

class Products extends ChangeNotifier{

  ProductsModel? _allProducts;

   get allProducts => _allProducts;

    setProducts(ProductsModel singleProduct){
     _allProducts = singleProduct;
     notifyListeners();
     return _allProducts;
   }

}