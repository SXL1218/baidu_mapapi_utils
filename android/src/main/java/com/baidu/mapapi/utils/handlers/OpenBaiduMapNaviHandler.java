package com.baidu.mapapi.utils.handlers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.baidu.mapapi.navi.BaiduMapNavigation;
import com.baidu.mapapi.navi.NaviParaOption;
import com.baidu.mapapi.navi.WayPoint;
import com.baidu.mapapi.navi.WayPointInfo;
import com.baidu.mapapi.utils.Constants.ErrorCode;
import com.baidu.mapapi.utils.Constants.NaviType;
import com.baidu.mapapi.utils.FlutterBmfUtilsPlugin;
import com.baidu.mapapi.utils.bean.OpenNaviOptionBean;
import com.baidu.mapapi.utils.bean.WayPointsInfoBean;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import com.baidu.mapapi.utils.Env;

/**
 * 打开百度导航
 */
public class OpenBaiduMapNaviHandler extends MethodChannelHandler {

    public static final String TAG = OpenBaiduMapNaviHandler.class.getSimpleName();

    @Override
    public void handlerMethodCallResult(MethodCall call, MethodChannel.Result result) {
        super.handlerMethodCallResult(call, result);
        if (Env.DEBUG) {
            Log.d(TAG, "handlerMethodCallResult enter" + call.arguments.toString());
        }

        if (null == call.arguments) {
            returnResult(ErrorCode.OPEN_OPTION_NULL);
            return;
        }

        HashMap<String, Object> argumentsMap = (HashMap<String, Object>) call.arguments;
        if (null == argumentsMap) {
            returnResult(ErrorCode.OPEN_OPTION_NULL);
            return;
        }

        HashMap<String, Object> naviOptions =
                (HashMap<String, Object>) argumentsMap.get("naviOption");
        if (null == naviOptions) {
            returnResult(ErrorCode.OPEN_OPTION_NULL);
            return;
        }

        Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create();
        String json = gson.toJson(naviOptions);
        if (TextUtils.isEmpty(json)) {
            returnResult(ErrorCode.OPTION_ERROR);
            return;
        }

        OpenNaviOptionBean openNaviOptionBean = gson.fromJson(json, OpenNaviOptionBean.class);
        openBaiduNaviImp(openNaviOptionBean, result);
    }

    private void openBaiduNaviImp(OpenNaviOptionBean openNaviOptionBean,
                                  MethodChannel.Result result) {
        Context applicationContext = FlutterBmfUtilsPlugin.getApplicationContext();
        if (null == applicationContext) {
            returnResult(ErrorCode.OPEN_OTHER_ERROR);
            return;
        }

        if (null == openNaviOptionBean) {
            returnResult(ErrorCode.OPTION_ERROR);
            return;
        }

        NaviParaOption naviParaOption = toNaviParaOption(openNaviOptionBean);
        if (null == naviParaOption) {
            returnResult(ErrorCode.OPTION_ERROR);
            return;
        }

        BaiduMapNavigation.setSupportWebNavi(openNaviOptionBean.isSupportWeb);

        boolean ret = false;
        try {
            switch (openNaviOptionBean.naviType) {
                case NaviType.sDriveNavi:
                    ret = BaiduMapNavigation.openBaiduMapNavi(naviParaOption, applicationContext);
                    break;
                case NaviType.sARWalkNavi:
                    ret = BaiduMapNavigation
                            .openBaiduMapWalkNaviAR(naviParaOption, applicationContext);
                    break;
                case NaviType.sRideNavi:
                    ret = BaiduMapNavigation
                            .openBaiduMapBikeNavi(naviParaOption, applicationContext);
                    break;
                case NaviType.sWalkNavi:
                    ret = BaiduMapNavigation
                            .openBaiduMapWalkNavi(naviParaOption, applicationContext);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString());
        }

        if (ret) {
            returnResult(ErrorCode.OPEN_NO_ERROR);
        } else {
            returnResult(ErrorCode.OPEN_OTHER_ERROR);
        }

    }

    private NaviParaOption toNaviParaOption(OpenNaviOptionBean openNaviOptionBean) {
        if (null == openNaviOptionBean) {
            return null;
        }

        NaviParaOption naviParaOption = new NaviParaOption();
        naviParaOption.endName(openNaviOptionBean.endName);
        naviParaOption.startName(openNaviOptionBean.startName);
        naviParaOption.startPoint(openNaviOptionBean.startCoord);
        naviParaOption.endPoint(openNaviOptionBean.endCoord);
        if (null != openNaviOptionBean.startUid) {
            naviParaOption.startUid(openNaviOptionBean.startUid);
        }
        if (null != openNaviOptionBean.endUid) {
            naviParaOption.endUid(openNaviOptionBean.endUid);
        }
        // 途经点（最大3个）和路线规划策略 since 3.8.0
        List<WayPointsInfoBean> viaPointsList = openNaviOptionBean.viaPoints;
        if (viaPointsList != null && viaPointsList.size() > 0) {
            List<WayPointInfo> wayPointInfoList = new ArrayList<>();
            for (int i = 0; i < viaPointsList.size(); i++) {
                WayPointInfo wayPointInfo = new WayPointInfo();
                wayPointInfo.setLatLng(viaPointsList.get(i).pt);
                wayPointInfo.setWayPointName(viaPointsList.get(i).name);
                wayPointInfoList.add(wayPointInfo);
            }
            WayPoint wayPoint = new WayPoint(wayPointInfoList);
            naviParaOption.setWayPoint(wayPoint);
        }
        naviParaOption.setNaviRoutePolicy(NaviParaOption.NaviRoutePolicy.values()[openNaviOptionBean.preferenceType]);
        return naviParaOption;
    }
}