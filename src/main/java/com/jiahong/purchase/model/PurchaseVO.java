package com.jiahong.purchase.model;

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
@Table(name = "purchase")
public class PurchaseVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "purchase_id")
    private Integer purchaseId;

    @Column(name = "purchase_user_id", nullable = false)
    private Integer purchaseUserId;

    @Column(name = "purchase_user_realName", nullable = false)
    private String purchaseUserRealName;

    @Column(name = "purchase_user_cellphone", nullable = false)
    private String purchaseUserCellphone;

    @Column(name = "purchase_user_address", nullable = false)
    private String purchaseUserAddress;

    @Column(name = "purchase_timestamp", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP")
    private Timestamp purchaseTimestamp;

    @Column(name = "purchase_total", nullable = false)
    private Integer purchaseTotal;

    @OneToMany(mappedBy = "purchase")
    private List<ItemVO> items;

    public PurchaseVO() {
        super();
    }

    // Getters and Setters

    public Integer getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Integer purchaseId) {
        this.purchaseId = purchaseId;
    }

    public Integer getPurchaseUserId() {
        return purchaseUserId;
    }

    public void setPurchaseUserId(Integer purchaseUserId) {
        this.purchaseUserId = purchaseUserId;
    }

    public String getPurchaseUserRealName() {
        return purchaseUserRealName;
    }

    public void setPurchaseUserRealName(String purchaseUserRealName) {
        this.purchaseUserRealName = purchaseUserRealName;
    }

    public String getPurchaseUserCellphone() {
        return purchaseUserCellphone;
    }

    public void setPurchaseUserCellphone(String purchaseUserCellphone) {
        this.purchaseUserCellphone = purchaseUserCellphone;
    }

    public String getPurchaseUserAddress() {
        return purchaseUserAddress;
    }

    public void setPurchaseUserAddress(String purchaseUserAddress) {
        this.purchaseUserAddress = purchaseUserAddress;
    }

    public Timestamp getPurchaseTimestamp() {
        return purchaseTimestamp;
    }

    public Integer getPurchaseTotal() {
        return purchaseTotal;
    }

    public void setPurchaseTotal(Integer purchaseTotal) {
        this.purchaseTotal = purchaseTotal;
    }

    public List<ItemVO> getItems() {
        return items;
    }

    public void setItems(List<ItemVO> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "PurchaseVO{" +
                "purchaseId=" + purchaseId +
                ", purchaseUserId=" + purchaseUserId +
                ", purchaseUserRealName='" + purchaseUserRealName + '\'' +
                ", purchaseUserCellphone='" + purchaseUserCellphone + '\'' +
                ", purchaseUserAddress='" + purchaseUserAddress + '\'' +
                ", purchaseTimestamp=" + purchaseTimestamp +
                ", purchaseTotal=" + purchaseTotal +
                '}';
    }
}
