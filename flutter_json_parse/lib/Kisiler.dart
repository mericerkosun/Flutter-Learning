class Kisiler {
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  Kisiler(this.kisi_id, this.kisi_ad, this.kisi_tel);

  factory Kisiler.fromJson(Map<String,dynamic> json){
    return Kisiler(json["kisi_id"] as String, json["kisi_ad"] as String, json["kisi_tel"] as String);
  }
}