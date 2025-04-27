//
//  BMFOpenNaviModel.m
// flutter_baidu_mapapi_utils
//
//  Created by zhangbaojin on 2020/4/13.
//

#import "BMFOpenNaviModel.h"
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import <flutter_baidu_mapapi_base/BMFMapModels.h>

@implementation BMFOpenNaviModel
+ (NSDictionary *)bmf_setupObjectClassInArray {
    return @{
             @"viaPoints" : @"BMFPlanNode"
    };
}

// 此处需要依赖BMFMapModel
- (BMKNaviPara *)toBMKNaviPara {
    BMKNaviPara *naviPara = [BMKNaviPara new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    start.uid = self.startUid;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    end.uid = self.endUid;
    naviPara.startPoint = start;
    naviPara.endPoint = end;
    if (self.appScheme) {
        naviPara.appScheme = self.appScheme;
    }
    if (self.appName) {
        naviPara.appName = self.appName;
    }
    naviPara.isSupportWeb = self.isSupportWeb;
    naviPara.preferenceType = self.preferenceType;

    NSMutableArray *nodes = [NSMutableArray array];
    for (BMFPlanNode *node in self.viaPoints) {
        BMKPlanNode *n = [node toBMKPlanNode];
        [nodes addObject:n];
    }
    naviPara.viaPoints = [nodes copy];
    
    return naviPara;
}


- (BMKTruckNaviPara *)toBMKTruckNaviPara {
    BMKTruckNaviPara *naviPara = [BMKTruckNaviPara new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    naviPara.startPoint = start;
    naviPara.endPoint = end;
    if (self.appScheme) {
        naviPara.appScheme = self.appScheme;
    }
    if (self.appName) {
        naviPara.appName = self.appName;
    }
    naviPara.isSupportWeb = self.isSupportWeb;
    naviPara.preferenceType = self.preferenceType;
    
    NSMutableArray *nodes = [NSMutableArray array];
    for (BMFPlanNode *node in self.viaPoints) {
        BMKPlanNode *n = [node toBMKPlanNode];
        [nodes addObject:n];
    }
    naviPara.viaPoints = [nodes copy];
    /// 车辆高度,单位米，范围[0,10],可选
    naviPara.height = self.height;
    /// 车辆宽度, 单位米，范围[0,5],可选
    naviPara.width = self.width;
    /// 车辆总重,单位吨,范围[0,100],可选
    naviPara.weight = self.weight;
    /// 车辆长度,单位米,范围[0,25],可选
    naviPara.length = self.length;
    /// 轴重,单位吨,范围[0,100],可选
    naviPara.axleWeight = self.axleWeight;
    /// 轴数,范围[0, 50],可选
    naviPara.axleCount = self.axleCount;
    /// 是否挂车,可选
    naviPara.isTrailer = self.isTrailer;
    /// 车牌省份，如京，粤,可选
    naviPara.plateProvince = self.plateProvince;
    /// 车牌号码，省份外的号码，如B69999,可选
    naviPara.plateNumber = self.plateNumber;
    /// 车牌颜色,0:蓝色(默认) 1:黄 2:黑 3:白 4:绿,可选
    naviPara.plateColor = self.plateColor;
    /// 百公里油耗，单位L,可选
    naviPara.displacement = self.displacement;
    /// 动力类型1-汽油;2-柴油;3-电动;4-混合,可选
    naviPara.powerType = self.powerType;
    /// 排放标准 。取值范围1-6，对 应国1-国6标准,可选
    naviPara.emissionLimit = self.emissionLimit;
    /// 核定载重。单位吨，范围[0,100],可选
    naviPara.loadWeight = self.loadWeight;
    
    return naviPara;
}
@end
