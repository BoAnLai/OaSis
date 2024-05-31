package com.jiahong.product.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.mike.tool.HibernateTool;

public class ProductService {
    
    public List<ProductVO> listAllProducts() {
        Transaction transaction = null;
        List<ProductVO> products = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            products = session.createQuery("FROM ProductVO", ProductVO.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return products;
    }

    public ProductVO getProductById(Integer productId) {
        Transaction transaction = null;
        ProductVO product = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            product = session.get(ProductVO.class, productId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return product;
    }

    public void deleteProduct(Integer productId) {
        Transaction transaction = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            ProductVO product = session.get(ProductVO.class, productId);
            if (product != null) {
                session.delete(product);
                System.out.println("Product is deleted");
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
