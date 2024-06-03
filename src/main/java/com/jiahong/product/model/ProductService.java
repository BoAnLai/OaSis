package com.jiahong.product.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.mike.tool.HibernateTool;

public class ProductService {
    
	   public List<ProductVO> listAllProducts() {
	        Session session = HibernateTool.getSessionFactory().openSession();
	        List<ProductVO> productList = null;
	        try {
	            productList = session.createQuery("from ProductVO", ProductVO.class).list();
	        } catch (RuntimeException ex) {
	            ex.printStackTrace();
	            throw ex;
	        } finally {
	            session.close();
	        }
	        return productList;
	    }
    
    public void deleteProduct(Integer productId) {
        Session session = HibernateTool.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            ProductVO product = session.get(ProductVO.class, productId);
            if (product != null) {
                session.delete(product);
                tx.commit();
            }
        } catch (RuntimeException ex) {
            if (tx != null) tx.rollback();
            throw ex;
        } finally {
            session.close();
        }
    }
    
    public ProductVO getProductById(Integer productId) {
        Session session = HibernateTool.getSessionFactory().openSession();
        ProductVO product = null;
        try {
            product = session.get(ProductVO.class, productId);
        } catch (RuntimeException ex) {
            ex.printStackTrace();
            throw ex;
        } finally {
            session.close();
        }
        return product;
    }
}
