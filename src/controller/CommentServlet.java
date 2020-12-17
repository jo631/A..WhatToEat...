package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RestaurantRepository;
import dto.Restaurant;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("name");
		int res_id = Integer.parseInt(request.getParameter("id"));
		if (username == null) {
			System.out.println("·Î±×ÀÎ¾ÈµÊ");
			response.sendRedirect("detail.jsp?id="+res_id);
			return;
		}
		
		RestaurantRepository a = RestaurantRepository.getInstance();
		
		String comment = request.getParameter("comment");
		
		a.reviewInsert(username, res_id, comment);
		response.sendRedirect("detail.jsp?id="+res_id);
	}
}
