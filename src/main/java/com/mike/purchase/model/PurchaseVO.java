package com.mike.purchase.model;

import java.sql.Timestamp;
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

import com.mike.item.model.ItemVO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;

@Entity
@Table(name = "purchase")
public class PurchaseVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "purchase_id", insertable = true, updatable = false)
    private Integer purchaseId;

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

    @Column(name = "purchase_total", insertable = true, updatable = true)
    private Integer purchaseTotal;
    
    @Column(name = "purchase_closed", insertable = true, updatable = true)
    private Boolean purchaseClosed;

    @OneToMany(mappedBy = "purchase", fetch=FetchType.EAGER)
    private List<ItemVO> items;

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
    	setPurchaseTotal(0);
    	setPurchaseClosed(false);
    	
    }

//    public PurchaseVO(Integer purchaseUserId, String purchaseUserRealName, String purchaseUserCellphone, String purchaseUserAddress, Integer purchaseTotal) {
//        this.purchaseUserId = purchaseUserId;
//        this.purchaseUserRealName = purchaseUserRealName;
//        this.purchaseUserCellphone = purchaseUserCellphone;
//        this.purchaseUserAddress = purchaseUserAddress;
//        this.purchaseTotal = purchaseTotal;
//    }

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
    public void setPurchaseTimestamp(Timestamp purchaseTimestamp) {
    	this.purchaseTimestamp = purchaseTimestamp;
    }

    public Integer getPurchaseTotal() {
        return purchaseTotal;
    }

    public void setPurchaseTotal(Integer purchaseTotal) {
        this.purchaseTotal = purchaseTotal;
    }

    public Boolean getPurchaseClosed() {
		return purchaseClosed;
	}

	public void setPurchaseClosed(Boolean purchaseClosed) {
		this.purchaseClosed = purchaseClosed;
	}

	
	public List<ItemVO> getItems() {
		return items;
	}
	
	public void setItems(List<ItemVO> items) {
		this.items = items;
	}

	@Override
    public String toString() {
        String outputStr = "Purchase: [";

        outputStr += "\n purchaseId=" + this.getPurchaseId();
        outputStr += "\n purchaseUserId=" + this.getPurchaseUserId();
        outputStr += "\n purchaseUserRealName=" + this.getPurchaseUserRealName();
        outputStr += "\n purchaseUserCellphone=" + this.getPurchaseUserCellphone();
        outputStr += "\n purchaseUserAddress=" + this.getPurchaseUserAddress();
        outputStr += "\n purchaseTimestamp=" + this.getPurchaseTimestamp();
        outputStr += "\n purchaseTotal=" + this.getPurchaseTotal();
        outputStr += "\n purchaseClosed=" + this.getPurchaseClosed();
        outputStr += "]\n\n";

        return outputStr;
    }
}
