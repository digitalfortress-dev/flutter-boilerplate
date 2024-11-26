import 'package:flutter_boilerplate/src/modules/home/domain/entities/panigation_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'panigation_model.g.dart';

@JsonSerializable()
class PaginationModel {
  @JsonKey(name: 'last_visible_page')
  final int lastVisiblePage;

  @JsonKey(name: 'has_next_page')
  final bool hasNextPage;

  @JsonKey(name: 'current_page')
  final int? currentPage;

  final ItemsModel items;

  PaginationModel({
    required this.lastVisiblePage,
    required this.hasNextPage,
    this.currentPage,
    required this.items,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);

  PaginationEntity toEntity() {
    return PaginationEntity(
      lastVisiblePage: lastVisiblePage,
      hasNextPage: hasNextPage,
      currentPage: currentPage,
      count: items.count,
      total: items.total,
      perPage: items.perPage,
    );
  }
}

@JsonSerializable()
class ItemsModel {
  final int count;
  final int total;
  @JsonKey(name: 'per_page')
  final int perPage;

  ItemsModel({required this.count, required this.total, required this.perPage});

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}
