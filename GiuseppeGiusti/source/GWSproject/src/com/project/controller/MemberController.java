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
import com.project.service.CartAddService;
import com.project.service.CartDelProductService;
import com.project.service.CartViewService;
import com.project.service.EmailConfirmService;
import com.project.service.IdConfirmService;
import com.project.service.MJoinService;
import com.project.service.MLoginService;
import com.project.service.MLogoutService;

import com.project.service.MWithdrawalService;
import com.project.service.ModifyService;
import com.project.service.OrderHistoryService;
import com.project.service.PGroupService;
import com.project.service.PListAllService;
import com.project.service.PListService;
import com.project.service.PSearchService;
import com.project.service.ProductDetailService;
import com.project.service.Service;
import com.project.service.addOrderDetailService;
import com.project.service.addOrderService;
import com.project.service.cartUpdateService;
import com.project.service.emptyCartService;
import com.project.service.getAddressService;
import com.project.service.myPageService;

@WebServlet("*.do") 
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean write_view = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		Service service = null;
		String viewPage = null;
		System.out.println("uri=" + uri + " com =" + com);

		// [1] MAIN
		
		if (com.equals("/main.do")) {
			viewPage = "main/main.jsp";
		} else if (com.equals("/HistoryView.do")) { // LOGIN
			viewPage = "main/HistoryView.jsp";
			
		// [2] MEMBER
			
		} else if (com.equals("/loginView.do")) { // LOGIN
			viewPage = "member/login.jsp";
		} else if (com.equals("/login.do")) {
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		} else if (com.equals("/idConfirm.do")) { // ID CONFIRM
			service = new IdConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		} else if (com.equals("/emailConfirm.do")) { // EMAIL CONFIRM
			service = new EmailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
		} else if (com.equals("/joinView.do")) { // SIGN-UP
			viewPage = "member/join.jsp";
		} else if (com.equals("/join.do")) {
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "member/login.jsp";
		} else if (com.equals("/logout.do")) { // LOGOUT
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		} else if (com.equals("/modifyView.do")) { //UPDATE INFORMATION
			viewPage = "member/modify.jsp";
		} else if (com.equals("/modify.do")) {
			service = new ModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		} else if (com.equals("/withdrawal.do")) { //WITHDRAW MEMBERSHIP
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";

			/*
			 * } else if(com.equals("/adminLoginView.do")) { //ADMIN 濡쒓렇�씤 viewPage =
			 * "admin/adminLogin.jsp"; }else if(com.equals("/adminLogin.do")) { //ADMIN 濡쒓렇�씤
			 * service = new ALoginService(); service.execute(request, response); viewPage =
			 * "adminMain.do"; } else if(com.equals("/adminMain.do")) { service = new
			 * MAllViewService(); service.execute(request, response); viewPage =
			 * "main/adminMain.jsp";
			 */

		
		//	[3] BOARD
			
		} else if (com.equals("/list.do")) { // BOARD LIST
			service = new BListService();
			service.execute(request, response);
			viewPage = "board/list.jsp";
		} else if (com.equals("/contentView.do")) { // BOARD DETAIL VIEW
			service = new BContentService();
			service.execute(request, response);
			viewPage = "board/contentView.jsp";
		} else if (com.equals("/bModifyView.do")) { // MODIFY POST
			service = new BModifyViewService();
			service.execute(request, response);
			viewPage = "board/bModifyView.jsp";
		} else if (com.equals("/bModify.do")) {
			service = new BModifyService();
			service.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/reply_view.do")) { // REPLY POST
			service = new BReplyViewService();
			service.execute(request, response);
			viewPage = "board/reply_view.jsp";
		} else if (com.equals("/reply.do")) {
			service = new BReplyService();
			service.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/bDelete.do")) { // DELETE POST
			service = new BDeleteService();
			service.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/write_view.do")) { // WRITE NEW POST
			viewPage = "board/write_view.jsp";
			write_view = true;
		} else if (com.equals("/write.do")) {
			if (write_view == true) {
				service = new BWriteService();
				service.execute(request, response);
				write_view = false;
			}
			viewPage = "list.do";
			
		
		//	[4] PRODUCT
			
		} else if (com.equals("/productGroup.do")) { // PRODUCT GROUP
			service = new PGroupService();
			service.execute(request, response);
			viewPage = "product/productGroup.jsp";
		} else if (com.equals("/productList.do")) {  // PRODUCT LIST BY GROUP
			service = new PListService();
			service.execute(request, response);
			viewPage = "product/productList.jsp";
		} else if (com.equals("/productDetail.do")) {  // PRODUCT DETAIL
			service = new ProductDetailService();
			service.execute(request, response);
			viewPage = "product/productDetail.jsp";
		}else if (com.contentEquals("/productALL.do")) { // PRINT ALL PRODUCTS
			service = new PListAllService();
			service.execute(request, response);
			viewPage = "product/productAll.jsp";
		}else if (com.contentEquals("/productSearch.do")) { // SEARCH PRODUCT BY NAME
			service = new PSearchService();
			service.execute(request, response);
			viewPage = "product/productSearched.jsp";
			
			
		//	[5] CART
			
		} else if(com.equals("/addCartView.do")) {  // ADD TO CART
			service = new CartAddService();
			service.execute(request, response);
			viewPage = "/productGroup.do";
		} else if(com.equals("/myCart.do")) {  	// SEE CART
			service = new CartViewService();
			service.execute(request, response);
			viewPage = "cart/myCart.jsp";
		} else if(com.equals("/cartDelete.do")) {  // DELETE CART
			service = new CartDelProductService();
			service.execute(request, response);
			viewPage = "/myCart.do";
		} else if(com.equals("/cartUpdate.do")) {  // UPDATE QUANTITY IN CART
			service = new cartUpdateService();
			service.execute(request, response);
			viewPage = "myCart.do";
		} else if(com.equals("/cartBuyView.do")) {  // BUY IN CART
			service = new CartViewService();
			service.execute(request, response);
			viewPage = "cart/cartBuy.jsp";
		} else if (com.equals("/cartBuy.do")) {
			service = new addOrderService();		// ADD TO ORDER TABLE
			service.execute(request, response);
			service = new addOrderDetailService();	// ADD TO ORDER DETAIL TABLE
			service.execute(request, response);
			service = new emptyCartService();		// EMPTY CART AFTER PURCHASE
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
			
		// [6] OTHERS
			
		} else if (com.equals("/location.do")) {	
			service = new getAddressService();
			service.execute(request, response);
			viewPage="main/location.jsp";
		}else if (com.contentEquals("/orderHistory.do")) {
			service = new OrderHistoryService();
			service.execute(request, response);
			viewPage = "main/orderHistory.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
