class SaveReqDto {
  final String? title;
  final String? content;

  SaveReqDto({required this.title, this.content});

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
