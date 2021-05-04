class ModelMovieThumbnail {
  String name;
  String imgLink;
  String trailerLink;
  String description;
  int like;
  List<String> next;

  ModelMovieThumbnail(
      {this.name,
      this.imgLink,
      this.trailerLink,
      this.description,
      this.like,
      this.next});

  ModelMovieThumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgLink = json['imgLink'];
    trailerLink = json['trailerLink'];
    description = json['description'];
    like = json['like'];
    next = json['next'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imgLink'] = this.imgLink;
    data['trailerLink'] = this.trailerLink;
    data['description'] = this.description;
    data['like'] = this.like;
    data['next'] = this.next;
    return data;
  }
}
