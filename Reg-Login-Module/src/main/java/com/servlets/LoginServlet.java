package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Message;
import com.entities.User;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			Session s=FactoryProvider.getFactory().openSession();
			
			String query="from User where email=:e and password=:p";
			@SuppressWarnings({ "rawtypes" })
			Query q=s.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			User user=(User) q.uniqueResult();
			
			s.close();
			
			HttpSession session=req.getSession();
			if(user!=null) {
				session.setAttribute("user", user);
				Message msg=new Message("Login successfull...","alert-success");
				session.setAttribute("msg", msg);	
				System.out.println("success");
				res.sendRedirect("index.jsp");
			}else {
				Message msg=new Message("Email or Password is invalid...","alert-danger");
				session.setAttribute("msg", msg);
				System.out.println("fail");
				res.sendRedirect("login.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
