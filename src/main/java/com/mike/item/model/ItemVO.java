package com.mike.item.model;

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
    @Column(name = "item_id", insertable = true, updatable = false)
    private Integer itemId;

    @Column(name = "item_purchase_id", insertable = true, updatable = false)
    private Integer itemPurchaseId;

    @Column(name = "item_product_id", insertable = true, updatable = false)
    private Integer itemProductId;

    @Column(name = "item_count", insertable = true, updatable = true)
    private Integer itemCount;

    @Column(name = "item_price", insertable = true, updatable = true)
    private Integer itemPrice;

    @Column(name = "item_total", insertable = true, updatable = true)
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


	@Override
    public String toString() {
        String outputStr = "Item: [";

        outputStr += "\n itemId=" + this.getItemId();
        outputStr += "\n itemPurchaseId=" + this.getItemPurchaseId();
        outputStr += "\n itemProductId=" + this.getItemProductId();
        outputStr += "\n itemCount=" + this.getItemCount();
        outputStr += "\n itemPrice=" + this.getItemPrice();
        outputStr += "\n itemTotal=" + this.getItemTotal();
        outputStr += "]\n\n";

        return outputStr;
    }


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
}
