/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aidou.web;

import com.aidou.model.GoodsModel;
import com.aidou.model.Man;
import com.aidou.model.OrderListModel;
import com.aidou.service.GoodListService;
import com.aidou.tool.CurrentTime;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/wechat")
@SessionAttributes("list")
public class HomeController implements Serializable {

    @Autowired
    GoodListService goodListService;
//所有物品列表

    @RequestMapping(value = "order.do")
    public String Order(Model model) {
        List<GoodsModel> aidou = new ArrayList<>();
        List<GoodsModel> zhaodajie = new ArrayList<>();
        List<GoodsModel> other = new ArrayList<>();
        GoodsModel gm = new GoodsModel();
        List<GoodsModel> ls = goodListService.getGoods();
        for (int i = 0; i < ls.size(); i++) {
            gm = ls.get(i);
            if (gm.getBrand().equals("艾豆")) {
                aidou.add(gm);
            } else if (gm.getBrand().equals("赵大姐")) {
                zhaodajie.add(gm);
            } else if (gm.getBrand().equals("其他")) {
                other.add(gm);
            }
        }
        model.addAttribute("aidou", aidou);
        model.addAttribute("zhaodajie", zhaodajie);
        model.addAttribute("other", other);
        return "/wechat/order";
    }

//显示选择订单
    @RequestMapping(value = "orderlist.do")
    public String OrderList(HttpServletRequest request, Model model) {
        List<GoodsModel> ls = goodListService.getGoods();
        List<OrderListModel> olm = new ArrayList<>();
        CurrentTime current = new CurrentTime();
        String Order_id = current.CurrentTime();
        for (int i = 0; i < ls.size(); i++) {
            OrderListModel OLM = new OrderListModel();
            GoodsModel gm = new GoodsModel();
            gm = ls.get(i);
            OLM.setBrand(gm.getBrand());
            OLM.setProname(gm.getProname());
            OLM.setLabel(gm.getLabel());
            OLM.setAmount(request.getParameter(gm.getId()));
            OLM.setStore_status("X");
            OLM.setOrder_id(Order_id);
            OLM.setOrder_status("已下单");
            if (request.getParameter(gm.getId()) == "") {
            } else {
                olm.add(OLM);
            }
        }
        List<OrderListModel> list = new ArrayList<OrderListModel>();
        list = goodListService.OrderListService(olm);

        model.addAttribute("list", list);
        return "/wechat/orderlist";
    }

//提交订单写进数据库
    @RequestMapping(value = "writelist.do", method = RequestMethod.POST)
    public String Writelist(HttpServletRequest request) {
        HttpSession session = request.getSession();
        try {
            List<OrderListModel> lastlist = (List<OrderListModel>) session.getAttribute("list");
            Man author = goodListService.IsAuthorityService(request.getParameter("authority"));
            if (author != null) {
                if (author.getType().equals("业务人员")) {
                    if (lastlist.size() > 0) {
                        goodListService.WriteListService(lastlist);
                        goodListService.AddMerchantMsgService(request.getParameter("merchant_name"), request.getParameter("merchant_tel"), request.getParameter("merchant_address"), author.getTelephone(), lastlist.get(0).getOrder_id());
                        return "/wechat/success";
                    } else {
                        return "/wechat/error";
                    }
                }
            }
        } catch (Exception e) {
            return "/wechat/error";
        }
        return "/wechat/success";
    }

    @RequestMapping(value = "unfinished.do")
    public String Unfinished(Model model) {
        model.addAttribute("unfinished", goodListService.GetFuListService("订单完成"));
        return "/wechat/unfinished";
    }

    @RequestMapping(value = "detail.do", method = RequestMethod.GET)
    public String Detail(@RequestParam("id") String id, @RequestParam("name") String name, Model model) {
        model.addAttribute("name", name);
        model.addAttribute("id", id);
        model.addAttribute("order_status", goodListService.getFubDatail(id).get(0).getOrder_status());
        model.addAttribute("subDatail", goodListService.getSubDatailService(id));
        model.addAttribute("fubDatail", goodListService.getFubDatail(id));
        return "/wechat/detail";
    }

    @RequestMapping(value = "confirmForm.do", method = RequestMethod.POST)
    public String ConfirmForm(HttpServletRequest request, Model model) {
        String ordermsg = request.getParameter("order_msg");
        String author = request.getParameter("author");
        String orderid = request.getParameter("order_id");
        Man au = goodListService.IsAuthorityService(author);
        if (au.getType().equals("管理人员")) {
            if (ordermsg.equals("订单有误")) {
                try {
                    String sql1 = "DELETE FROM fu_order WHERE id=?";
                    goodListService.DeleteOrderService(orderid, sql1);
                } catch (Exception e) {
                    System.out.println("异常1");
                }
            } else if (ordermsg.equals("订单无误")) {
                try {
                    String sql2 = "UPDATE fu_order SET order_status = '已确认' WHERE id = ?";
                    goodListService.UpdateOrderStatusService(orderid, sql2);
                } catch (Exception e) {
                    System.out.println("异常2");
                }
            }
            return "/wechat/test";
        } else {
            return "/wechat/error";
        }
    }

