package com.jiahong.item.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.sql.Timestamp;

import com.jiahong.product.model.ProductVO;
import com.jiahong.orders.model.OrdersVO;

@Entity
@Table(name = "item")
public class ItemVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id", insertable = true, updatable = false)
    private Integer itemId;
    
    @ManyToOne
    @JoinColumn(name = "item_orders_id", referencedColumnName = "orders_id")
    private OrdersVO orders;
    
    @ManyToOne
    @JoinColumn(name = "item_product_id", referencedColumnName = "product_id")
    private ProductVO product;

    @Column(name = "item_user_company_name", insertable = true, updatable = true)
    private String itemUserCompanyName;
    
    @Column(name = "item_game_name", insertable = true, updatable = true)
    private String itemGameName;
    
    @Column(name = "item_product_img", insertable = true, updatable = true)
    private String itemProductImg;
    
    @Column(name = "item_order_datetime")
    private Timestamp itemOrderDatetime;

    @Column(name = "item_order_price", insertable = true, updatable = true)
    private Integer itemOrderPrice;

    @Column(name = "item_order_total", insertable = true, updatable = true)
    private Integer itemOrderTotal;

    
    public ItemVO() {
        super();
    }

    public ItemVO(String itemUserCompanyName, String itemGameName, String itemProductImg, Integer itemOrderPrice, Integer itemOrderTotal) {
        this.itemUserCompanyName = itemUserCompanyName;
        this.itemGameName = itemGameName;
        this.itemProductImg = itemProductImg;
        this.itemOrderPrice = itemOrderPrice;
        this.itemOrderTotal = itemOrderTotal;
    }

    public ItemVO(Integer itemId, String itemUserCompanyName, String itemGameName, String itemProductImg, Integer itemOrderPrice, Integer itemOrderTotal) {
        this.itemId = itemId;
        this.itemUserCompanyName = itemUserCompanyName;
        this.itemGameName = itemGameName;
        this.itemProductImg = itemProductImg;
        this.itemOrderPrice = itemOrderPrice;
        this.itemOrderTotal = itemOrderTotal;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public OrdersVO getOrders() {
        return orders;
    }

    public void setOrders(OrdersVO orders) {
        this.orders = orders;
    }

    public ProductVO getProduct() {
        return product;
    }

    public void setProduct(ProductVO product) {
        this.product = product;
    }

    public String getItemUserCompanyName() {
        return itemUserCompanyName;
    }

    public void setItemUserCompanyName(String itemUserCompanyName) {
        this.itemUserCompanyName = itemUserCompanyName;
    }

    public String getItemGameName() {
        return itemGameName;
    }

    public void setItemGameName(String itemGameName) {
        this.itemGameName = itemGameName;
    }

    public String getItemProductImg() {
        return itemProductImg;
    }

    public void setItemProductImg(String itemProductImg) {
        this.itemProductImg = itemProductImg;
    }

    public Timestamp getItemOrderDatetime() {
        return itemOrderDatetime;
    }

    public void setItemOrderDatetime(Timestamp itemOrderDatetime) {
        this.itemOrderDatetime = itemOrderDatetime;
    }

    public Integer getItemOrderPrice() {
        return itemOrderPrice;
    }

    public void setItemOrderPrice(Integer itemOrderPrice) {
        this.itemOrderPrice = itemOrderPrice;
    }

    public Integer getItemOrderTotal() {
        return itemOrderTotal;
    }

    public void setItemOrderTotal(Integer itemOrderTotal) {
        this.itemOrderTotal = itemOrderTotal;
    }

    @Override
    public String toString() {
        String outputStr = "Item: [";

        outputStr += "\n itemId=" + this.getItemId();
        outputStr += "\n itemUserCompanyName=" + this.getItemUserCompanyName();
        outputStr += "\n itemGameName=" + this.getItemGameName();
        outputStr += "\n itemProductImg=" + this.getItemProductImg();
        outputStr += "\n itemOrderDatetime=" + this.getItemOrderDatetime();
        outputStr += "\n itemOrderPrice=" + this.getItemOrderPrice();
        outputStr += "\n itemOrderTotal=" + this.getItemOrderTotal();
        outputStr += "]\n\n";

        return outputStr;
    }
}
