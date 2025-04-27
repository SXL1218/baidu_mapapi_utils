package com.baidu.mapapi.utils.bean;

import com.baidu.mapapi.model.LatLng;

/**
 * 路径规划
 */
public class OpenRouteOptionBean {
    /**
     * 路线起点， 经纬度坐标
     */
    public LatLng startCoord;

    /**
     * 路线起点名称
     */
    public String startName;

    /**
     * 路线终点， 经纬度坐标
     */
    public LatLng endCoord;

    /**
     * 路线终点名称
     */
    public String endName;

    /**
     * 调起路线类型
     */
    public int routeType;

    /**
     * 交通路线策略 默认T: RANSIT_RECOMMAND
     * 异常值时: 强制使用TRANSIT_RECOMMAND
     * 调起百度地图公共交通路线时必填参数
     */
    public int transitPolicy;

    /**
     * 调起百度地图客户端失败后，是否支持调起web地图
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
}
