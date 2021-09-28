class UpdateReqDto {
  final String? title;
  final String? content;
  final bool? completed;

  UpdateReqDto({this.title, this.content, this.completed});

  Map<String, dynamic> toJson() =>
      {"title": title, "content": content, "completed": completed};
}
