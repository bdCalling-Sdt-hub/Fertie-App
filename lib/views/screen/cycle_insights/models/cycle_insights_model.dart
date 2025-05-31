class CycleInsightsModel {
  int? code;
  String? message;
  CycleInsightsData? data;
  bool? success;

  CycleInsightsModel({this.code, this.message, this.data, this.success});

  CycleInsightsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? CycleInsightsData.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class CycleInsightsData {
  Attributes? attributes;

  CycleInsightsData({this.attributes});

  CycleInsightsData.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? currentCycleInfo;
  String? suggestion;
  String? patternFertieNoticed;
  String? whatToKeepInMindInThisCycle;
  int? cycleDay;

  Attributes(
      {this.currentCycleInfo,
        this.suggestion,
        this.patternFertieNoticed,
        this.whatToKeepInMindInThisCycle,
        this.cycleDay});

  Attributes.fromJson(Map<String, dynamic> json) {
    currentCycleInfo = json['currentCycleInfo'];
    suggestion = json['suggestion'];
    patternFertieNoticed = json['patternFertieNoticed'];
    whatToKeepInMindInThisCycle = json['whatToKeepInMindInThisCycle'];
    cycleDay = json['cycleDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentCycleInfo'] = currentCycleInfo;
    data['suggestion'] = suggestion;
    data['patternFertieNoticed'] = patternFertieNoticed;
    data['whatToKeepInMindInThisCycle'] = whatToKeepInMindInThisCycle;
    data['cycleDay'] = cycleDay;
    return data;
  }
}
