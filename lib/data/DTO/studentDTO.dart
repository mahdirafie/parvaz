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
    data['code_meli'] = codeMeli;
    data['nam'] = nam;
    data['nam_khanevadegi'] = namKhanevadegi;
    data['daneshgah'] = daneshgah;
    data['reshteh_tahsili'] = reshtehTahsili;
    data['mahal_zendegi'] = mahalZendegi;
    data['moadel'] = moadel;
    data['maghta'] = maghta;
    data['shomare_hamrah'] = shomareHamrah;
    data['sabeghe_kar'] = sabegheKar;
    data['tozihat_ezafe'] = tozihatEzafe;
    data['maharats'] = maharats;
    return data;
  }
}