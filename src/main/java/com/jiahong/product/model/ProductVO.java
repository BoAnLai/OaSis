package com.jiahong.product.model;

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
@Table(name = "product")
public class ProductVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;
    
    @Column(name = "item_user_company_name", insertable = true, updatable = true)
    private String itemUserCompanyName;
    
    @Column(name = "item_game_name", insertable = true, updatable = true)
    private String itemGameName;
    
    @Column(name = "product_img", insertable = true, updatable = true)
    private String productImg;

    @Column(name = "product_name", insertable = true, updatable = true, unique = true)
    private String productName;

    // 一個產品有多個明細
    @OneToMany(mappedBy = "product")
    private List<ItemVO> items;

    public ProductVO() {
        super();
    }

    public ProductVO(String productName) {
        this.productName = productName;
    }

    public ProductVO(Integer productId, String productName, String productImg) {
        this.productId = productId;
        this.productName = productName;
        this.productImg = productImg;
    }
    
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public List<ItemVO> getItems() {
        return items;
    }

    public void setItems(List<ItemVO> items) {
        this.items = items;
    }
    
    public String getItemUserCompanyName() {
		return itemUserCompanyName;
	}

	public void setItemUserCompanyName(String itemUserCompanyName) {
		this.itemUserCompanyName = itemUserCompanyName;
	}
    
    @Override
    public String toString() {
        String outputStr = "Product: [";

        outputStr += "\n productId=" + this.getProductId();
        outputStr += "\n productName=" + this.getProductName();
        outputStr += "\n productImg=" + this.getProductImg();

        return outputStr;
    }
}
