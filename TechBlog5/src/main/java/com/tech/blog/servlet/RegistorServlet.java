package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


/**
 * Servlet implementation class RegistorServlet
 */
@MultipartConfig
public class RegistorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");
		if(check == null) {
			out.println("box Not Checked");
		}else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
	
			String about= request.getParameter("about");
			//create user object and set aall data to that object
			User user = new User(name,email,password,gender,about);
			
			
			//create a user dao object
			Userdao dao = new Userdao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
			//save	
				out.println("done");
			}else {
				out.println("error");
			}
			
		}
			
		
	}

}
