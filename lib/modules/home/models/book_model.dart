class BookModel {
  String? cover;
  String? pdf;
  String? name;
  String? category;
  String? authorName;
  String? voice;

  BookModel(
      {this.cover,
        this.pdf,
        this.name,
        this.category,
        this.authorName,
        this.voice});

  BookModel.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    pdf = json['pdf'];
    name = json['name'];
    category = json['category'];
    authorName = json['authorName'];
    voice = json['voice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['pdf'] = this.pdf;
    data['name'] = this.name;
    data['category'] = this.category;
    data['authorName'] = this.authorName;
    data['voice'] = this.voice;
    return data;
  }
}
