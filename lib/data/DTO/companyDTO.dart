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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name'] = this.companyName;
    data['shenase_meli'] = this.shenaseMeli;
    data['shomare_sabt'] = this.shomareSabt;
    data['address'] = this.address;
    return data;
  }
}