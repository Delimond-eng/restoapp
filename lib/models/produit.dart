class Produit {
  String productCode;
  String productTitle;
  String productCategory;
  String productImage;
  double productPrice;
  int productQty = 1;
  bool isSelected = false;

  double get total => productPrice * productQty;

  Produit({
    this.productCode,
    this.productTitle,
    this.productImage,
    this.productCategory,
    this.productPrice,
  });
}
