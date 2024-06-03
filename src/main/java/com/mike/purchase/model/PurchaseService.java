package com.mike.purchase.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.mike.tool.HibernateTool;

public class PurchaseService {

	public PurchaseService() {
		super();
	}
	
	
	
	public PurchaseVO getPurchaseByPurchaseId(Integer purchaseId) {
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			PurchaseVO purchase = session.get(PurchaseVO.class, purchaseId);
			session.getTransaction().commit();
			return purchase;
		}catch(Exception e) {
			throw e;
		}		
	}
	
	
	
	public PurchaseVO createPurchase(Integer userId) {
		
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			PurchaseVO purchase = new PurchaseVO(userId);
			session.save(purchase);

			
			session.getTransaction().commit();
			return purchase;
		}catch(Exception e) {
			throw e;
		}		
	}
	
	
	
	public PurchaseVO getCurrentPurchase(Integer userId) {
	
		String hql = "FROM purchase p WHERE p.purchaseUserId = :userId AND p.purchaseClosed = 0";
		
		try {	
			Session session = HibernateTool.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			List<PurchaseVO> purchaseList = session.createQuery(hql, PurchaseVO.class)
                    .setParameter("userId", userId)
                    .setParameter("closed", false)
                    .getResultList();
			
			int listLength = purchaseList.size();
			if(listLength == 0) {
				return createPurchase(userId);
			}else if(listLength == 1){
				return null;
			}else {
				return null;
			}
			

		}catch(Exception e) {
			throw e;
		}	
	}

	
	
	public void addItems(Integer userId, Integer productId, Integer productCount) {
		
	}
	
	
	
	public void removeItems(Integer itemId) {
		
	}
	
	
	
	public void closePurchase(Integer purchaseId) {
		
	}
}
