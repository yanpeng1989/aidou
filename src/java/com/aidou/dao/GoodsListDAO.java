/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aidou.dao;

import com.aidou.model.GoodsModel;
import com.aidou.model.ListModel;
import com.aidou.model.Man;
import com.aidou.model.OrderListModel;
import com.aidou.tool.CurrentTime;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class GoodsListDAO {

    @Autowired
    public JdbcTemplate jdbcTemplate;

    CurrentTime currenttime = new CurrentTime();
    String currenttime2 = currenttime.CurrentTime2();

//获取物品列表清单
    public List<GoodsModel> getGoods() {
        String SQL = "select id,brand,proname,label from goods";
        List<GoodsModel> goods = new ArrayList<GoodsModel>();
        List rows = jdbcTemplate.queryForList(SQL);
        for (int i = 0; i < rows.size(); i++) {
            Map map = (Map) rows.get(i);
            GoodsModel GM = new GoodsModel();
            GM.setId((String) map.get("id").toString());
            GM.setBrand((String) map.get("brand"));
            GM.setProname((String) map.get("proname"));
            GM.setLabel((String) map.get("label"));
            goods.add(GM);
        }
        return goods;
    }

//选择物品写入子清单列表
    public void WriteListDAO(final List<OrderListModel> orderlist) {
        if (orderlist.size() > 0) {
            for (int i = 0; i < orderlist.size(); i++) {
                final OrderListModel olm = orderlist.get(i);
                jdbcTemplate.update("insert into sub_order(brand,proname,label,amount,store_status,order_id,order_status) values(?,?,?,?,?,?,?)",
                        new PreparedStatementSetter() {
                            @Override
                            public void setValues(PreparedStatement ps) throws SQLException {
                                ps.setString(1, olm.getBrand());
                                ps.setString(2, olm.getProname());
                                ps.setString(3, olm.getLabel());
                                ps.setString(4, olm.getAmount());
                                ps.setString(5, olm.getStore_status());
                                ps.setString(6, olm.getOrder_id());
                                ps.setString(7, olm.getOrder_status());
                            }
                        });
            }
            jdbcTemplate.update("insert into fu_order(id,order_status,order_time,update_time) values(?,?,?,?)",
                    new PreparedStatementSetter() {
                        @Override
                        public void setValues(PreparedStatement ps) throws SQLException {
                            ps.setString(1, orderlist.get(0).getOrder_id());
                            ps.setString(2, orderlist.get(0).getOrder_status());
                            ps.setString(3, currenttime2);
                            ps.setString(4, currenttime2);
                        }
                    });
        }
    }

//查询授权
    public Man IsAuthority(String authority) {
        final Man user = new Man();
        try {
            jdbcTemplate.query("select name,telephone,type,authority from man where authority=?", new Object[]{authority},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            user.setName(rs.getString("name"));
                            user.setTelephone(rs.getString("telephone"));
                            user.setType(rs.getString("type"));
                            user.setAuthority(rs.getString("authority"));
                        }
                    });
            return user;
        } catch (Exception e) {
            return null;
        }
    }

//更新父清单订购商信息
    public void AddMerchantMsg(final String merchant_name, final String merchant_tel, final String merchant_address, final String man_telephone, final String id) {
        try {
            jdbcTemplate.update("UPDATE fu_order SET merchant_name = ? ,merchant_tel = ?,merchant_address = ?,man_telephone = ?,update_time=? WHERE id = ?", new Object[]{merchant_name, merchant_tel, merchant_address, man_telephone, currenttime2, id});
        } catch (Exception e) {
        }
    }

