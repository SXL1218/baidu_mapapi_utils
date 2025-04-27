//
//  BMFOpenRouteModel.m
// flutter_baidu_mapapi_utils
//
//  Created by zhangbaojin on 2020/4/13.
//

#import "BMFOpenRouteModel.h"
#import <flutter_baidu_mapapi_base/BMFMapModels.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>

@implementation BMFOpenRouteModel
- (BMKOpenWalkingRouteOption *)toBMKOpenWalkingRouteOption {
    BMKOpenWalkingRouteOption *option = [BMKOpenWalkingRouteOption new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    start.uid = self.startUid;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    end.uid = self.endUid;
    option.startPoint = start;
    option.endPoint = end;
    if (self.appScheme) {
        option.appScheme = self.appScheme;
    }
    option.isSupportWeb = self.isSupportWeb;
    return option;
}

- (BMKOpenDrivingRouteOption *)toBMKOpenDrivingRouteOption {
    BMKOpenDrivingRouteOption *option = [BMKOpenDrivingRouteOption new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    option.startPoint = start;
    option.endPoint = end;
    if (self.appScheme) {
        option.appScheme = self.appScheme;
    }
    option.isSupportWeb = self.isSupportWeb;
    return option;
}

- (BMKOpenTransitRouteOption *)toBMKOpenTransitRouteOption {
    BMKOpenTransitRouteOption *option = [BMKOpenTransitRouteOption new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    option.startPoint = start;
    option.endPoint = end;
    option.openTransitPolicy = (int)self.openTransitPolicy;
    if (self.appScheme) {
        option.appScheme = self.appScheme;
    }
    option.isSupportWeb = self.isSupportWeb;
    return option;
}

- (BMKOpenNewEngRouteOption *)toBMKOpenNewEngRouteOption {
    BMKOpenNewEngRouteOption *option = [BMKOpenNewEngRouteOption new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    option.startPoint = start;
    option.endPoint = end;
    if (self.appScheme) {
        option.appScheme = self.appScheme;
    }
    option.isSupportWeb = self.isSupportWeb;
    return option;
}

- (BMKOpenTruckRouteOption *)toBMKOpenTruckRouteOption {
    BMKOpenTruckRouteOption *option = [BMKOpenTruckRouteOption new];
    BMKPlanNode *start = [BMKPlanNode new];
    start.pt = [self.startCoord toCLLocationCoordinate2D];
    start.name = self.startName;
    BMKPlanNode *end = [BMKPlanNode new];
    end.pt = [self.endCoord toCLLocationCoordinate2D];
    end.name = self.endName;
    option.startPoint = start;
    option.endPoint = end;
    if (self.appScheme) {
        option.appScheme = self.appScheme;
    }
    option.isSupportWeb = self.isSupportWeb;
    return option;
}
@end
