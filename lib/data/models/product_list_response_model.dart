class ProductListResponseModel {
  String? id;
  String? product;
  String? name;
  String? url;
  int? gwp;

  ProductListResponseModel(
      {this.id, this.product, this.name, this.url, this.gwp});

  ProductListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    name = json['name'];
    url = json['url'];
    gwp = json['gwp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['name'] = this.name;
    data['url'] = this.url;
    data['gwp'] = this.gwp;
    return data;
  }
}
