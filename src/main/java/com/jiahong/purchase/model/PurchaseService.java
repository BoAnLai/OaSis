package com.jiahong.purchase.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mike.purchase.model.PurchaseVO;
import com.mike.tool.HibernateTool;

public class PurchaseService {
    
    public List<PurchaseVO> listAllPurchases() {
        Transaction transaction = null;
        List<PurchaseVO> purchases = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            purchases = session.createQuery("FROM PurchaseVO", PurchaseVO.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return purchases;
    }

    public PurchaseVO getPurchaseById(Integer purchaseId) {
        Transaction transaction = null;
        PurchaseVO purchase = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            purchase = session.get(PurchaseVO.class, purchaseId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return purchase;
    }

    public void addPurchase(PurchaseVO purchase) {
        Transaction transaction = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(purchase);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void updatePurchase(PurchaseVO purchase) {
        Transaction transaction = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(purchase);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deletePurchase(Integer purchaseId) {
        Transaction transaction = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            PurchaseVO purchase = session.get(PurchaseVO.class, purchaseId);
            if (purchase != null) {
                session.delete(purchase);
                System.out.println("Purchase is deleted");
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
