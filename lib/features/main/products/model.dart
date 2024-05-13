class ProductsData {
  late final List<ProductModel> list;
  late final num userCartCount, maxPrice, minPrice;

  ProductsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? [])
        .map((e) => ProductModel.fromJson(e))
        .toList();
    userCartCount = json['user_cart_count'] ?? 0;
    maxPrice = json['max_price'] ?? 0;
    minPrice = json['min_price'] ?? 0;
  }
}

class ProductModel {
  late final int categoryId, id;
  late final String title, description, code;
  late final num priceBeforeDiscount, price, discount, amount;
  late final bool isActive, isFavorite;
  late final Unit unit;
  late final List<ProductImage> images;
  late final String mainImage;

  ProductModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    code = json['code'] ?? "";
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    price = json['price'] ?? 0;
    discount = (json['discount'] ?? 0)*100;
    amount = json['amount'] ?? 0;
    isActive = (json['is_active'] ?? 0) == 1;
    isFavorite = json['is_favorite'] ?? false;
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images'] ?? [])
        .map((e) => ProductImage.fromJson(e))
        .toList();
    mainImage = json['main_image'] ?? "";
  }
}

class Unit {
  late final int id;
  late final String name;
  late final String type;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    type = json['type'] ?? "";
  }
}

class ProductImage {
  late final String name;
  late final String url;

  ProductImage.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}
