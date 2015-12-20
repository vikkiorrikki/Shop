/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.StringTokenizer;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author savinov
 */
public class FilterBean implements Serializable {
    
    HashMap<String, HashSet<String>> filters = new HashMap<>();
    
    public void setFilter(HttpServletRequest request, Properties filterProps) {
        filters.clear();
        Map<String, String[]> params = request.getParameterMap();
        for (Map.Entry pair : params.entrySet()) {
            String key = (String)pair.getKey();
            if( filterProps != null && filterProps.get(key) == null ) {
                continue;
            }
            String[] values = (String[])pair.getValue();
            for(String s : values){
                HashSet<String> filVal = filters.get(key);
                if(filVal == null) {
                    filVal = new HashSet<>();
                    filters.put(key, filVal);
                }
                filVal.add(s);
            }
        }
        
        Cookie[] cookies = request.getCookies();
        if(cookies == null) {
            //System.err.println("cookie is null");
            return;
        }
        Cookie filterCookie = null;
        for (Cookie c : cookies) {
            System.err.println("cookie=" + c.getName());
            if (c.getName().equals("filter") ) {
                filterCookie = c;
            }
        }
        //System.err.println("filterCookie=" + filterCookie);
        if(filterCookie != null){
            StringTokenizer tokens
                    = new StringTokenizer(filterCookie.getValue(), "%2C");
            while (tokens.hasMoreTokens()) {
                String token = tokens.nextToken();
                System.err.println("token=" + token);
                for (Cookie c : cookies) {
                    if (c.getName().equals(token) ) {
                        HashSet<String> values = filters.get(token);
                        if(values == null) {
                            values = new HashSet<>();
                            filters.put(token, values);
                        }
                        //System.err.println("set value" + c.getValue());
                        values.add(c.getValue());
                    }
                }
            }
        }
    }
   
    public HashMap<String, HashSet<String>> getKeyValues() {
        return filters;
    }
    
    public boolean containsKeyValue(String key, String value) {
        HashSet<String> values = filters.get(key);
        return values != null ? values.contains(value) : false;
    }
    
    public boolean checkProduct(Properties properties) {
        for (Map.Entry pair : filters.entrySet()) {
            HashSet<String> values = (HashSet<String>)pair.getValue();
            Object o = properties.get(pair.getKey());
            if(o != null) {
                String val = (String)o;
                if( !values.contains(val) ) {
                    return false;
                }
            }
        }
        return true;
    }
    
    public boolean isEmpty() {
        return filters.isEmpty();
    }
    
}
