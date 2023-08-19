
import 'dart:convert';

SeriesModl bannerModelFromJson(String str) => SeriesModl.fromJson(json.decode(str));

String bannerModelToJson(SeriesModl data) => json.encode(data.toJson());

class SeriesModl {
    bool? status;
    int? statusCode;
    String? message;
    List<CardData>? data;

    SeriesModl({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    factory SeriesModl.fromJson(Map<String, dynamic> json) => SeriesModl(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CardData>.from(json["data"]!.map((x) => CardData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CardData {
    String? cardName;
    int? cardType;
    String? aspectRatio;
    List<ContentList>? contentList;

    CardData({
        this.cardName,
        this.cardType,
        this.aspectRatio,
        this.contentList,
    });

    factory CardData.fromJson(Map<String, dynamic> json) => CardData(
        cardName: json["card_name"],
        cardType: json["card_type"],
        aspectRatio: json["aspect_ratio"],
        contentList: json["content_list"] == null ? [] : List<ContentList>.from(json["content_list"]!.map((x) => ContentList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "card_name": cardName,
        "card_type": cardType,
        "aspect_ratio": aspectRatio,
        "content_list": contentList == null ? [] : List<dynamic>.from(contentList!.map((x) => x.toJson())),
    };
}

class ContentList {
    String? imageUrl;
    String? name;
    String? contentId;
    String? aspectRatio;
    bool? isAvod;
    bool? isTvod;
    bool? isSvod;
    bool? isResume;
    String? duration;
    String? watchedDuration;

    ContentList({
        this.imageUrl,
        this.name,
        this.contentId,
        this.aspectRatio,
        this.isAvod,
        this.isTvod,
        this.isSvod,
        this.isResume,
        this.duration,
        this.watchedDuration,
    });

    factory ContentList.fromJson(Map<String, dynamic> json) => ContentList(
        imageUrl: json["image_url"],
        name: json["name"],
        contentId: json["content_id"],
        aspectRatio: json["aspect_ratio"],
        isAvod: json["is_avod"],
        isTvod: json["is_tvod"],
        isSvod: json["is_svod"],
        isResume: json["is_resume"],
        duration: json["duration"],
        watchedDuration: json["watched_duration"],
    );

    Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "name": name,
        "content_id": contentId,
        "aspect_ratio": aspectRatio,
        "is_avod": isAvod,
        "is_tvod": isTvod,
        "is_svod": isSvod,
        "is_resume": isResume,
        "duration": duration,
        "watched_duration": watchedDuration,
    };
}
