package com.jiahong.purchase.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import com.jiahong.product.model.ProductVO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;

@Entity
@Table(name = "purchase")
public class PurchaseVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "purchase_id", insertable = true, updatable = false)
    private Integer purchaseId;

    @Column(name = "purchase_product_id", insertable = true, updatable = true)
    private Integer purchaseProductId;

    @Column(name = "purchase_user_id", insertable = true, updatable = true)
    private Integer purchaseUserId;

    @Column(name = "purchase_user_realName", insertable = true, updatable = true)
    private String purchaseUserRealName;

    @Column(name = "purchase_user_cellphone", insertable = true, updatable = true)
    private String purchaseUserCellphone;

    @Column(name = "purchase_user_address", insertable = true, updatable = true)
    private String purchaseUserAddress;

    @Column(name = "purchase_timestamp", insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP")
    @Generated(GenerationTime.ALWAYS)
    private Timestamp purchaseTimestamp;

    @Column(name = "purchase_closed", insertable = true, updatable = true)
    private Boolean purchaseClosed;
        
    public PurchaseVO() {
        super();
    }
    
    public PurchaseVO(Integer userId) {
        UserService userSvc = new UserService();
        UserVO user = userSvc.getByUserId(userId);
        
        setPurchaseUserId(userId);
        setPurchaseUserRealName(user.getUserRealName());
        setPurchaseUserCellphone(user.getUserCellphone());
        setPurchaseUserAddress(user.getUserAddress());
        setPurchaseClosed(false);
    }

    public Integer getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Integer purchaseId) {
        this.purchaseId = purchaseId;
    }

    public Integer getPurchaseProductId() {
        return purchaseProductId;
    }

    public void setPurchaseProductId(Integer purchaseProductId) {
        this.purchaseProductId = purchaseProductId;
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
    
    public void setPurchaseTimestamp(Timestamp purchaseTimestamp) {
        this.purchaseTimestamp = purchaseTimestamp;
    }

    public Boolean getPurchaseClosed() {
        return purchaseClosed;
    }

    public void setPurchaseClosed(Boolean purchaseClosed) {
        this.purchaseClosed = purchaseClosed;
    }
    

    
    @Override
    public String toString() {
        String outputStr = "Purchase: [";
        outputStr += "\n purchaseId=" + this.getPurchaseId();
        outputStr += "\n purchaseProductId=" + this.getPurchaseProductId();
        outputStr += "\n purchaseUserId=" + this.getPurchaseUserId();
        outputStr += "\n purchaseUserRealName=" + this.getPurchaseUserRealName();
        outputStr += "\n purchaseUserCellphone=" + this.getPurchaseUserCellphone();
        outputStr += "\n purchaseUserAddress=" + this.getPurchaseUserAddress();
        outputStr += "\n purchaseTimestamp=" + this.getPurchaseTimestamp();
        outputStr += "\n purchaseClosed=" + this.getPurchaseClosed();
        outputStr += "]\n\n";
        return outputStr;
    }
}
