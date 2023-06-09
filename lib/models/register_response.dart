///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
const String _jsonKeyRegisterResponseStatus = 'status';
const String _jsonKeyRegisterResponseMessage = 'message';
const String _jsonKeyRegisterResponseData = 'data';
const String _jsonKeyRegisterResponseDataName = 'name';
const String _jsonKeyRegisterResponseDataPhone = 'phone';
const String _jsonKeyRegisterResponseDataEmail = 'email';
const String _jsonKeyRegisterResponseDataId = 'id';
const String _jsonKeyRegisterResponseDataImage = 'image';
const String _jsonKeyRegisterResponseDataToken = 'token';
class RegisterResponseData {
/*
{
  "name": "shimaa refaat",
  "phone": "011426788",
  "email": "alshimaa.rfaat@ibm.com",
  "id": 55628,
  "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
  "token": "aEQV82uqPdQ2dAUebqONhQqdGZxtR5Gg5sr7Vlw9cbiUQSLavCU96NYPdddwj2aT5zTG1v"
}
*/

  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  RegisterResponseData({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
  });
  RegisterResponseData.fromJson(Map<String, dynamic> json) {
    name = json[_jsonKeyRegisterResponseDataName]?.toString();
    phone = json[_jsonKeyRegisterResponseDataPhone]?.toString();
    email = json[_jsonKeyRegisterResponseDataEmail]?.toString();
    id = int.tryParse(json[_jsonKeyRegisterResponseDataId]?.toString() ?? '');
    image = json[_jsonKeyRegisterResponseDataImage]?.toString();
    token = json[_jsonKeyRegisterResponseDataToken]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRegisterResponseDataName] = name;
    data[_jsonKeyRegisterResponseDataPhone] = phone;
    data[_jsonKeyRegisterResponseDataEmail] = email;
    data[_jsonKeyRegisterResponseDataId] = id;
    data[_jsonKeyRegisterResponseDataImage] = image;
    data[_jsonKeyRegisterResponseDataToken] = token;
    return data;
  }
}

class RegisterResponse {
/*
{
  "status": true,
  "message": "تم التسجيل بنجاح",
  "data": {
    "name": "shimaa refaat",
    "phone": "011426788",
    "email": "alshimaa.rfaat@ibm.com",
    "id": 55628,
    "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
    "token": "aEQV82uqPdQ2dAUebqONhQqdGZxtR5Gg5sr7Vlw9cbiUQSLavCU96NYPdddwj2aT5zTG1v"
  }
}
*/

  bool? status;
  String? message;
  RegisterResponseData? data;

  RegisterResponse({
    this.status,
    this.message,
    this.data,
  });
  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json[_jsonKeyRegisterResponseStatus];
    message = json[_jsonKeyRegisterResponseMessage]?.toString();
    data = (json[_jsonKeyRegisterResponseData] != null && (json[_jsonKeyRegisterResponseData] is Map)) ? RegisterResponseData.fromJson(json[_jsonKeyRegisterResponseData]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRegisterResponseStatus] = status;
    data[_jsonKeyRegisterResponseMessage] = message;
    if (data != null) {
      data[_jsonKeyRegisterResponseData] = this.data!.toJson();
    }
    return data;
  }
}
