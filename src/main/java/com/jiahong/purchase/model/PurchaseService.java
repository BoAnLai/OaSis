package com.jiahong.purchase.model;

import java.util.List;
import org.hibernate.Session;
import com.jiahong.item.model.ItemVO;
import com.mike.tool.HibernateTool;
import com.mike.tool.StringProcessor;

public class PurchaseService {

    public PurchaseService() {
        super();
    }

    public void insert(PurchaseVO vo) {
        Session session = HibernateTool.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(vo);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public PurchaseVO getPurchaseByPurchaseId(Integer purchaseId) {
        try {    
            Session session = HibernateTool.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            
            PurchaseVO purchase = session.get(PurchaseVO.class, purchaseId);
            session.getTransaction().commit();
            return purchase;
        } catch (Exception e) {
            throw e;
        }        
    }

    public PurchaseVO createPurchase(Integer userId) {
        try {    
            Session session = HibernateTool.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            
            PurchaseVO purchase = new PurchaseVO(userId);
            session.save(purchase);
            session.refresh(purchase);
            session.getTransaction().commit();
            return purchase;
        } catch (Exception e) {
            throw e;
        }        
    }

    public PurchaseVO getCurrentPurchase(Integer userId) {
        String hql = "FROM PurchaseVO p WHERE p.purchaseUserId = :userId AND p.purchaseClosed = :closed";
        
        try {    
            Session session = HibernateTool.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            List<PurchaseVO> purchaseList = session.createQuery(hql, PurchaseVO.class)
                    .setParameter("userId", userId)
                    .setParameter("closed", false)
                    .getResultList();
            session.getTransaction().commit();
            
            int listLength = purchaseList.size();
            
            PurchaseVO output = null;
            if (listLength == 0) {
                output = createPurchase(userId);
                return output;
            } else if (listLength == 1) {
                output = purchaseList.get(0);
                return output;
            } else {
                System.out.println("Bugs in purchase managing code: more than one active purchase");
                output = purchaseList.get(0);
                return output;
            }
            
        } catch (Exception e) {
            throw e;
        }    
    }

    public void updatePurchase(PurchaseVO purchase) {
        try {    
            Session session = HibernateTool.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            
            session.update(purchase);
            
            session.getTransaction().commit();
        } catch (Exception e) {
            throw e;
        }    
    }

    public void closePurchase(Integer purchaseId) {
        PurchaseVO purchase = getPurchaseByPurchaseId(purchaseId);
        closePurchase(purchase);
    }

    public void closePurchase(PurchaseVO purchase) {
        String realName = purchase.getPurchaseUserRealName();
        boolean realNameValid = realName != null && !(realName.isBlank()) ;
        
        String cellphone = purchase.getPurchaseUserCellphone();
        boolean cellphoneValid = StringProcessor.isCellphoneNumber(cellphone);
        
        String address = purchase.getPurchaseUserAddress();
        boolean addressValid = address != null && !(address.isBlank());
        
        if (realNameValid && cellphoneValid && addressValid) {
            try {    
                Session session = HibernateTool.getSessionFactory().getCurrentSession();
                session.beginTransaction();
                
                purchase.setPurchaseClosed(true);
                
                session.update(purchase);
                
                session.getTransaction().commit();
            } catch (Exception e) {
                throw e;
            }
            
        } else {
            throw new IllegalArgumentException("payment info are not valid ");
        }
    }

    // 新增方法：將產品加入購物車
    public void addProductToPurchase(Integer purchaseId, Integer productId) {
        try {
            Session session = HibernateTool.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            
            PurchaseVO purchase = session.get(PurchaseVO.class, purchaseId);
            if (purchase != null) {
                purchase.setPurchaseProductId(productId);  // 設置 purchase_product_id
                session.update(purchase);
                session.getTransaction().commit();
            } else {
                throw new IllegalArgumentException("Invalid purchase ID");
            }
        } catch (Exception e) {
            throw e;
        }
    }

    // 新增方法：取得購物車中的所有產品
    public List<Integer> getProductsInPurchase(Integer purchaseId) {
        try {
            Session session = HibernateTool.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            
            PurchaseVO purchase = session.get(PurchaseVO.class, purchaseId);
            session.getTransaction().commit();
            
            if (purchase != null) {
                // 這裡假設 purchaseProductId 是一個產品 ID 的集合
                return purchase.getPurchaseProductIds();  // 取得 purchase_product_id 列表
            } else {
                throw new IllegalArgumentException("Invalid purchase ID");
            }
        } catch (Exception e) {
            throw e;
        }
    }

    public void addItems(Integer userId, Integer productId, Integer productCount) {}
    
    public void removeItems(Integer itemId) {
        
    }

    public void updateTotal(Integer purchaseId) {
        PurchaseVO purchase = getPurchaseByPurchaseId(purchaseId);
        updateTotal(purchase);
    }
    
    public void updateTotal(PurchaseVO purchase) {
        List<ItemVO> itemList = purchase.getItems();
        
        int total = 0;
        for (ItemVO item : itemList) {
            total += item.getItemTotal();
        }
    }
}
