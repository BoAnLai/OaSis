package com.jiahong.orders.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.jiahong.item.model.ItemVO;

@Entity
@Table(name = "orders")
public class OrdersVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orders_id", insertable = true, updatable = false)
    private Integer ordersId;

    @Column(name = "orders_user_id", insertable = true, updatable = true)
    private Integer ordersUserId;

    @Column(name = "orders_user_realName", insertable = true, updatable = true)
    private String ordersUserRealName;

    @Column(name = "orders_user_cellphone", insertable = true, updatable = true)
    private String ordersUserCellphone;

    @Column(name = "orders_user_address", insertable = true, updatable = true)
    private String ordersUserAddress;

    @Column(name = "orders_datetime", insertable = false, updatable = false)
    private Timestamp ordersDatetime;

    @Column(name = "orders_total", insertable = true, updatable = true)
    private Integer ordersTotal;

    // 一個訂單可以有多個明細
    @OneToMany(mappedBy = "orders")
    private List<ItemVO> items;

    public OrdersVO() {
        super();
    }

    public OrdersVO(Integer ordersUserId, String ordersUserRealName, String ordersUserCellphone, String ordersUserAddress, Integer ordersTotal) {
        this.ordersUserId = ordersUserId;
        this.ordersUserRealName = ordersUserRealName;
        this.ordersUserCellphone = ordersUserCellphone;
        this.ordersUserAddress = ordersUserAddress;
        this.ordersTotal = ordersTotal;
    }

    public Integer getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(Integer ordersId) {
        this.ordersId = ordersId;
    }

    public Integer getOrdersUserId() {
        return ordersUserId;
    }

    public void setOrdersUserId(Integer ordersUserId) {
        this.ordersUserId = ordersUserId;
    }

    public String getOrdersUserRealName() {
        return ordersUserRealName;
    }

    public void setOrdersUserRealName(String ordersUserRealName) {
        this.ordersUserRealName = ordersUserRealName;
    }

    public String getOrdersUserCellphone() {
        return ordersUserCellphone;
    }

    public void setOrdersUserCellphone(String ordersUserCellphone) {
        this.ordersUserCellphone = ordersUserCellphone;
    }

    public String getOrdersUserAddress() {
        return ordersUserAddress;
    }

    public void setOrdersUserAddress(String ordersUserAddress) {
        this.ordersUserAddress = ordersUserAddress;
    }

    public Timestamp getOrdersDatetime() {
        return ordersDatetime;
    }

    public Integer getOrdersTotal() {
        return ordersTotal;
    }

    public void setOrdersTotal(Integer ordersTotal) {
        this.ordersTotal = ordersTotal;
    }

    public List<ItemVO> getItems() {
        return items;
    }

    public void setItems(List<ItemVO> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        String outputStr = "Orders: [";

        outputStr += "\n ordersId=" + this.getOrdersId();
        outputStr += "\n ordersUserId=" + this.getOrdersUserId();
        outputStr += "\n ordersUserRealName=" + this.getOrdersUserRealName();
        outputStr += "\n ordersUserCellphone=" + this.getOrdersUserCellphone();
        outputStr += "\n ordersUserAddress=" + this.getOrdersUserAddress();
        outputStr += "\n ordersDatetime=" + this.getOrdersDatetime();
        outputStr += "\n ordersTotal=" + this.getOrdersTotal();
        outputStr += "]\n\n";

        return outputStr;
    }
}
