class BookModel {
  String? cover;
  String? pdf;
  // String? id;
  String? category;
  String? authorName;
  String? voice;

  BookModel(
      {this.cover,
        this.pdf,
        // this.id,
        this.category,
        this.authorName,
        this.voice});

  BookModel.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    pdf = json['pdf'];
    // id = json['Id'];
    category = json['category'];
    authorName = json['authorName'];
    voice = json['voice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['pdf'] = this.pdf;
    // data['Id'] = this.id;
    data['category'] = this.category;
    data['authorName'] = this.authorName;
    data['voice'] = this.voice;
    return data;
  }
}
