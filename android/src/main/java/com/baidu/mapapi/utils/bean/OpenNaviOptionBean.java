package com.baidu.mapapi.utils.bean;

import com.baidu.mapapi.model.LatLng;

import java.util.List;

public class OpenNaviOptionBean {
    /**
     * 导航起点， 经纬度坐标
     */
    public LatLng startCoord;

    /**
     * 导航起点名称
     */
    public String startName;

    /**
     * 导航终点， 经纬度坐标
     */
    public LatLng endCoord;

    /**
     * 导航终点名称
     */
    public String endName;

    /**
     * 调起导航类型
     */
    public int naviType;

    /**
     * 调起百度地图客户端失败后，打开网页版百度地图
     */
    public boolean isSupportWeb;

    /**
     * 起点poiid 在已知起点POI的uid情况下，请尽量填写uid，将提升路线规划的准确性
     */
    public String startUid;

    /**
     * 终点poiid 在已知起点POI的uid情况下，请尽量填写uid，将提升路线规划的准确性
     */
    public String endUid;

    /**
     * 导航路线规划策略
     *
     * BLK:躲避拥堵;
     * TIME:最短时间;
     * DIS:最短路程;
     * FEE:少走高速;
     * HIGHWAY:高速优先;
     * DEFAULT:推荐（地图app不选择偏好）;
     */
    public int preferenceType;

    public List<WayPointsInfoBean> viaPoints;

}
