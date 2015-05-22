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
public class GoodsModel {

    public String id;//ID列表 
    public String brand;//品牌
    public String proname;//品名
    public String label;//规格
    public int amount;//数量

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
