/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aidou.service;

import com.aidou.dao.GoodsListDAO;
import com.aidou.model.GoodsModel;
import com.aidou.model.ListModel;
import com.aidou.model.Man;
import com.aidou.model.OrderListModel;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class GoodListService {

    @Autowired
    public GoodsListDAO goodsListDAO;

    public boolean foo(String param) {
        return !(null == param && "".equals(param));
    }

    public List<GoodsModel> getGoods() {
        return goodsListDAO.getGoods();
    }

    public List<OrderListModel> OrderListService(List<OrderListModel> orderlist) {
        for (int i = 0; i < orderlist.size(); i++) {
            OrderListModel olm = new OrderListModel();
            olm = orderlist.get(i);
            if (olm.getAmount().equals("0")) {
                orderlist.remove(i);
            }
        }
        return orderlist;
    }

    public void WriteListService(List<OrderListModel> orderlist) {
        goodsListDAO.WriteListDAO(orderlist);
    }

    public Man IsAuthorityService(String authority) {
        return goodsListDAO.IsAuthority(authority);
    }

    public void AddMerchantMsgService(final String merchant_name, final String merchant_tel, final String merchant_address, final String man_telephone, final String id) {
        goodsListDAO.AddMerchantMsg(merchant_name, merchant_tel, merchant_address, man_telephone, id);
    }

    public List<ListModel> GetFuListService(String order_status) {
        String name;
        String sum;
        List<ListModel> fulist = goodsListDAO.GetFuList(order_status);
        for (int i = 0; i < fulist.size(); i++) {
            ListModel ls = fulist.get(i);
            name = goodsListDAO.GetMan(ls.getMan_telephone()).getName();
            ls.setMan_telephone(name);
            sum = String.valueOf(goodsListDAO.SumSubList(ls.getId()));
            ls.setSum(sum);
        }
        return fulist;
    }

    public List<OrderListModel> getSubDatailService(String order_id) {
        return goodsListDAO.getSubDatail(order_id);
    }

    public List<ListModel> getFubDatail(String order_id) {
        return goodsListDAO.getFubDatail(order_id);
    }

    public void DeleteOrderService(String id, String sql) {
        if (foo(sql) && foo(id)) {
            goodsListDAO.DeleteOrder(id, sql);
        }
    }

    public void UpdateOrderStatusService(String id, String sql) {
        if (foo(sql) && foo(id)) {
            goodsListDAO.UpdateOrderStatus(id, sql);
        }
    }

    public List<ListModel> GetFuListFinishedService(String order_status) {
        String name;
        String sum;
        List<ListModel> fulist = goodsListDAO.GetFuListFinished(order_status);
        for (int i = 0; i < fulist.size(); i++) {
            ListModel ls = fulist.get(i);
            name = goodsListDAO.GetMan(ls.getMan_telephone()).getName();
            ls.setMan_telephone(name);
            sum = String.valueOf(goodsListDAO.SumSubList(ls.getId()));
            ls.setSum(sum);
        }
        return fulist;
    }

    public List<GoodsModel> GoodsDetailService() {
        return goodsListDAO.GoodsDetail();
    }

}
