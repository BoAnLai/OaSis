package com.jiahong.product.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.mike.item.model.ItemVO;

@Entity
@Table(name = "product")
public class ProductVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "product_user_id", insertable = true, updatable = true, nullable = false)
    private Integer productUserId;

    @Column(name = "product_user_company_name", insertable = true, updatable = true, nullable = false)
    private String productUserCompanyName;

    @Column(name = "product_game_name", insertable = true, updatable = true, nullable = false)
    private String productGameName;

    @Column(name = "product_img", insertable = true, updatable = true)
    private String productImg;

    @Column(name = "product_name", insertable = true, updatable = true, unique = true)
    private String productName;

    @Column(name = "product_description", insertable = true, updatable = true)
    private String productDescription;

    @Column(name = "product_price", insertable = true, updatable = true, nullable = false)
    private Integer productPrice;

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

    public Integer getProductUserId() {
        return productUserId;
    }

    public void setProductUserId(Integer productUserId) {
        this.productUserId = productUserId;
    }

    public String getProductUserCompanyName() {
        return productUserCompanyName;
    }

    public void setProductUserCompanyName(String productUserCompanyName) {
        this.productUserCompanyName = productUserCompanyName;
    }

    public String getProductGameName() {
        return productGameName;
    }

    public void setProductGameName(String productGameName) {
        this.productGameName = productGameName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public List<ItemVO> getItems() {
        return items;
    }

    public void setItems(List<ItemVO> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        String outputStr = "Product: [";

        outputStr += "\n productId=" + this.getProductId();
        outputStr += "\n productUserId=" + this.getProductUserId();
        outputStr += "\n productUserCompanyName=" + this.getProductUserCompanyName();
        outputStr += "\n productGameName=" + this.getProductGameName();
        outputStr += "\n productImg=" + this.getProductImg();
        outputStr += "\n productName=" + this.getProductName();
        outputStr += "\n productDescription=" + this.getProductDescription();
        outputStr += "\n productPrice=" + this.getProductPrice();
        outputStr += "]\n\n";

        return outputStr;
    }
}
