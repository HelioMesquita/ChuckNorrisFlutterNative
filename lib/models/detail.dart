
class Detail {
  String createdAt;
  String iconUrl;
  String id;
  String updatedAt;
  String url;
  String value;

  Detail(
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  );

  Detail.fromMap(Map map) {
    this.createdAt = map['created_at'];
    this.iconUrl = map['icon_url'];
    this.id = map['id'];
    this.updatedAt = map['updated_at'];
    this.url = map['url'];
    this.value = map['value'];
  }

}