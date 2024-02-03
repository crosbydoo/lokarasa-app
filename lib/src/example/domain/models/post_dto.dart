class PostDto {
  int id;
  int userId;
  String title;
  String body;

  PostDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}
