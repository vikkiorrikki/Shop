/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package products;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
/**
 *
 * @author savinov
 */
public class OrdersOut extends Orders implements Serializable{
    
    private List<BeanCount> list;
    public OrdersOut(Orders ord){
        super(ord);
        list = new ArrayList<>();
        d();
    }
    public void d(){
        String s = this.getGoods();
        System.out.println("s:" + s);
        StringTokenizer tok = new StringTokenizer(s, "&");
        while(tok.hasMoreElements()){
            String nextTock = tok.nextToken();
            System.out.println("nextTock:" + nextTock);
            StringTokenizer tok2 = new StringTokenizer(nextTock, "=");
            BeanCount bc = new BeanCount();
            boolean ok = tok2.hasMoreElements();
            if(ok){
                bc.setBeanId( tok2.nextToken() );
            }
            ok = ok && tok2.hasMoreElements();
            if(ok){
                bc.setCount( tok2.nextToken());
            }
            if(ok){
                list.add(bc);
            }
        }
    }

    public List<BeanCount> getList() {
        return list;
    }
    public String toString(){
        String out = "";
        for( BeanCount b : list){
            out += b.toString() + "\n";
        }
        return out;
    }
    public void setList(List<BeanCount> list) {
        this.list = list;
    }
    
}
