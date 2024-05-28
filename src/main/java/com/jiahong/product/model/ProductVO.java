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

import com.mike.label.model.LabelVO;

@Entity
@Table(name = "product")
public class ProductVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "product_name", insertable = true, updatable = true, unique = true)
    private String productName;

    @Column(name = "product_img", insertable = true, updatable = true)
    private String productImg;

    @Column(name = "product_created_timestamp")
    private Timestamp productCreatedTimestamp;

    // 一個產品有多個明細
    @OneToMany(mappedBy = "product")
    private List<ordersVO> items;

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

    public Timestamp getProductCreatedTimestamp() {
        return productCreatedTimestamp;
    }

    public void setProductCreatedTimestamp(Timestamp productCreatedTimestamp) {
        this.productCreatedTimestamp = productCreatedTimestamp;
    }

    public List<ordersVO> getItems() {
        return items;
    }

    public void setItems(List<ordersVO> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        String outputStr = "Product: [";

        outputStr += "\n productId=" + this.getProductId();
        outputStr += "\n productName=" + this.getProductName();
        outputStr += "\n productImg=" + this.getProductImg();
        outputStr += "\n productCreatedTimestamp=" + this.getProductCreatedTimestamp();
        outputStr += "]\n\n";

        return outputStr;
    }
}
