/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package products;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author savinov
 */
public class OrdersHelper {

    Session session = null;

    public OrdersHelper() {
        this.session = NewHibernateUtil.getSessionFactory().getCurrentSession();
    }

    public static void persist(final Orders order) {
        Session session = null;
        try {
            System.out.println("h1=" + order.toString());
            session = NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            System.out.println("h2=" + order.toString());
            session.save(order);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public static List getAllByUser(String user) {
        Session session = null;
        List list = null;
        try {
            session = NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "SELECT * FROM orders WHERE user = :username";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(Orders.class);
            query.setParameter("username", user);
            list = query.list();
            System.out.println("list:" + list.size());
//                    list = session.createQuery(query).list();
            session.close();

        } catch (Exception e) {
            System.out.println("OrdersHelper:" + e.getMessage());
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
            return list;
        }
    }

}
