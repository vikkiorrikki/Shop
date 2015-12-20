package products;
// Generated 20-Dec-2015 00:37:43 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Orders generated by hbm2java
 */
public class Orders  implements java.io.Serializable {


     private int orderId;
     private Date timestamp;
     private String user;
     private String store;
     private String goods;

    public Orders() {
    }

    public Orders( String user, String store, String goods, Date timestamp) {
       this.timestamp = timestamp;
       this.user = user;
       this.store = store;
       this.goods = goods;
    }
   public Orders( Orders o) {
       this(o.user, o.store, o.goods, o.timestamp);
       this.orderId = o.orderId;
    }
    public int getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public Date getTimestamp() {
        return this.timestamp;
    }
    
    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
    public String getUser() {
        return this.user;
    }
    
    public void setUser(String user) {
        this.user = user;
    }
    public String getStore() {
        return this.store;
    }
    
    public void setStore(String store) {
        this.store = store;
    }
    public String getGoods() {
        return this.goods;
    }
    
    public void setGoods(String goods) {
        this.goods = goods;
    }




}


