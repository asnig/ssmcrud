package com.atguigu.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author XYQ
 */
public class Msg {
    /**
     * 状态码 100 成功 200 失败
     */
    private String code;
    /**
     * 提示信息
     */
    private String msg;
    /**
     * 用户要返回给浏览器的数据
     */
    private Map<String, Object> datas = new HashMap<>();

    public static Msg ok() {
        Msg msg = new Msg();
        msg.setCode("100");
        msg.setMsg("处理成功");
        return msg;
    }

    public static Msg error() {
        Msg msg = new Msg();
        msg.setCode("200");
        msg.setMsg("处理失败");
        return msg;
    }

    public Msg add(String key, Object value) {
        this.getDatas().put(key, value);
        return this;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getDatas() {
        return datas;
    }

    public void setDatas(Map<String, Object> datas) {
        this.datas = datas;
    }
}
