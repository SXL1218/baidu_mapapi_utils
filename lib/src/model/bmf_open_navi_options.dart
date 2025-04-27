import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFModel, BMFCoordinate;

/// 调起客户端的导航类型
enum BMFNaviType {
  ///<调起百度地图客户端驾车导航页面(不支持调起web地图)
  DriveNavi,

  ///<调起百度地图客户端步行导航页面(不支持调起web地图)
  ///
  ///<客户端v8.8以后支持
  WalkNavi,

  ///<调起百度地图客户端骑行导航页面(不支持调起web地图)
  ///
  ///<客户端v8.8以后支持
  RideNavi,

  ///<调起百度地图AR步行导航
  ///
  ///<百度地图客户端v9.7.5以后支持AR步行导航，低于此版本，默认调用步行导航；注：客户端版本低于8.6.9，不支持步行导航。
  ARWalkNavi,

  ///<调起百度地图客户端驾车（新能源车）导航页面(不支持调起web地图) since 3.2.0
  /// 仅支持iOS
  NewEngDriveNavi,

  ///<调起百度地图客户端摩托车导航页面(不支持调起web地图) since 3.2.0
  /// 仅支持iOS
  MotorNavi,

  ///<调起百度地图客户端货车导航页面(不支持调起web地图) since 3.2.0
  /// 仅支持iOS
  /// 百度地图客户端15.4.0以后支持
  TruckNavi
}

/// 导航路线偏好枚举 since 3.2.0
enum BMFNaviRoutePlanType {
  ///< 躲避拥堵(自驾)
  BLK,

  ///< 最短时间,高速优先(自驾)
  TIME,

  ///< 最短路程,不走高速(自驾)；不支持（货车）
  DIS,

  ///< 少走高速,避免收费(自驾);不走高速（货车）
  FEE,

  ///< 智能推荐
  DEFAULT,

  ///< 省钱路线(仅货车)
  ECONOMICS
}

class BMFWayPointInfo implements BMFModel {
  /// 途经点名称
  String? name;

  /// 途经点坐标
  BMFCoordinate? pt;

  BMFWayPointInfo({required this.pt, this.name});

  /// map => WayPointInfo
  BMFWayPointInfo.fromMap(Map map)
      : assert(
            map != null, //ignore: unnecessary_null_comparison
            'Construct a BMFWayPointInfo，The parameter map cannot be null !') {
    pt = map['pt'] == null ? null : BMFCoordinate.fromMap(map['pt']);
    name = map['name'];
  }

  @override
  fromMap(Map map) {
    return BMFWayPointInfo.fromMap(map);
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'pt': this.pt?.toMap(),
      'name': this.name,
    };
  }
}

/// 调起客户端导航参数
class BMFOpenNaviOption implements BMFModel {
  /// 导航起点， 经纬度坐标
  BMFCoordinate? startCoord;

  /// 导航起点名称
  String? startName;

  /// 导航终点， 经纬度坐标
  BMFCoordinate? endCoord;

  /// 导航终点名称
  String? endName;

  /// 调起导航类型
  BMFNaviType? naviType;

  /// 起点poiid 在已知起点POI的uid情况下，请尽量填写uid，将提升路线规划的准确性
  String? startUid;

  /// 终点poiid 在已知起点POI的uid情况下，请尽量填写uid，将提升路线规划的准确性
  String? endUid;

  /// 指定返回自定义scheme
  ///
  /// iOS独有，iOS平台必传
  String? appScheme;

  /// 应用名称
  ///
  /// iOS独有，iOS平台必传
  String? appName;

  /// 调起百度地图客户端驾车导航失败后，是否支持调起web地图，
  ///
  /// 默认：true（步行、骑行导航设置该参数无效）
  bool? isSupportWeb;

  /// 导航路线偏好设置（步行（AR）、骑行导航设置该参数无效）,可选 since 3.2.0
  BMFNaviRoutePlanType? preferenceType;

  /// 途经点列表（最大支持3个）（步行（AR）、骑行导航设置该参数无效）,可选 since 3.8.0
  List<BMFWayPointInfo>? viaPoints;

  /// BMFOpenNaviOption构造方法
  BMFOpenNaviOption({
    required this.startCoord,
    this.startName,
    required this.endCoord,
    this.endName,
    required this.naviType,
    this.appScheme,
    this.appName,
    this.isSupportWeb = true,
    this.preferenceType,
    this.startUid,
    this.endUid,
    this.viaPoints,
  });

  /// map => BMFOpenNaviOption
  BMFOpenNaviOption.fromMap(Map map)
      : assert(
            map != null, //ignore: unnecessary_null_comparison
            'Construct a BMFOpenNaviOption，The parameter map cannot be null !'),
        assert(map.containsKey('startCoord')),
        assert(map.containsKey('endCoord')),
        assert(map.containsKey('naviType')) {
    startCoord = map['startCoord'] == null
        ? null
        : BMFCoordinate.fromMap(map['startCoord']);
    endCoord =
        map['endCoord'] == null ? null : BMFCoordinate.fromMap(map['endCoord']);
    startName = map['startName'];
    endName = map['endName'];
    naviType = map['naviType'] != null
        ? BMFNaviType.values[map['naviType'] as int]
        : null;
    appScheme = map['appScheme'];
    appName = map['appName'];
    isSupportWeb = map['isSupportWeb'] as bool?;
    preferenceType = map['preferenceType'] != null
        ? BMFNaviRoutePlanType.values[map['preferenceType'] as int]
        : null;
    startUid = map['startUid'];
    endUid = map['endUid'];
    if (map['viaPoints'] != null) {
      List<BMFWayPointInfo> tmpViaPoints = [];
      map['viaPoints'].forEach((v) {
        tmpViaPoints.add(BMFWayPointInfo.fromMap(v as Map));
      });
      viaPoints = tmpViaPoints;
    }
  }