    @RequestMapping(value = "production_completedForm.do", method = RequestMethod.POST)
    public String Production_completedForm(HttpServletRequest request, Model model) {
        String author = request.getParameter("author");
        String orderid = request.getParameter("order_id");
        String orderstatus = request.getParameter("order_status");
        Man au = goodListService.IsAuthorityService(author);
        if (orderstatus.equals("已确认")) {
            if (au.getType().equals("生产人员")) {
                try {
                    String sql2 = "UPDATE fu_order SET order_status = '生产完毕' WHERE id = ?";
                    goodListService.UpdateOrderStatusService(orderid, sql2);
                } catch (Exception e) {
                    System.out.println("异常2");
                }
                return "/wechat/test";
            } else {
                return "/wechat/error";
            }
        } else {
            return "/wechat/error";
        }
    }

    @RequestMapping(value = "changeForm.do", method = RequestMethod.POST)
    public String ChangeForm(HttpServletRequest request, Model model) {
        String ordermsg = request.getParameter("order_msg");
        String author = request.getParameter("author");
        String orderid = request.getParameter("order_id");
        Man au = goodListService.IsAuthorityService(author);
        if (au.getType().equals("管理人员")) {
            if (ordermsg.equals("订单有误")) {
                try {
                    String sql1 = "DELETE FROM fu_order WHERE id=?";
                    goodListService.DeleteOrderService(orderid, sql1);
                } catch (Exception e) {
                    System.out.println("异常1");
                    return "/wechat/error";
                }
            }
            return "/wechat/test";
        } else {
            return "/wechat/error";
        }
    }

    @RequestMapping(value = "sendForm.do", method = RequestMethod.POST)
    public String SendForm(HttpServletRequest request, Model model) {
        String author = request.getParameter("author");
        String orderid = request.getParameter("order_id");
        String freight_type = request.getParameter("freight_type");
        String reach_time = request.getParameter("reach_time");
        String order_status = request.getParameter("order_status");
        Man au = goodListService.IsAuthorityService(author);
        if (order_status.equals("生产完毕")) {
            if (au.getType().equals("物流人员")) {
                try {
                    String sql2 = "UPDATE fu_order SET order_status = '订单发货' WHERE id = ?";
                    String sql3 = "UPDATE fu_order SET freight_type = '" + freight_type + "' WHERE id = ?";
                    String sql4 = "UPDATE fu_order SET reach_time = '" + reach_time + "' WHERE id = ?";
                    goodListService.UpdateOrderStatusService(orderid, sql2);
                    goodListService.UpdateOrderStatusService(orderid, sql3);
                    goodListService.UpdateOrderStatusService(orderid, sql4);
                } catch (Exception e) {
                    System.out.println("异常2");
                }
                return "/wechat/test";
            } else {
                return "/wechat/error";
            }
        } else {
            return "/wechat/error";
        }
    }

    @RequestMapping(value = "order_completedForm.do", method = RequestMethod.POST)
    public String Order_completedForm(HttpServletRequest request, Model model) {
        String author = request.getParameter("author");
        String orderid = request.getParameter("order_id");
        String orderstatus = request.getParameter("order_status");
        Man au = goodListService.IsAuthorityService(author);
        if (orderstatus.equals("订单发货")) {
            if (au.getType().equals("业务人员")) {
                try {
                    String sql2 = "UPDATE fu_order SET order_status = '订单完成' WHERE id = ?";
                    goodListService.UpdateOrderStatusService(orderid, sql2);
                } catch (Exception e) {
                    System.out.println("异常2");
                }
                return "/wechat/test";
            } else {
                return "/wechat/error";
            }
        } else {
            return "/wechat/error";
        }
    }

    
    //已完成
    @RequestMapping(value = "finished.do")
    public String Finished(Model model) {
        model.addAttribute("finished", goodListService.GetFuListFinishedService("订单完成"));
        return "/wechat/finished";
    }
    //库存情况
    @RequestMapping(value = "inventory.do")
    public String Inventory(Model model){
        model.addAttribute("inventory", goodListService.GoodsDetailService());
        return "/wechat/inventory";
    }
    @RequestMapping(value = "test.do")
    public String Test(HttpServletRequest request, Model model) {
        model.addAttribute("key", "uuukey");
        return "/wechat/test";
    }

}
