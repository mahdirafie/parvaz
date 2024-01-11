class StudentDTO {
  String? codeMeli;
  String? nam;
  String? namKhanevadegi;
  String? daneshgah;
  String? reshtehTahsili;
  String? mahalZendegi;
  int? moadel;
  String? maghta;
  String? shomareHamrah;
  String? sabegheKar;
  String? tozihatEzafe;
  List<String>? maharats;

  StudentDTO(
      {this.codeMeli,
        this.nam,
        this.namKhanevadegi,
        this.daneshgah,
        this.reshtehTahsili,
        this.mahalZendegi,
        this.moadel,
        this.maghta,
        this.shomareHamrah,
        this.sabegheKar,
        this.tozihatEzafe,
        this.maharats});

  StudentDTO.fromJson(Map<String, dynamic> json) {
    codeMeli = json['code_meli'];
    nam = json['nam'];
    namKhanevadegi = json['nam_khanevadegi'];
    daneshgah = json['daneshgah'];
    reshtehTahsili = json['reshteh_tahsili'];
    mahalZendegi = json['mahal_zendegi'];
    moadel = json['moadel'];
    maghta = json['maghta'];
    shomareHamrah = json['shomare_hamrah'];
    sabegheKar = json['sabeghe_kar'];
    tozihatEzafe = json['tozihat_ezafe'];
    maharats = json['maharats'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code_meli'] = this.codeMeli;
    data['nam'] = this.nam;
    data['nam_khanevadegi'] = this.namKhanevadegi;
    data['daneshgah'] = this.daneshgah;
    data['reshteh_tahsili'] = this.reshtehTahsili;
    data['mahal_zendegi'] = this.mahalZendegi;
    data['moadel'] = this.moadel;
    data['maghta'] = this.maghta;
    data['shomare_hamrah'] = this.shomareHamrah;
    data['sabeghe_kar'] = this.sabegheKar;
    data['tozihat_ezafe'] = this.tozihatEzafe;
    data['maharats'] = this.maharats;
    return data;
  }
}