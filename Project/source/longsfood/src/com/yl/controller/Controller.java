package com.yl.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.service.*;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do") 
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		
		
		//Main
		if(command.equals("/main.do")) {
			service = new MainService();
			service.execute(request, response);
			viewPage="main/mainpage.jsp";
		}else if(command.equals("/longfoodIntro.do")) {// longfood �냼媛�
			viewPage = "main/longfoodIntro.jsp";
		}
		
		//Member
		else if(command.equals("/joinView.do")) {
			request.setAttribute("joinView", true);
			viewPage = "main.do";
		}else if(command.equals("/idConfirm.do")) {
			service = new MidDuplicationCheckService();
			service.execute(request, response);
			viewPage = "message/idConfirm.jsp";
		}else if(command.equals("/join.do")) {
			service = new JoinService();
			service.execute(request, response);
			viewPage = "index.jsp";
		}else if(command.equals("/loginView.do")) {
			request.setAttribute("loginView", true);
			viewPage = "main.do";
		}else if(command.equals("/login.do")) {
			service = new LoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}
		
		// member mypage
		else if(command.equals("/mMypage.do")) {
			service = new MMypageViewService();
			service.execute(request, response);
			viewPage = "member/mypage.jsp";
		}else if(command.equals("/mPoint.do")) {
			service = new MPointService();
			service.execute(request, response);
			viewPage = "member/mPoint.jsp";
		}else if(command.equals("/mModify.do")) {
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "mMypage.do";
		}else if(command.equals("/mDelete.do")) {
			service = new MDeleteService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(command.equals("/logout.do")) {//session珥덇린�솕
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(command.equals("/mBuyHistory.do")) {
			service = new MBuyHistoryService();
			service.execute(request, response);
			viewPage = "member/mBuyHistory.jsp";
		}else if(command.equals("/mBuyDetail.do")) {// 援щℓ �긽�꽭
			service = new MBuyDetailService();
			service.execute(request, response);
			viewPage = "member/mBuyDetail.jsp";
		}else if(command.equals("/mDelivery.do")) {
			service = new MDeliveryService();
			service.execute(request, response);
			viewPage = "member/mDelivery.jsp";
		}else if(command.equals("/mDeliveryArrive.do")) {
			service = new MDeliveryArriveService();
			service.execute(request, response);
			viewPage = "mMypage.do";
		}else if(command.equals("/mCouponView.do")) {
			service = new MCouponViewService();
			service.execute(request, response);
			viewPage = "member/mCoupon.jsp";
		}
		
		
		
		//Manager
		else if(command.equals("/mgjoinView.do")) {
			viewPage = "manager/mgjoin.jsp";
		}else if(command.equals("/mgjoin.do")) {
			service = new MgJoinService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(command.equals("/mgidConfirm.do")) {
			service = new MgidDuplicationCheckService();
			service.execute(request, response);
			viewPage = "message/mgidConfirm.jsp";
		}else if(command.equals("/mgloginView.do")) {
			viewPage = "manager/mglogin.jsp";
		}else if(command.equals("/mglogin.do")) {
			service = new MgloginService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(command.equals("/mgPage.do")) {
			service = new MgPageService();
			service.execute(request, response);
			viewPage = "manager/mgPage.jsp";
		}else if(command.equals("/registProductView.do")) {// 留ㅻ땲�� �긽�뭹�벑濡�
			viewPage = "manager/registProduct.jsp";
		}else if(command.equals("/registProduct.do")) {
			service = new RegistProduct();
			service.execute(request, response);
			viewPage = "productAll.do";
		}else if(command.equals("/mgAddStockProduct.do")) {//�옱怨좎텛媛�
			service = new MgAddStockProductService();
			service.execute(request, response);
			viewPage = "manager/mgAddStockProductMessage.jsp";
		}else if(command.equals("/mgCouponView.do")) {//荑좏룿異붽�酉�
			viewPage = "manager/mgCouponView.jsp";
		}else if(command.equals("/mgCoupon.do")) {//荑좏룿異붽�
			service = new MgCouponService();
			service.execute(request, response);
			viewPage = "manager/mgPage.jsp";
		}else if(command.equals("/mgCalendarView.do")) {//留ㅼ텧議고쉶�떖�젰
			service = new MgCalendarService();
			service.execute(request, response);
			viewPage = "manager/mgSalesinquiry.jsp";
		}else if(command.equals("/memberInquiry.do")) {//硫ㅻ쾭議고쉶
			service = new MemberLookUpService();
			service.execute(request, response);
			viewPage = "manager/memberInquiry.jsp";
		}else if(command.equals("/mgModifyView.do")) {//留ㅻ땲�� �젙蹂댁닔�젙
			service = new MgModifyViewService();
			service.execute(request, response);
			viewPage = "manager/mgModify.jsp";
		}else if(command.equals("/mgModify.do")) {//留ㅻ땲�� �젙蹂댁닔�젙
			service = new MgModifyService();
			service.execute(request, response);
			viewPage = "manager/mgPage.jsp";
		}
		
		//Product
		else if(command.equals("/productAll.do")) {//�쟾泥� �젣�뭹 蹂닿린
			service = new ProductAllService();
			service.execute(request, response);
			viewPage = "board_product/productAll.jsp";
		}else if(command.equals("/productDetail.do")) {//�젣�뭹 �긽�꽭 蹂닿린 + 由щ럭
			service = new ProductDetailService();
			service.execute(request, response);
			viewPage = "board_product/productDetail.jsp";
		}else if(command.equals("/cartAddProduct.do")) {//�옣諛붽뎄�땲 �젣�뭹 異붽�
			service = new CartAddProduct();
			service.execute(request, response);
			viewPage = "board_product/productAddCartMessage.jsp";
		}else if(command.equals("/modifyProductView.do")) { //�긽�뭹�닔�젙酉�
			service = new ProductModifyViewService();
			service.execute(request, response);
			viewPage = "board_product/productModify.jsp";
		}else if(command.equals("/modifyProduct.do")) { //�긽�뭹�닔�젙
			service = new ProductModifyService();
			service.execute(request, response);
			viewPage = "productAll.do";
		}
		
		// 移댄듃
		else if(command.equals("/cartView.do")) {//移댄듃蹂닿린
			service = new CartViewService();
			service.execute(request, response);
			viewPage = "cart/cartView.jsp";
		}else if(command.equals("/cartDelProduct.do")) {//移댄듃�뿉�꽌 臾쇳뭹 �궘�젣
			service = new CartDelProductService();
			service.execute(request, response);
			viewPage = "cartView.do";
		}else if(command.equals("/cartBuyProduct.do")) {//移댄듃�뿉�꽌 臾쇳뭹 援щℓ
			service = new CartBuyProductService();
			service.execute(request, response);
			viewPage = "board_product/productPurchaseConfirm.jsp";
		}
		
		//寃곗젣
		else if(command.equals("/payment.do")) {//寃곗젣 �씠�룞�럹�씠吏�
			service = new PaymentService();
			service.execute(request, response);
			viewPage = "board_product/productPurchaseAfter.jsp";
		}
		
		//由щ럭
		else if(command.equals("/rGoodPlus.do")) {//醫뗭븘�슂
			service = new RGoodPlusService();
			service.execute(request, response);
			viewPage = "board_review/pRGoodMessage.jsp";
		}else if(command.equals("/rCommentWrite.do")) {//愿�由ъ옄 由щ럭 �뙎湲� �옉�꽦
			service = new RCommentWriteService();
			service.execute(request, response);
			viewPage = "productDetail.do?pcode="+(String)request.getAttribute("pcode").toString();
		}else if(command.equals("/rCommentView.do")) {//由щ럭 �뙎湲� 蹂닿린
			service = new RCommentViewService();
			service.execute(request, response);
			viewPage = "board_review/pRcMessage.jsp";
		}else if(command.equals("/rWrite.do")) {//由щ럭�벐湲�
			service = new RWriteService();
			service.execute(request, response);
			viewPage = "productDetail.do?pcode="+(String)request.getAttribute("pcode").toString();
		}
		
		
		
		//csBoards
		else if(command.equals("/csBoardsListService.do")) {//怨좉컼�꽱�꽣由ъ뒪�듃
			service = new CsBoardsListService();
			service.execute(request, response);
			viewPage = "board_cs/customerService.jsp";
		}else if(command.equals("/csBoardWriteView.do")) {//怨좉컼�꽱�꽣湲��벐湲� ono異붽�
			service = new CsBoardWriteView();
			service.execute(request, response);
			viewPage = "board_cs/customerServiceWrite.jsp";
		}else if(command.equals("/csBoardWrite.do")) {//怨좉컼�꽱�꽣湲��벐湲�
			service = new CsBoardWrite();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/csBoardsSecretCheck.do")) {//鍮꾨�湲� �솗�씤
			service = new CsBoardsSecretCheckService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsSecretCheck.jsp";
		}else if(command.equals("/csBoardsDetail.do")) {//cs湲� �긽�꽭蹂닿린
			service = new CsBoardsDetailService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsDetail.jsp";
		}else if(command.equals("/csBoardModifyView.do")) {//�닔�젙�솕硫�
			service = new CsBoardsModifyViewService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsModify.jsp";
		}else if(command.equals("/csBoardModify.do")) {//�닔�젙�떎�뻾
			service = new CsBoardsModifyService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/csBoardsDelete.do")) {//�궘�젣�떎�뻾
			service = new CsBoardsDeleteService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/cmCommentWrite.do")) {//愿�由ъ옄 肄붾찘�듃�옉�꽦
			service = new CmCommentWriteService();
			service.execute(request, response);
			viewPage = "csBoardsDetail.do?cno="+(String)request.getAttribute("cno").toString();
		}else if(command.equals("/csBoardsReplyView.do")) {
			service = new CsBoardReplyViewService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsReply.jsp";
		}else if(command.equals("/csBoardsReply.do")) {//�떟蹂� �떎�뻾
			service = new CsBoardReplyService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}
