package com.sxxy.servlet.customerCare;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxxy.service.CustomerCareService;
import com.sxxy.service.UserService;
import com.sxxy.service.impl.CustomerCareServiceImpl;
import com.sxxy.service.impl.UserServiceImpl;

public class CustomerCareDeleteServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CustomerCareDeleteServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//将String转换为int
		int id =Integer.parseInt(request.getParameter("id"));
		
		CustomerCareService care=new CustomerCareServiceImpl();
	
		boolean mark=care.delete(id);
		if(mark){
			request.setAttribute("info", "删除成功");
		}else{
			request.setAttribute("info", "删除失败");
		}
		request.getRequestDispatcher("/view/customerCare/customerCare_save.jsp").forward(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
