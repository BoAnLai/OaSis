//package com.jiahong.item.model;
//
//import java.util.List;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//import com.mike.tool.HibernateTool;
//
//public class ItemService {
//
//    public List<ItemVO> listAllItems() {
//        Transaction transaction = null;
//        List<ItemVO> items = null;
//        try (Session session = HibernateTool.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            items = session.createQuery("FROM ItemVO", ItemVO.class).list();
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        }
//        return items;
//    }
//
//    public ItemVO getItemById(Integer itemId) {
//        Transaction transaction = null;
//        ItemVO item = null;
//        try (Session session = HibernateTool.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            item = session.get(ItemVO.class, itemId);
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        }
//        return item;
//    }
//
//    public void deleteItem(Integer itemId) {
//        Transaction transaction = null;
//        try (Session session = HibernateTool.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            ItemVO item = session.get(ItemVO.class, itemId);
//            if (item != null) {
//                session.delete(item);
//                System.out.println("Item is deleted");
//            }
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        }
//    }
//}