//获取父清单列表
//id;merchant_id;merchant_name;merchant_tel;merchant_address;freight_type;reach_time; order_status; man_telephone;
    public List<ListModel> GetFuList(String order_status, String man_telephone) {
        final Man user = new Man();
        try {
            jdbcTemplate.query("select name,telephone,type,authority from man where telephone=?", new Object[]{man_telephone},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            user.setName(rs.getString("name"));
                            user.setTelephone(rs.getString("telephone"));
                            user.setType(rs.getString("type"));
                            user.setAuthority(rs.getString("authority"));
                        }
                    });
        } catch (Exception e) {

        }
        final List<ListModel> fulist = new ArrayList<ListModel>();
        if (user.getType().equals("业务人员")) {
            try {
                jdbcTemplate.query("select id,merchant_id,merchant_name,merchant_tel,merchant_address,freight_type,reach_time, order_status, man_telephone from fu_order where order_status <>? and man_telephone=?", new Object[]{order_status, man_telephone},
                        new RowCallbackHandler() {
                            @Override
                            public void processRow(ResultSet rs) throws SQLException {
                                ListModel lm = new ListModel();
                                lm.setId(rs.getString("id"));
                                lm.setMerchant_id(rs.getString("merchant_id"));
                                lm.setMerchant_name(rs.getString("merchant_name"));
                                lm.setMerchant_tel(rs.getString("merchant_tel"));
                                lm.setMerchant_address(rs.getString("merchant_address"));
                                lm.setFreight_type(rs.getString("freight_type"));
                                lm.setReach_time(rs.getString("reach_time"));
                                lm.setOrder_status(rs.getString("order_status"));
                                lm.setMan_telephone(rs.getString("man_telephone"));
                                fulist.add(lm);
                            }
                        });
                return fulist;
            } catch (Exception e) {
                return null;
            }
        } else {
            try {
                jdbcTemplate.query("select id,merchant_id,merchant_name,merchant_tel,merchant_address,freight_type,reach_time, order_status, man_telephone from fu_order where order_status <>?", new Object[]{order_status},
                        new RowCallbackHandler() {
                            @Override
                            public void processRow(ResultSet rs) throws SQLException {
                                ListModel lm = new ListModel();
                                lm.setId(rs.getString("id"));
                                lm.setMerchant_id(rs.getString("merchant_id"));
                                lm.setMerchant_name(rs.getString("merchant_name"));
                                lm.setMerchant_tel(rs.getString("merchant_tel"));
                                lm.setMerchant_address(rs.getString("merchant_address"));
                                lm.setFreight_type(rs.getString("freight_type"));
                                lm.setReach_time(rs.getString("reach_time"));
                                lm.setOrder_status(rs.getString("order_status"));
                                lm.setMan_telephone(rs.getString("man_telephone"));
                                fulist.add(lm);
                            }
                        });
                return fulist;
            } catch (Exception e) {
                return null;
            }
        }
    }

    //查询授权
    public Man GetMan(String telephone) {
        final Man user = new Man();
        try {
            jdbcTemplate.query("select name,telephone,type,authority from man where telephone=?", new Object[]{telephone},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            user.setName(rs.getString("name"));
                            user.setTelephone(rs.getString("telephone"));
                            user.setType(rs.getString("type"));
                            user.setAuthority(rs.getString("authority"));
                        }
                    });
            return user;
        } catch (Exception e) {
            return null;
        }
    }

    //查询订单物品数量
    public int SumSubList(String fuorder_id) {
        try {
            String sql = "SELECT SUM(amount) FROM sub_order WHERE order_id=?";
            int sum = jdbcTemplate.queryForObject(sql, new Object[]{fuorder_id}, Integer.class);
            return sum;
        } catch (Exception e) {
            return 0;
        }
    }

