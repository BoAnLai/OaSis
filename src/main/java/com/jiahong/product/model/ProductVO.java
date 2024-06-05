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

    @Column(name = "product_user_id", nullable = false)
    private Integer productUserId;

    @Column(name = "product_user_company_name", nullable = false)
    private String productUserCompanyName;

    @Column(name = "product_game_id", nullable = false)
    private Integer productGameId;

    @Column(name = "product_game_name", nullable = false)
    private String productGameName;

    @Column(name = "product_img")
    private String productImg;

    @Column(name = "product_name", unique = true)
    private String productName;

    @Column(name = "product_description")
    private String productDescription;

    @Column(name = "product_price", nullable = false)
    private Integer productPrice;

    @OneToMany(mappedBy = "product")
    private List<ItemVO> items;

    public ProductVO() {
        super();
    }

    // Getters and Setters

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

    public Integer getProductGameId() {
        return productGameId;
    }

    public void setProductGameId(Integer productGameId) {
        this.productGameId = productGameId;
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
        return "ProductVO{" +
                "productId=" + productId +
                ", productUserId=" + productUserId +
                ", productUserCompanyName='" + productUserCompanyName + '\'' +
                ", productGameId=" + productGameId +
                ", productGameName='" + productGameName + '\'' +
                ", productImg='" + productImg + '\'' +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", productPrice=" + productPrice +
                '}';
    }
}