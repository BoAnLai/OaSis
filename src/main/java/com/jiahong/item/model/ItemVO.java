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
import com.mike.purchase.model.PurchaseVO;

@Entity
@Table(name = "item")
public class ItemVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id")
    private Integer itemId;

    @Column(name = "item_purchase_id", nullable = false)
    private Integer itemPurchaseId;

    @Column(name = "item_product_id", nullable = false)
    private Integer itemProductId;

    @Column(name = "item_count", nullable = false)
    private Integer itemCount;

    @Column(name = "item_price", nullable = false)
    private Integer itemPrice;

    @Column(name = "item_total", nullable = false)
    private Integer itemTotal;

    @ManyToOne
    @JoinColumn(name = "item_purchase_id", referencedColumnName = "purchase_id", insertable = false, updatable = false)
    private PurchaseVO purchase;

    @ManyToOne
    @JoinColumn(name = "item_product_id", referencedColumnName = "product_id", insertable = false, updatable = false)
    private ProductVO product;

    public ItemVO() {
        super();
    }

    // Getters and Setters

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getItemPurchaseId() {
        return itemPurchaseId;
    }

    public void setItemPurchaseId(Integer itemPurchaseId) {
        this.itemPurchaseId = itemPurchaseId;
    }

    public Integer getItemProductId() {
        return itemProductId;
    }

    public void setItemProductId(Integer itemProductId) {
        this.itemProductId = itemProductId;
    }

    public Integer getItemCount() {
        return itemCount;
    }

    public void setItemCount(Integer itemCount) {
        this.itemCount = itemCount;
    }

    public Integer getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(Integer itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Integer getItemTotal() {
        return itemTotal;
    }

    public void setItemTotal(Integer itemTotal) {
        this.itemTotal = itemTotal;
    }

    public PurchaseVO getPurchase() {
        return purchase;
    }

    public void setPurchase(PurchaseVO purchase) {
        this.purchase = purchase;
    }

    public ProductVO getProduct() {
        return product;
    }

    public void setProduct(ProductVO product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ItemVO{" +
                "itemId=" + itemId +
                ", itemPurchaseId=" + itemPurchaseId +
                ", itemProductId=" + itemProductId +
                ", itemCount=" + itemCount +
                ", itemPrice=" + itemPrice +
                ", itemTotal=" + itemTotal +
                '}';
    }
}
