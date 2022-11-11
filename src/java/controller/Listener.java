/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.PhotoDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author Vinh Cao
 */
public class Listener implements HttpSessionListener  {
     @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Created");
        ServletContext svc = null;
        int view = 0;
        PhotoDAO photo = new PhotoDAO();
        if (se.getSession().isNew()) {
            photo.updateView();
            view = photo.getView();
        } else {
            view = photo.getView();
        }

        String result = String.format("%06d", view);
        StringBuffer sb = new StringBuffer(result);
        svc = se.getSession().getServletContext();
        svc.setAttribute("totalView", sb.reverse().toString());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("deleted");
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
