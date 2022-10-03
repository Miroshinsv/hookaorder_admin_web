import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required int id,
    String? country,
    required String city,
    required String street,
    required String building,
    String? apartment,
    required double lat,
    required double lng,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

extension on AddressModel {
  get id => id;
  get country => country;
  get city => city;
  get street => street;
  get building => building;
  get apartment => apartment;
  get lat => lat;
  get lng => lng;
}
