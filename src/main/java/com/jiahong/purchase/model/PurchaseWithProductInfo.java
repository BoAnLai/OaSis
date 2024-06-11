package com.jiahong.purchase.model;

import java.util.Objects;

public class PurchaseWithProductInfo {
	private Integer purchaseId;
	
	private Integer productId;

	private String productImg;

    private String productName;

    private Integer productPrice;
    
    public Integer getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
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

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}


    public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(productImg, productName, productPrice, purchaseId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PurchaseWithProductInfo other = (PurchaseWithProductInfo) obj;
		return Objects.equals(productImg, other.productImg) && Objects.equals(productName, other.productName)
				&& Objects.equals(productPrice, other.productPrice) && Objects.equals(purchaseId, other.purchaseId);
	}

	@Override
	public String toString() {
		return "PurchaseWithProductInfo [purchaseId=" + purchaseId + ", productImg=" + productImg + ", productName="
				+ productName + ", productPrice=" + productPrice + "]";
	}
}
