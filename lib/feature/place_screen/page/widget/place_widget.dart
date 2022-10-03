import 'package:flutter/material.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/place_model.dart';

Widget placeWidget(PlaceModel model) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text("Id: ${model.id}"),
          Text("Название: ${model.name}"),
          Text("Открывается: ${model.startTime}"),
          Text("Закрывается: ${model.endTime}"),
          Text("Логотип: ${model.logoUrl}"),
          Text("Адресс: г.${model.address.city}, ${model.address.street}, ${model.address.building},  ${model.address.apartment ?? ""}"),
          Text("Координаты: ${model.address.lat}:${model.address.lng}"),
        ],
      ),
    ),
  );
}
