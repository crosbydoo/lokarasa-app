// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkDtoAdapter extends TypeAdapter<BookmarkDto> {
  @override
  final int typeId = 1;

  @override
  BookmarkDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkDto(
      id: fields[0] as String,
      name: fields[1] as String,
      city: fields[2] as String,
      rating: fields[3] as double,
      idPicture: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.idPicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
