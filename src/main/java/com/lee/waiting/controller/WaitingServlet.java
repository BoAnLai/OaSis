package com.lee.waiting.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lee.lobbychatter.model.WaitingService;
import com.lee.waiting.model.WaitingVO;





public class WaitingServlet extends HttpServlet {

	
	String url="lee/waiting/waiting_select.jsp";
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		//以下為單一搜尋
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			System.out.println("執行於此");
			List<String> errorMsgs1 = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs1);
				System.out.println("getOne_For_Display");
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("waino");
				
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs1.add("請輸入組隊編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs1.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url); //把錯誤字串秀到指定頁面上
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer waino = null;
				try {
					waino = Integer.valueOf(str); //把抓到的值丟給此變數
				} catch (Exception e) {
					errorMsgs1.add("編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs1.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url); //把錯誤字串秀到指定頁面上
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				WaitingService waiSvc = new WaitingService();
				WaitingVO waiVO = waiSvc.getOneEmp(waino);
				if (waiVO == null) {
					errorMsgs1.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs1.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("waiVO", waiVO); // 資料庫取出的empVO物件,存入req
				String url1 = "lee/waiting/waiting_selectOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url1); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}
		
		
		
		
	
			//以下為新增
			if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			System.out.println("新增部分");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			int enamenum = 0;
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String ename = req.getParameter("userid");
				String enameReg = "^[0-9]{1,2}$";
				if (ename == null || ename.trim().length() == 0) {
					errorMsgs.add("房主編號: 請勿空白");
				} else if(!ename.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("房主編號:只能是數字,且字元長度必須為1到2");
	            }else {
	            	enamenum=Integer.parseInt(ename);
	            }

				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String reserveParam = req.getParameter("reserve").trim();
//				System.out.println(reserveParam);
				Timestamp waitingReserve = null;
				
				if(reserveParam != null ) {
					try {
						java.util.Date parsedDate = sdf.parse(reserveParam);
						waitingReserve = new Timestamp(parsedDate.getTime());
//						System.out.println(waitingReserve);
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
//						reserve=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
								
				
				int max ;
				try {
					max = Integer.valueOf(req.getParameter("max").trim());
				} catch (NumberFormatException e) {
					max = 0;
					errorMsgs.add("請輸入列隊人數上限");
				}
				String waitingGame=req.getParameter("game");

				WaitingVO waiVO = new WaitingVO();
				waiVO.setWaitingUserId(enamenum);
				waiVO.setWaitingReserve(waitingReserve);
				waiVO.setWaitingMaxPeople(max);
				waiVO.setWaitingGameName(waitingGame);
				

//				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("waiVO", waiVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("lee/waiting/waiting_select.jsp");
					failureView.forward(req, res);
					return;
				}
//				
//				/***************************2.開始新增資料***************************************/
				WaitingService waiSvc = new WaitingService();
				waiVO = waiSvc.addEmp(enamenum,waitingReserve,max,waitingGame);
				System.out.println(waitingGame);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				HttpSession session=req.getSession();
				session.setAttribute("sin", true);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
		}
			
			//以下為單筆資料更新
			if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
				System.out.println("此為更新");
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
					/***************************1.接收請求參數****************************************/
					Integer waino = Integer.valueOf(req.getParameter("waino"));
					System.out.println(waino);
					
					/***************************2.開始查詢資料****************************************/
					WaitingService waiSvc = new WaitingService();
					WaitingVO waiVO = waiSvc.getOneEmp(waino);
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("waiVO", waiVO);         // 資料庫取出的empVO物件,存入req
					String url = "lee/waiting/update_wai_input.jsp";
					
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(req, res);
			}
			
			if ("update".equals(action)) { // 來自update_wai_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer waitno = Integer.valueOf(req.getParameter("waino").trim());
				
				Integer userid = null;
				try {

					userid = Integer.valueOf(req.getParameter("user").trim());
				} catch (NumberFormatException e) {
					userid = 0;
					errorMsgs.add("房主編號請輸入數字.");
				}
				
				

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String reserveParam = req.getParameter("reserve").trim();
//				System.out.println(reserveParam);
				Timestamp waitingReserve = null;
				
				if(reserveParam != null ) {
					try {
						java.util.Date parsedDate = sdf.parse(reserveParam);
						waitingReserve = new Timestamp(parsedDate.getTime());
				}catch(IllegalArgumentException e){
					waitingReserve=new Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
				
				Integer maxpeople = null;
				try {

					maxpeople = Integer.valueOf(req.getParameter("max").trim());
				} catch (NumberFormatException e) {
					maxpeople = 0;
					errorMsgs.add("薪水請填數字.");
				}
				
				String gameName = null;
				try {

					gameName = String.valueOf(req.getParameter("game").trim());
				} catch (Exception e) {
					maxpeople = 0;
					errorMsgs.add("遊戲類型格式錯誤");
				}

				
				WaitingVO waiVO = new WaitingVO();
				
				waiVO.setWaitingID(waitno);
				waiVO.setWaitingUserId(userid);
				waiVO.setWaitingReserve(waitingReserve);
				waiVO.setWaitingMaxPeople(maxpeople);
				waiVO.setWaitingGameName(gameName);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("waiVO", waiVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("update_wai_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				WaitingService waiSvc = new WaitingService();
				waiVO = waiSvc.update(waitno,userid,waitingReserve, maxpeople,gameName);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("waiVO", waiVO); // 資料庫update成功後,正確的的empVO物件,存入req
				HttpSession session=req.getSession();
				session.setAttribute("sin", true);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				}
			
			/******************************Select頁面 導入選擇性include   *****************************************/
				if ("select_AllWait".equals(action)) {
					System.out.println("執行於此了1");
					HttpSession session = req.getSession();
					session.setAttribute("sin", true);
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
					}
				
	
				if ("select_AddWait".equals(action)) {
					System.out.println("執行於此了2");
					HttpSession session = req.getSession();
					session.setAttribute("sin", false);
					
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
					}
				}
		
	}

