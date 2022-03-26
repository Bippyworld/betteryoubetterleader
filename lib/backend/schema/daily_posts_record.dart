import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'daily_posts_record.g.dart';

abstract class DailyPostsRecord
    implements Built<DailyPostsRecord, DailyPostsRecordBuilder> {
  static Serializer<DailyPostsRecord> get serializer =>
      _$dailyPostsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Post')
  String get post;

  @nullable
  @BuiltValueField(wireName: 'Title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'Date')
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'EDate')
  DateTime get eDate;

  @nullable
  @BuiltValueField(wireName: 'SDate')
  DateTime get sDate;

  @nullable
  @BuiltValueField(wireName: 'Advertise')
  String get advertise;

  @nullable
  int get favorite;

  @nullable
  @BuiltValueField(wireName: 'FavoriteU')
  BuiltList<String> get favoriteU;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get quote;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DailyPostsRecordBuilder builder) => builder
    ..post = ''
    ..title = ''
    ..advertise = ''
    ..favorite = 0
    ..favoriteU = ListBuilder()
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..quote = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('daily_posts');

  static Stream<DailyPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DailyPostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DailyPostsRecord._();
  factory DailyPostsRecord([void Function(DailyPostsRecordBuilder) updates]) =
      _$DailyPostsRecord;

  static DailyPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDailyPostsRecordData({
  String post,
  String title,
  DateTime date,
  DateTime eDate,
  DateTime sDate,
  String advertise,
  int favorite,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String quote,
}) =>
    serializers.toFirestore(
        DailyPostsRecord.serializer,
        DailyPostsRecord((d) => d
          ..post = post
          ..title = title
          ..date = date
          ..eDate = eDate
          ..sDate = sDate
          ..advertise = advertise
          ..favorite = favorite
          ..favoriteU = null
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..quote = quote));
