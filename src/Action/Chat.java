package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.Constants;

public class Chat extends HttpServlet
{

	/**
	 * Constructor of the object.
	 */
	public Chat()
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		RequestDispatcher dispatcher=request.getRequestDispatcher("/chat.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//消息处理
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		//添加监听
		Constants.addThread(session.getId(), Thread.currentThread());
		
		try{
			synchronized (Thread.currentThread())
			{
				Thread.currentThread().wait();
			}
		}catch(InterruptedException ex){
			System.out.println(Thread.currentThread()+"-->Stop!");
		}
		//推送数据
		
		System.out.println(Constants.getMessage());
		out.println(Constants.getMessage());
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException
	{
		// Put your code here
	}

}
