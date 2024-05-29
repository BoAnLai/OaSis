package com.jiahong.item.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.jiahong.product.model.ProductVO;
import com.jiahong.orders.model.OrdersVO;

@Entity
@Table(name = "item")
public class ItemVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id", insertable = true, updatable = false)
    private Integer itemId;

    @Column(name = "item_orders_id", insertable = true, updatable = false)
    private Integer itemOrdersId;

    @Column(name = "item_game_id", insertable = true, updatable = true)
    private Integer itemGameId;

    @Column(name = "item_product_id", insertable = true, updatable = false)
    private Integer itemProductId;

    @Column(name = "item_game_name", insertable = true, updatable = true)
    private String itemGameName;

    @Column(name = "item_count", insertable = true, updatable = true)
    private Integer itemCount;

    @Column(name = "item_order_price", insertable = true, updatable = true)
    private Integer itemOrderPrice;

    @Column(name = "item_order_total", insertable = true, updatable = true)
    private Integer itemOrderTotal;

    @ManyToOne
    @JoinColumn(name = "item_orders_id", referencedColumnName = "orders_id", insertable = false, updatable = false)
    private OrdersVO orders;

    @ManyToOne
    @JoinColumn(name = "item_product_id", referencedColumnName = "product_id", insertable = false, updatable = false)
    private ProductVO product;

    public ItemVO() {
        super();
    }

    public ItemVO(Integer itemOrdersId, Integer itemGameId, Integer itemProductId, String itemGameName, Integer itemCount, Integer itemOrderPrice, Integer itemOrderTotal) {
        this.itemOrdersId = itemOrdersId;
        this.itemGameId = itemGameId;
        this.itemProductId = itemProductId;
        this.itemGameName = itemGameName;
        this.itemCount = itemCount;
        this.itemOrderPrice = itemOrderPrice;
        this.itemOrderTotal = itemOrderTotal;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getItemOrdersId() {
        return itemOrdersId;
    }

    public void setItemOrdersId(Integer itemOrdersId) {
        this.itemOrdersId = itemOrdersId;
    }

    public Integer getItemGameId() {
        return itemGameId;
    }

    public void setItemGameId(Integer itemGameId) {
        this.itemGameId = itemGameId;
    }

    public Integer getItemProductId() {
        return itemProductId;
    }

    public void setItemProductId(Integer itemProductId) {
        this.itemProductId = itemProductId;
    }

    public String getItemGameName() {
        return itemGameName;
    }

    public void setItemGameName(String itemGameName) {
        this.itemGameName = itemGameName;
    }

    public Integer getItemCount() {
        return itemCount;
    }

    public void setItemCount(Integer itemCount) {
        this.itemCount = itemCount;
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

    @Override
    public String toString() {
        String outputStr = "Item: [";

        outputStr += "\n itemId=" + this.getItemId();
        outputStr += "\n itemOrdersId=" + this.getItemOrdersId();
        outputStr += "\n itemGameId=" + this.getItemGameId();
        outputStr += "\n itemProductId=" + this.getItemProductId();
        outputStr += "\n itemGameName=" + this.getItemGameName();
        outputStr += "\n itemCount=" + this.getItemCount();
        outputStr += "\n itemOrderPrice=" + this.getItemOrderPrice();
        outputStr += "\n itemOrderTotal=" + this.getItemOrderTotal();
        outputStr += "]\n\n";

        return outputStr;
    }
}
