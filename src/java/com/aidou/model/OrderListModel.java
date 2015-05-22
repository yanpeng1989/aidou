/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aidou.model;

/**
 *
 * @author Administrator
 */
public class OrderListModel {

    public String brand;//品牌
    public String proname;//品名
    public String label;//规格
    public String amount;//数量
    public String store_status;//库存状态
    public String order_id;//总订单ID
    public String order_status;//总订单状态

    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProname() {
        return this.proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public String getLabel() {
        return this.label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getAmount() {
        return this.amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getStore_status() {
        return this.store_status;
    }

    public void setStore_status(String store_status) {
        this.store_status = store_status;
    }

    public String getOrder_id() {
        return this.order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getOrder_status() {
        return this.order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }
}
