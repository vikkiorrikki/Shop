/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Log;

/**
 *
 * @author savinov
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Bean.FilterBean;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.Principal;
import java.util.StringTokenizer;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author savinov
 */
public class Filter implements javax.servlet.Filter {
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public Filter() {
    }    
    
    private void doBeforeProcessing(ServletRequest request1, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LogFilter:DoBeforeProcessing");
        }
        
        HttpServletRequest request = (HttpServletRequest) request1;
        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        final String uri = request.getRequestURI();
        final String template = "/Shop/";
        Principal p = request.getUserPrincipal();
        String name = null;
        if (p != null) {
            name = p.getName();
        } else {
            name = "";
        }
        final String user = name;
        final String lang = request.getParameter("lang");
        String logMessage = "ip: " + ip + ", user:" + user + ", uri: " + uri;
        log(logMessage);
        class Ifer {

            boolean f(String in) {
                return uri.equals(template + in);
            }

            boolean f(String in, String in2) {
                return uri.equals(template + in)
                        || uri.equals(template + in2);
            }

            boolean f(String in, String in2, String in3) {
                return uri.equals(template + in)
                        || uri.equals(template + in2)
                        || uri.equals(template + in3);
            }
        }
        Ifer i = new Ifer();

        if (i.f("buy")) {
            String orderderedProducts = (String) session.getAttribute("orderderedProducts");
            if (orderderedProducts != null) {
                String address = request.getParameter("address");
                String countStr = request.getParameter("count");
                Integer count = countStr != null ? Integer.parseInt(countStr) : 1;
                log(logMessage + "order: " + orderderedProducts
                        + "address:" + address + " count:" + count);
            }
        }
        if (i.f("Servlet1")) {
            String id = request.getParameter("id");
            log(logMessage + " ProductCard id:" + id);
        }
        
        if (i.f("productList", "enterToProducts")) {
            FilterBean bean = new FilterBean();
            bean.setFilter(request, null);
            log(logMessage + " Products list:" + bean.getKeyValues());
        }

        if (i.f("enterToCart", "Cart")) {
            String orderderedProducts = (String) session.getAttribute("orderderedProducts");
            if (orderderedProducts != null) {
                log(logMessage + " Cart with ordered:" + orderderedProducts);
            } else {
                log(logMessage + " Cart with empty orders.");
            }
        }

        if (i.f( "login-error")) {
            log(logMessage + " Login error");
        }

        if (i.f("login", "Login")) {
            log(logMessage + " Login");
        }

        if (i.f("logout")) {
            log(logMessage + " logout");
        }

        if (i.f("userPage", "userPageWithHistory")) {
            log(logMessage + " openUserPage");
        }

        if (i.f("markets")) {
            log(logMessage + " openUserPage");
        }

        if (debug) {
            log("LogFilter:doFilter()");
        }
	
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LogFilter:DoAfterProcessing");
        }

	
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        
        doBeforeProcessing(request, response);
        
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
	    // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }
        
        doAfterProcessing(request, response);

	// If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("LogFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("LogFilter()");
        }
        StringBuilder sb = new StringBuilder("LogFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                try (PrintStream ps = new PrintStream(response.getOutputStream())) {
                    PrintWriter pw = new PrintWriter(ps);
                    pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N
                    
                    // PENDING! Localize this for next official release
                    pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                    pw.print(stackTrace);
                    pw.print("</pre></body>\n</html>"); //NOI18N
                    pw.close();
                }
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                try (PrintStream ps = new PrintStream(response.getOutputStream())) {
                    t.printStackTrace(ps);
                }
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}

