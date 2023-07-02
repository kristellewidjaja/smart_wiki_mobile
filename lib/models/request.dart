class Request {
  String query;
  String category;

  Request({required this.query, required this.category});

  Request.fromJson(Map<String, dynamic> json)
      : query = json['query'],
        category = json['category'];

  Map<String, dynamic> toJson() => {'query': query, 'category': category};
}