  @override
  fromMap(Map map) {
    return BMFOpenNaviOption.fromMap(map);
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'startCoord': this.startCoord?.toMap(),
      'startName': this.startName,
      'endCoord': this.endCoord?.toMap(),
      'endName': this.endName,
      'naviType': this.naviType != null ? this.naviType!.index : null,
      'appScheme': this.appScheme,
      'appName': this.appName,
      'isSupportWeb': this.isSupportWeb,
      'preferenceType': this.preferenceType?.index,
      'startUid': this.startUid,
      'endUid': this.endUid,
      'viaPoints': this.viaPoints?.map((points) => points.toMap()).toList(),
    };
  }
}

/// 调起客户端货车导航参数
class BMFOpenTruckNaviOption extends BMFOpenNaviOption {
  /// 车辆高度,单位米，范围[0,10],可选
  double? height;

  /// 车辆宽度, 单位米，范围[0,5],可选
  double? width;

  /// 车辆总重,单位吨,范围[0,100],可选
  double? weight;

  /// 车辆长度,单位米,范围[0,25],可选
  double? length;

  /// 轴重,单位吨,范围[0,100],可选
  double? axleWeight;

  /// 轴数,范围[0, 50],可选
  int? axleCount;

  /// 是否挂车,可选
  bool? isTrailer;

  /// 车牌省份，如京，粤,可选
  String? plateProvince;

  /// 车牌号码，省份外的号码，如B69999,可选
  String? plateNumber;

  /// 车牌颜色,0:蓝色(默认) 1:黄 2:黑 3:白 4:绿,可选
  int? plateColor;

  /// 百公里油耗，单位L,可选
  double? displacement;

  /// 动力类型1-汽油;2-柴油;3-电动;4-混合,可选
  int? powerType;

  /// 排放标准 。取值范围1-6，对 应国1-国6标准,可选
  int? emissionLimit;

  /// 核定载重。单位吨，范围[0,100],可选
  bool? loadWeight;

  BMFOpenTruckNaviOption({
    required BMFCoordinate? startCoord,
    String? startName,
    required BMFCoordinate? endCoord,
    String? endName,
    required BMFNaviType? naviType,
    String? appScheme,
    String? appName,
    bool? isSupportWeb = true,
    BMFNaviRoutePlanType? preferenceType,
    List<BMFWayPointInfo>? viaPoints,
    this.height,
    this.width,
    this.weight,
    this.length,
    this.axleWeight,
    this.axleCount,
    this.isTrailer,
    this.plateProvince,
    this.plateNumber,
    this.plateColor,
    this.displacement,
    this.powerType,
    this.emissionLimit,
    this.loadWeight,
  }) : super(
            startCoord: startCoord,
            startName: startName,
            endCoord: endCoord,
            endName: endName,
            naviType: naviType,
            appScheme: appScheme,
            appName: appName,
            isSupportWeb: isSupportWeb,
            preferenceType: preferenceType,
            viaPoints: viaPoints);

  /// map => BMFOpenTruckNaviOption
  BMFOpenTruckNaviOption.fromMap(Map map) : super.fromMap(map) {
    height = map['height'] as double;
    width = map['width'] as double;
    weight = map['weight'] as double;
    length = map['length'] as double;
    axleWeight = map['axleWeight'] as double;
    axleCount = map['axleCount'] as int;
    isTrailer = map['isTrailer'] as bool;
    plateProvince = map['plateProvince'];
    plateNumber = map['plateNumber'];
    plateColor = map['plateColor'] as int;
    displacement = map['displacement'] as double;
    powerType = map['powerType'] as int;
    emissionLimit = map['emissionLimit'] as int;
    loadWeight = map['loadWeight'] as bool;
    if (map['viaPoints'] != null) {
      List<BMFWayPointInfo> tmpViaPoints = [];
      map['viaPoints'].forEach((v) {
        tmpViaPoints.add(BMFWayPointInfo.fromMap(v as Map));
      });
      viaPoints = tmpViaPoints;
    }
  }

  @override
  fromMap(Map map) {
    return BMFOpenTruckNaviOption.fromMap(map);
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'startCoord': this.startCoord?.toMap(),
      'startName': this.startName,
      'endCoord': this.endCoord?.toMap(),
      'endName': this.endName,
      'naviType': this.naviType != null ? this.naviType!.index : null,
      'appScheme': this.appScheme,
      'appName': this.appName,
      'isSupportWeb': this.isSupportWeb,
      'preferenceType': this.preferenceType?.index,
      'height': this.height,
      'width': this.width,
      'weight': this.weight,
      'length': this.length,
      'axleWeight': this.axleWeight,
      'axleCount': this.axleCount,
      'isTrailer': this.isTrailer,
      'plateProvince': this.plateProvince,
      'plateNumber': this.plateNumber,
      'plateColor': this.plateColor,
      'displacement': this.displacement,
      'powerType': this.powerType,
      'emissionLimit': this.emissionLimit,
      'loadWeight': this.loadWeight,
      'viaPoints': this.viaPoints?.map((points) => points.toMap()).toList(),
    };
  }
}