//获取子订单ID为？的订单数据    
//brand,proname,label,amount,store_status,order_id,order_status,
    public List<OrderListModel> getSubDatail(String order_id) {
        final List<OrderListModel> lsd = new ArrayList<OrderListModel>();
        try {
            jdbcTemplate.query("select brand,proname,label,amount from sub_order where order_id =?", new Object[]{order_id},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            OrderListModel lm = new OrderListModel();
                            lm.setBrand(rs.getString("brand"));
                            lm.setProname(rs.getString("proname"));
                            lm.setLabel(rs.getString("label"));
                            lm.setAmount(rs.getString("amount"));
                            lsd.add(lm);
                        }
                    });
            return lsd;
        } catch (Exception e) {
            return null;
        }
    }

    //获取父订单ID为？的订单数据   
    public List<ListModel> getFubDatail(String order_id) {

        final List<ListModel> fulist = new ArrayList<ListModel>();
        try {
            jdbcTemplate.query("select merchant_name,merchant_tel,merchant_address,freight_type,freight_number,reach_time, order_status, man_telephone,order_time,update_time,production_predict_time from fu_order where id =?", new Object[]{order_id},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            ListModel lm = new ListModel();
                            lm.setMerchant_name(rs.getString("merchant_name"));
                            lm.setMerchant_tel(rs.getString("merchant_tel"));
                            lm.setMerchant_address(rs.getString("merchant_address"));
                            lm.setFreight_type(rs.getString("freight_type"));
                            lm.setFreight_number(rs.getString("freight_number"));
                            lm.setReach_time(rs.getString("reach_time"));
                            lm.setOrder_status(rs.getString("order_status"));
                            lm.setMan_telephone(rs.getString("man_telephone"));
                            lm.setOrder_time(rs.getString("order_time"));
                            lm.setUpdate_time(rs.getString("update_time"));
                            lm.setProduction_predict_time(rs.getString("production_predict_time"));
                            fulist.add(lm);
                        }
                    });
            return fulist;
        } catch (Exception e) {
            return null;
        }
    }

    //删除ID为？的订单
    public void DeleteOrder(String id, String sql) {
        try {
            jdbcTemplate.update(sql, new Object[]{id});
        } catch (Exception e) {
            System.out.println("删除失败");
        }
    }

    //更新Order状态
    public void UpdateOrderStatus(String id, String sql) {
        try {
            jdbcTemplate.update(sql, new Object[]{currenttime2, id});
        } catch (Exception e) {
            System.out.println("更新失败");
        }
    }

    public List<ListModel> GetFuListFinished(String order_status, String man_telephone) {
        final List<ListModel> fulist = new ArrayList<ListModel>();
        try {
            jdbcTemplate.query("select id,merchant_id,merchant_name,merchant_tel,merchant_address,freight_type,reach_time, order_status, man_telephone from fu_order where order_status =? and man_telephone=? limit 100", new Object[]{order_status, man_telephone},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            ListModel lm = new ListModel();
                            lm.setId(rs.getString("id"));
                            lm.setMerchant_id(rs.getString("merchant_id"));
                            lm.setMerchant_name(rs.getString("merchant_name"));
                            lm.setMerchant_tel(rs.getString("merchant_tel"));
                            lm.setMerchant_address(rs.getString("merchant_address"));
                            lm.setFreight_type(rs.getString("freight_type"));
                            lm.setReach_time(rs.getString("reach_time"));
                            lm.setOrder_status(rs.getString("order_status"));
                            lm.setMan_telephone(rs.getString("man_telephone"));
                            fulist.add(lm);
                        }
                    });
            return fulist;
        } catch (Exception e) {
            return null;
        }
    }

    //获取物品库存列表清单id,brand proname label amount
    public List<GoodsModel> GoodsDetail(String brand) {
        String SQL = "select id,brand,proname,label,amount from goods where brand=?";
        final List<GoodsModel> goods = new ArrayList<GoodsModel>();
        final List<ListModel> fulist = new ArrayList<ListModel>();
        try {
            jdbcTemplate.query(SQL, new Object[]{brand},
                    new RowCallbackHandler() {
                        @Override
                        public void processRow(ResultSet rs) throws SQLException {
                            GoodsModel lm = new GoodsModel();
                            lm.setId(rs.getString("id"));
                            lm.setBrand(rs.getString("brand"));
                            lm.setProname(rs.getString("proname"));
                            lm.setLabel(rs.getString("label"));
                            lm.setAmount(rs.getInt("amount"));
                            goods.add(lm);
                        }
                    });
            return goods;
        } catch (Exception e) {
            return null;
        }
    }

    //验证用户登录信息
    public boolean Login_Msg(String telephone, String author) {
        String sql = "SELECT SUM(id) FROM man WHERE telephone=? AND authority=?";
        try {
            int sum = jdbcTemplate.queryForObject(sql, new Object[]{telephone, author}, Integer.class);
            if (sum > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

}
