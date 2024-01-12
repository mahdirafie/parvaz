
class CompanyDTO {
  String? companyName;
  String? shenaseMeli;
  String? shomareSabt;
  String? address;

  CompanyDTO(
      {this.companyName, this.shenaseMeli, this.shomareSabt, this.address});

  CompanyDTO.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    shenaseMeli = json['shenase_meli'];
    shomareSabt = json['shomare_sabt'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['shenase_meli'] = shenaseMeli;
    data['shomare_sabt'] = shomareSabt;
    data['address'] = address;
    return data;
  }
}