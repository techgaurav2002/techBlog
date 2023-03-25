package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig

public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetch ll data
		PrintWriter out = response.getWriter();

		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userabout = request.getParameter("user_about");

		// get the user from the session.....

		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userabout);
		String oldFile = user.getProfile();
		user.setProfile(imageName);

		// update database

		Userdao userDao = new Userdao(ConnectionProvider.getConnection());

		boolean ans = userDao.updateUser(user);
		if (ans) {

			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
			//System.out.println(path);
			String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
			
			if(!oldFile.equals("default.png")) {
			Helper.deleteFile(pathOldFile);
			}
			
			
			if (Helper.saveFile(part.getInputStream(), path)) {
				Message msg = new Message("Profile Details updated.....","success","alert-success");
				
				s.setAttribute("msg", msg);
			} else {
				Message msg = new Message("Something went wrong...","error","alert-danger");
				
				s.setAttribute("msg", msg);

			}

		} else {
			Message msg = new Message("Something went wrong...","error","alert-danger");
			
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");

	}

}
