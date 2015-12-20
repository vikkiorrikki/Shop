/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package products;

import java.io.Serializable;

/**
 *
 * @author savinov
 */
public class BeanCount implements Serializable{
    BeanCount(){}
    BeanCount(String beanId, String count){
        this.beanId = beanId;
        this.count = count;
    }
    public String toString(){
        return "beanId:" + beanId + " count:" + count;
    }
    public String getBeanId() {
        return beanId;
    }

    public void setBeanId(String beanId) {
        this.beanId = beanId;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
    
    private String count;
    private String beanId;
}
