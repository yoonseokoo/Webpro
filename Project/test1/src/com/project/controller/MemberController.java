package com.project.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.service.BContentService;
import com.project.service.BDeleteService;
import com.project.service.BListService;
import com.project.service.BModifyService;
import com.project.service.BModifyViewService;
import com.project.service.BReplyService;
import com.project.service.BReplyViewService;
import com.project.service.BWriteService;
import com.project.service.EmailConfirmService;
import com.project.service.IdConfirmService;
import com.project.service.MJoinService;
import com.project.service.MLoginService;
import com.project.service.MLogoutService;
import com.project.service.MService;
import com.project.service.MWithdrawalService;
import com.project.service.ModifyService;



@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean write_view = false;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		MService service = null;
		String viewPage = null;
		System.out.println("uri="+uri +" com ="+com);
		
		// [1] MAIN
		if(com.equals("/main.do")) {
			viewPage = "main/main.jsp";
			
			
		// [2] MEMBER
		} else if(com.equals("/loginView.do")) { //LOGIN
			viewPage = "member/login.jsp";
		}else if(com.equals("/login.do")) { 
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		} else if(com.equals("/idConfirm.do")) { //ID CONFIRM
			service = new IdConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		} else if(com.equals("/emailConfirm.do")) { //EMAIL CONFIRM
			service = new EmailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
		} else if(com.equals("/joinView.do")) { //SIGN-UP
			viewPage = "member/join.jsp";
		}else if(com.equals("/join.do")) {  
			service = new MJoinService();
			service.execute(request, response); 
			viewPage = "member/login.jsp";
		}else if(com.equals("/logout.do")) { //LOGOUT
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/modifyView.do")) { //EDIT INFORMATION
			viewPage = "member/modify.jsp"; 
		}else if(com.equals("/modify.do")){ 
			service = new ModifyService(); 
			service.execute(request, response); 
			viewPage ="main/main.jsp"; 
		}else if(com.equals("/withdrawal.do")) { // 회원탈퇴
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
			/* } else if(com.equals("/adminLoginView.do")) { //ADMIN 로그인
				viewPage = "admin/adminLogin.jsp";
			 * }else if(com.equals("/adminLogin.do")) { //ADMIN 로그인 service = new
			 * ALoginService(); service.execute(request, response); viewPage =
			 * "adminMain.do"; } else if(com.equals("/adminMain.do")) { service = new
			 * MAllViewService(); service.execute(request, response); viewPage =
			 * "main/adminMain.jsp";
			 */
		
			/*} else if(com.contentEquals("/myInfoView.do")) { //내 정보 페이지
			viewPage = "member/myinfo.jsp";
		}else if(com.equals("/myinfo.jsp")) {  
			service = new MinfoService();
			service.execute(request, response); 
			viewPage ="main/main.jsp"; 
			
			 * }else if(com.equals("/adminLogout.do")) { //ADMIN 로그아웃 service = new
			 * ALogoutService(); service.execute(request, response); viewPage =
			 * "main/main.jsp";
			 */
		
		
		
			
			
		} else if(com.equals("/list.do")) { //게시판
			service = new BListService();
			service.execute(request, response);
			viewPage = "board/list.jsp";
		} else if (com.equals("/contentView.do")) { //게시판 자세히 보기
			 service = new BContentService(); 
			 service.execute(request, response); 
			 viewPage = "board/contentView.jsp"; 
		} else if (com.equals("/bModifyView.do")) {
			 service = new BModifyViewService(); 
			 service.execute(request, response);
			 viewPage = "board/bModifyView.jsp";
		} else if (com.equals("/bModify.do")) { 
			 service = new BModifyService();
			 service.execute(request, response); 
			 viewPage = "list.do"; 
		} else if (com.equals("/reply_view.do")) { 
			 service = new BReplyViewService();
			 service.execute(request, response); 
			 viewPage = "board/reply_view.jsp"; 
		} else if (com.equals("/reply.do")) { 
			service = new BReplyService();
			service.execute(request, response); 
			viewPage = "list.do";
		} else if (com.equals("/bDelete.do")) { 
			service = new BDeleteService();
			service.execute(request, response); 
			viewPage = "list.do"; 
		}else if(com.equals("/write_view.do")) { // 글쓰기 view viewPage =
			viewPage = "board/write_view.jsp"; 
			write_view = true; 
		} else if (com.equals("/write.do")) { 
			if (write_view == true) { 
				service = new BWriteService(); 
				service.execute(request, response); 
				write_view = false; 
			}
			 viewPage = "list.do"; 
		 }
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		}
	}

