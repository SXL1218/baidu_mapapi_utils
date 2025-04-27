//
//  BMFOpenNaviModel.h
// flutter_baidu_mapapi_utils
//
//  Created by zhangbaojin on 2020/4/13.
//

#import <flutter_baidu_mapapi_base/BMFModel.h>

@class BMFPlanNode;
@class BMFCoordinate;
@class BMKNaviPara;
@class BMKTruckNaviPara;
/// 调起客户端的导航类型
typedef NS_ENUM(NSUInteger, BMFNaviType) {
    kBMFDriveNaviType = 0,    ///<调起百度地图客户端驾车导航页面(不支持调起web地图)
    kBMFWalkNaviType,         /// <调起百度地图客户端步行导航页面(不支持调起web地图)
    kBMFRideNaviType,         ///< 调起百度地图客户端骑行导航页面(不支持调起web地图)
    kBMFARWalkNaviType,       ///< 调起百度地图AR步行导航
    kBMFNewEngDriveNaviType,  ///<调起百度地图客户端驾车（新能源车）导航页面(不支持调起web地图)
    kBMFMotorNaviType,        ///<调起百度地图客户端摩托车导航页面(不支持调起web地图)
    kBMFTruckNaviType         ///<调起百度地图客户端货车导航页面(不支持调起web地图) 百度地图客户端15.4.0以后支持
};


NS_ASSUME_NONNULL_BEGIN

@interface BMFOpenNaviModel : BMFModel

/// 起点坐标
@property (nonatomic, strong) BMFCoordinate *startCoord;

/// 起点名称
@property (nonatomic, copy) NSString *startName;

/// 终点坐标
@property (nonatomic, strong) BMFCoordinate *endCoord;

/// 终点名称
@property (nonatomic, copy) NSString *endName;

/// 节点POI的uid，在已知起点POI的uid情况下，请尽量填写uid，将提升路线规划的准确性
@property (nonatomic, copy) NSString *startUid;

/// 节点POI的uid，在已知起点POI的uid情况下，请尽量填写uid，将提升路线规划的准确性
@property (nonatomic, copy) NSString *endUid;

/// 调起导航类型
@property (nonatomic, assign) NSUInteger naviType;

/// 指定返回自定义scheme
@property (nonatomic, copy) NSString *appScheme;

/// 应用名称
@property (nonatomic, copy) NSString *appName;

/// 调起百度地图客户端驾车导航失败后，是否支持调起web地图，默认：YES（步行、骑行导航设置该参数无效）
@property (nonatomic, assign) BOOL isSupportWeb;

/// 导航路线偏好设置（步行（AR）、骑行导航设置该参数无效）,可选，默认：BMK_NAVI_ROUTE_PLAN_TYPE_DEFAULT(智能推荐)
@property (nonatomic, assign) int preferenceType;

/// 途径点（步行（AR）、骑行导航设置该参数无效）,可选
@property (nonatomic, strong) NSArray<BMFPlanNode *> *viaPoints;
#pragma mark - 货车导航参数
/// 车辆高度,单位米，范围[0,10],可选
@property (nonatomic, assign) float height;

/// 车辆宽度, 单位米，范围[0,5],可选
@property (nonatomic, assign) float width;

/// 车辆总重,单位吨,范围[0,100],可选
@property (nonatomic, assign) float weight;

/// 车辆长度,单位米,范围[0,25],可选
@property (nonatomic, assign) float length;

/// 轴重,单位吨,范围[0,100],可选
@property (nonatomic, assign) float axleWeight;

/// 轴数,范围[0, 50],可选
@property (nonatomic, assign) int axleCount;

/// 是否挂车,可选
@property (nonatomic, assign) BOOL isTrailer;

/// 车牌省份，如京，粤,可选
@property (nonatomic, copy) NSString *plateProvince;

/// 车牌号码，省份外的号码，如B69999,可选
@property (nonatomic, copy) NSString *plateNumber;

/// 车牌颜色,0:蓝色(默认) 1:黄 2:黑 3:白 4:绿,可选
@property (nonatomic, assign) int plateColor;

/// 百公里油耗，单位L,可选
@property (nonatomic, assign) float displacement;

/// 动力类型1-汽油;2-柴油;3-电动;4-混合,可选
@property (nonatomic, assign) int powerType;

/// 排放标准 。取值范围1-6，对 应国1-国6标准,可选
@property (nonatomic, assign) int emissionLimit;

/// 核定载重。单位吨，范围[0,100],可选
@property (nonatomic, assign) BOOL loadWeight;

/// BMFOpenNaviModel  -->  BMKNaviPara
- (BMKNaviPara *)toBMKNaviPara;

/// BMFOpenNaviModel  -->  BMKTruckNaviPara
- (BMKTruckNaviPara *)toBMKTruckNaviPara;
@end

NS_ASSUME_NONNULL_END
