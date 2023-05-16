
class UpdateProfileDTO {
  UpdateProfileDTO({
    required this.name,
    required this.email,
    required this.otherEmail,
    required this.image,
  });

  final String name;
  final String email;
  final String otherEmail;
  final String? image;

  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> data = <String, dynamic>{};
    if(name.isNotEmpty) data['name'] = name;
    if(email.isNotEmpty) data['email'] = email;
    if(otherEmail.isNotEmpty) data['otherEmail'] = otherEmail;
    // if(image?.isNotEmpty??false) data['image'] = await MultipartFile.fromFile(image!, filename: image!.split('/').last);
    return data;
  }
}
