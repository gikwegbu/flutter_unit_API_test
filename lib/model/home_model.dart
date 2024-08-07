class RemoteModel {
  final int? userId;
  final int? it;
  final String? title;
  final String? body;

  const RemoteModel({
    this.userId,
    this.it,
    this.title,
    this.body,
  });

  factory RemoteModel.fromJson(Map<String, dynamic> json) => RemoteModel(
      userId: json['userId'],
      it: json['it'] ?? json['id'],
      title: json['title'],
      body: json['body']);

  Map<String, dynamic> toJson() =>
      {"userId": userId, "it": it, "title": title, "body": body};

  List<RemoteModel> fromList(List<dynamic> items) {
    if (items.isEmpty) {
      return [];
    } else {
      return items.map((e) => RemoteModel.fromJson(e)).toList();
    }
  }
}


// Calling it on the service be like:::>>> const RemoteModel()
//           .fromList(response.data as List<dynamic>);