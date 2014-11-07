package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.Constants;

public class Login extends HttpServlet
{

	/**
	 * Constructor of the object.
	 */
	public Login()
	{
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy()
	{
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//登陆跳转
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		String userName=request.getParameter("userName");
		
		//保存Session
		Constants.user.add(userName);
		String message=userName+":Log in";
		Long time=new Date().getTime();
		Constants.addMessage(message, time.toString());
		
		//
		session.setAttribute("userName", userName);
		response.sendRedirect("./Chat");
		//
		Constants.notifyAllThread();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//http长连接，刷新用户
		doGet(request, response);
	}

	public void init() throws ServletException
	{
		// Put your code here
	}

}
