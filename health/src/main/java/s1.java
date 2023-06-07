

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/s1")
public class s1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public s1() {
        super();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	PrintWriter out= response.getWriter();
  	String user=request.getParameter("user");
  	String pass = request.getParameter("pass");
  	
  	 if (user.equals("sanc") && pass.equals("s"))
  	 {		 
  		out.println("<h3>HEALTH LOGGER</h3>");
  	      out.println("<h4><a href = patients.jsp>Manage Patients </a></h4>");
	        out.println("<h4><a href = vitals.jsp>Manage Vitals </a></h4>"); 
  	        
  	 }
  	 else
  	 {	         
  	        RequestDispatcher rd=request.getRequestDispatcher("/f1.jsp");  
  	        rd.include(request, response);  
  	        out.println("Wrong User Name or Password "); 	        
  	 }
  }
  }
