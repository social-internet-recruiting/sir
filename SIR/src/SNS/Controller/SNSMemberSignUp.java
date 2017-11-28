package SNS.Controller;

import java.util.regex.Pattern;
import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import SNS.Model.*;

public class SNSMemberSignUp implements SNSCMD{

	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		MemberDAO dao = new MemberDAO();
		dao.SNSMemberSignUp(name, email, pass);
		
		
		// 리퀘스트로 값 넘겨 줄 떄 예시...
		// MemberDAO dao = new MemberDAO();
		// ArrayList<MemberDTO> list;
		// 쿼리는 셀렉트로 리스트 블러오는거 ...
		// list = dao.MemberList();
		// request.setAttribute("MemberList", list);
	}
}