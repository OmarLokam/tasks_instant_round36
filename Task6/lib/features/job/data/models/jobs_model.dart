class JobsModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  JobsModel({this.data, this.links, this.meta});

  JobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  String slug;
  String companyName;
  String title;
  String description;
  bool remote;
  String url;
  List<String>? tags;
  List<String>? jobTypes;
  String location;
  int createdAt;

  Data({
    required this.slug,
    required this.companyName,
    required this.title,
    required this.description,
    required this.remote,
    required this.url,
    this.tags,
    this.jobTypes,
    required this.location,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      slug: json['slug'] as String? ?? "",
      companyName: json['company_name'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      remote: json['remote'] as bool? ?? true,
      url: json['url'] as String? ?? "",
      tags: json['tags'].cast<String>() ?? [],
      jobTypes: json['job_types'].cast<String>() ?? [],
      location: json['location'] as String? ?? "",
      createdAt: json['created_at'] as int? ?? 0,
    );
  }

  String get isRemoteString => remote ? "Remote" : "Office";


  String get postedAgo {
    final date = DateTime.fromMillisecondsSinceEpoch(createdAt * 1000);
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return "Posted just now";
    } else if (difference.inMinutes < 60) {
      return "Posted ${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;

      if (hours == 1) {
        return "Posted 1 hour ago";
      }

      return "Posted $hours hours ago";
    } else {
      final days = difference.inDays;

      if (days == 1) {
        return "Posted 1 day ago";
      }

      return "Posted $days days ago";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['company_name'] = this.companyName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['remote'] = this.remote;
    data['url'] = this.url;
    data['tags'] = this.tags;
    data['job_types'] = this.jobTypes;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Links {
  String? first;
  Null? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  String? currentPageUrl;
  int? from;
  String? path;
  int? perPage;
  int? to;
  String? terms;
  String? info;

  Meta({
    this.currentPage,
    this.currentPageUrl,
    this.from,
    this.path,
    this.perPage,
    this.to,
    this.terms,
    this.info,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    currentPageUrl = json['current_page_url'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    terms = json['terms'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['current_page_url'] = this.currentPageUrl;
    data['from'] = this.from;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['terms'] = this.terms;
    data['info'] = this.info;
    return data;
  }
}
