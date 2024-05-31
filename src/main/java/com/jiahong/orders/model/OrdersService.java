package com.jiahong.orders.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.mike.tool.HibernateTool;

public class OrdersService {

    public List<OrdersVO> listAllOrders() {
        Transaction transaction = null;
        List<OrdersVO> orders = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            orders = session.createQuery("FROM OrdersVO", OrdersVO.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return orders;
    }

    public OrdersVO getOrderById(Integer orderId) {
        Transaction transaction = null;
        OrdersVO order = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            order = session.get(OrdersVO.class, orderId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return order;
    }

    public void deleteOrder(Integer orderId) {
        Transaction transaction = null;
        try (Session session = HibernateTool.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            OrdersVO order = session.get(OrdersVO.class, orderId);
            if (order != null) {
                session.delete(order);
                System.out.println("Order is deleted");
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
