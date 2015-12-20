package comments;


import org.hibernate.Session;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

public class DbUpdater { 
    
    public static void persist(final Comments object) {
        Session session = null;
        try{
            session = CommentsHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(object);
            session.getTransaction().commit();
         } catch (Exception e) {
              System.out.println("Comment set exception:" + e.getMessage());
        } finally {
            if (session != null && session.isOpen()) 
                session.close();      
        }
    }
    
    public static List getAllByUser(String user){   
                Session session = null; 
                List list = null;
                System.out.println("getAllByUser");
        	try {
                    session = CommentsHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    String sql = "SELECT * FROM comments WHERE user = :username";
                    System.out.println("query");
                    SQLQuery query = session.createSQLQuery(sql);
                    query.addEntity(Comments.class);
                    System.out.println("user=" + user);
                    query.setParameter("username", user);
                    list = query.list();
                    System.out.println("list:" + list.size());
                } catch (Exception e) {
                    System.out.println("Exception :" + e.getMessage());
              } finally {
                  if (session != null && session.isOpen()) 
                      session.close();
                      return list;
              }
        }
    }
