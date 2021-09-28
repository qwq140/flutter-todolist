class CMRespDto {
  final int? statusCode;
  final String? msg;
  final dynamic data;

  CMRespDto({this.statusCode, this.msg, this.data});

  CMRespDto.fromJson(Map<String, dynamic> json)
      : statusCode = json["statusCode"],
        msg = json["msg"],
        data = json["data"];
}
