package SNS;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SNS.Controller.*;

import javax.servlet.RequestDispatcher;

@WebServlet("*.sns")
public class SNSFrontController extends HttpServlet {

    public SNSFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmdURI = requestURI.substring(contextPath.length());
		
		SNSCMD cmd = null;
		String viewPage = null;

		// 어노테이션 매핑입니다. XML 사용 X
		// 예시 입니다. 가입할 떄 가장 기본적인 구성만 가지고 설명
		// 만약 register.jsp 에서 form action="SNSMemberSignUp.sns" submit 할 떄
		// SNSMemberSignUp 객체 생성
		// excute 실행 model DAO, DTO를 통해 데이터베이스 처리
		// 뷰페이지 리퀘스트디스패쳐로 Main.jsp로 넘겨줌.
		// 리퀘스트 값 있으면 같이 넘어가고 아니면 그냥 넘어가기 떄문에 크게 상관 없을 것 같아서 그냥 리퀘스트디스패쳐 사용함.
		
		if(cmdURI.equals("SNSMemberSignUp.sns")){
			cmd = new SNSMemberSignUp();
			cmd.execute(request, response);
			viewPage = "Main.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
	}
}