package com.lee.waiting.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lee.waiting.model.WaitingDaoImpl;
import com.lee.waiting.model.WaitingInterface;
import com.lee.waiting.model.WaitingService;
import com.lee.waiting.model.WaitingVO;
import com.lee.waitingperson.model.WaitingPersonDao;
import com.lee.waitingperson.model.WaitingPersonInterface;
import com.lee.waitingperson.model.WaitingPersonService;
import com.lee.waitingperson.model.WaitingPersonVO;


public class WaitingServlet extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req,res);
	}

	
	String url="lee/waiting/waiting_select.jsp";
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		//以下為單一搜尋
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			System.out.println("執行於此");
			List<String> errorMsgs = new LinkedList<String>();
			
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("waino");
				
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入組隊編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher(url); //把錯誤字串秀到指定頁面上
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer waino = null;
				try {
					waino = Integer.valueOf(str); //把抓到的值丟給此變數
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher(url); //把錯誤字串秀到指定頁面上
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				WaitingService waiSvc = new WaitingService();
				WaitingVO waiVO = waiSvc.getOneEmp(waino);
				if (waiVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("waiVO", waiVO); // 資料庫取出的empVO物件,存入req
				req.setAttribute("sin", "D");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}
		
		
		
		
	
			//以下為新增
			if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			System.out.println("新增部分");
			List<String> errorMsgs = new LinkedList<String>();
			List<String> successMsgs = new LinkedList<String>();
			
			int userid = 0;
			

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String ename = req.getParameter("userid");
				String enameReg = "^[0-9]{1,2}$";
				if (ename == null || ename.trim().length() == 0) {
					errorMsgs.add("房主編號: 請勿空白");
				} else if(!ename.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("房主編號:只能是數字,且字元長度必須為1到2");
	            }else {
	            	userid=Integer.parseInt(ename);
	            }

				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String reserveParam = req.getParameter("reserve").trim();
				Timestamp waitingReserve = null;
				
				if(reserveParam != null ) {
					try {
						java.util.Date parsedDate = sdf.parse(reserveParam);
						waitingReserve = new Timestamp(parsedDate.getTime());
//						
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
						errorMsgs.add("請輸入日期!");
					} catch (ParseException e) {
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

//				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {	
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = req
							.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;
				}
				
//				/**************************抓到Person的最後自增主鍵值********************
				WaitingInterface wt=new WaitingDaoImpl();
				Integer waiTotal=wt.getTotal().size()+1;//用於Person的房號		
				System.out.println("-+-=-=-=-=-=-=-=-=-=-"+waiTotal);
							
//				/***************************2.開始新增資料***************************************/
				WaitingService waiSvc = new WaitingService();
				WaitingVO waiVO = waiSvc.addEmp(userid,waitingReserve,max,waitingGame);
				
				
				/***************************這邊做WaitingPerson連結加入**************************/
				WaitingPersonService waipSvc=new WaitingPersonService();
				WaitingPersonVO waipVO=waipSvc.addPerson(waiTotal,userid);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
							
				successMsgs.add("創建完成!房間編號為:"+waiTotal);
				req.setAttribute("successMsgs", successMsgs);
				
				RequestDispatcher successView = req.getRequestDispatcher(url);		
				successView.forward(req, res);	
		}
			
			//以下為單筆資料更新
			if ("myRoom_Revise".equals(action)) { // 來自listAllEmp.jsp的請求
				System.out.println("此為更新");
				
				
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
			//以下為更新頁面的提交
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
					errorMsgs.add("人數格式錯誤");
				}
				
				String gameName = null;
				try {

					gameName = String.valueOf(req.getParameter("game").trim());
				} catch (Exception e) {
					maxpeople = 0;
					errorMsgs.add("遊戲類型格式錯誤");
				}
				
				//------------------更新前檢查房間內人數
				
				
				
				WaitingPersonInterface wpt=new WaitingPersonDao();
				List<WaitingPersonVO> wpList=wpt.getAll(waitno);//waitno為房間編號
				Integer waipTotal=(wpList.size());//當前房間人數
				
				System.out.println("房間目前人數----------"+waipTotal);
				System.out.println("設定人數----------"+maxpeople);
				
				if(maxpeople<waipTotal) {
					errorMsgs.add("當前房間人數為"+waipTotal+"人!請先踢除");
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
					req.setAttribute("errorMsgs", errorMsgs);
					
					RequestDispatcher failureView = req
							.getRequestDispatcher("lee/waiting/update_wai_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				WaitingService waiSvc = new WaitingService();
				waiVO = waiSvc.update(waitno,userid,waitingReserve, maxpeople,gameName);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("waiVO", waiVO); // 資料庫update成功後,正確的的empVO物件,存入req
				HttpSession session=req.getSession();
				session.setAttribute("sin", "A");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				}
			
			/******************************Select頁面 導入選擇性include   *****************************************/
				if ("select_AllWait".equals(action)) {
					System.out.println("執行於此了1");
					HttpSession session = req.getSession();
					session.setAttribute("sin", "A");
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
					}
				
	
				if ("select_AddWait".equals(action)) {
					System.out.println("執行於此了2");
					HttpSession session = req.getSession();
					session.setAttribute("sin", "B");
					
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
					}
				
				
				//以下為查看隊伍內成員
				if ("select_waitingPerson".equals(action)) { // 來自listAllEmp.jsp的請求
					System.out.println("查看列隊2");
					
					
						/***************************1.接收請求參數****************************************/
						Integer waino = Integer.valueOf(req.getParameter("waino"));//--拿對房間編號
						
						System.out.println(waino);
						
						
										
						/***************************2.準備轉交(Send the Success view)************/
						String check=req.getParameter("check");//-------只有開房者能拿到YES
						
						        // 資料庫取出的empVO物件,存入req
						String url = "lee/waitingPerson/WaitingPersonAll.jsp";
						
						if(check.equals("Yes")) {
							System.out.println("是本人");
						}else {
							System.out.println("不是本人");
						}
						req.setAttribute("waiVO", waino);
						req.setAttribute("check", check);
						
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
				}
				
				//以下為加入隊伍
				if ("add_Person".equals(action)) { // 來自listAllEmp.jsp的請求
					System.out.println("加入隊伍");
						
					
					List<String> errorMsgs2 = new LinkedList<String>();
					List<String> successMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs2);
					req.setAttribute("successMsgs", successMsgs);
					
					/***************************1.接收請求參數****************************************/
					Integer waino = Integer.valueOf(req.getParameter("waino"));//-----拿到房間編號
					Integer waimax = Integer.valueOf(req.getParameter("waimax"));//---拿到人數上限
						
					WaitingPersonInterface wpt=new WaitingPersonDao();
					List<WaitingPersonVO> wpList=wpt.getAll(waino);
					
					//以下為判斷房內使用者
					WaitingPersonVO wp=null;
					Integer waipTotal=(wpList.size());//-----拿到目前房間內人數
					for (int i = 0; i < wpList.size(); i++) {
					     wp = wpList.get(i);
					     Integer userno=wp.getWaitingPersonUserID();
					     
					     if(userno==3) {//這邊要放進使用者編號!
								errorMsgs2.add("您已經在此隊伍中，不可重複加入!");
								RequestDispatcher failureView = req.getRequestDispatcher(url); //把錯誤字串秀到指定頁面上
								failureView.forward(req, res);
								return;//程式中斷
					    // 在這裡使用 wp 來處理你需要的操作，比如打印或者其他處理
					     }
					}
						
					if(waipTotal>=waimax) {
						errorMsgs2.add("目前房間已滿");
						RequestDispatcher failureView = req.getRequestDispatcher(url); //把錯誤字串秀到指定頁面上
						failureView.forward(req, res);
						return;//程式中斷
							
					}else {
							
						WaitingPersonVO waipVO=new WaitingPersonVO();
						waipVO.setWaitingPersonWaitingID(waino);
						waipVO.setWaitingPersonUserID(3);//這邊要改  抓使用者編號
						
						WaitingPersonService waipSvc=new WaitingPersonService();
						waipVO=waipSvc.addPerson(waino,3);
						successMsgs.add("您已成功加入:"+waino+"號房間");
					}

						
						RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
						successView.forward(req, res);
				}
				//觀看自己開的房間
				if ("select_MyRoom".equals(action)) {
					System.out.println("我開的房間");
					
					req.setAttribute("situation","my");
					req.setAttribute("userID", 3);//這邊要抓使用者編號
					req.setAttribute("sin", "C");
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);
					
					
					}
				//觀察已加入那些隊伍
				if ("select_InRoom".equals(action)) {
					System.out.println("我開的房間");
					
					req.setAttribute("situation","in");//--藉由丟狀態 讓接的jsp知道是要哪個資料 不用寫兩分jsp
					req.setAttribute("userID", 3);//這邊要抓使用者編號
					req.setAttribute("sin", "C");
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
					successView.forward(req, res);
					
					
					}
				
				
				//刪除自己開的房間
				if ("delect_Allroom".equals(action)) {
					
					List<String> successMsgs1 = new LinkedList<String>();
					System.out.println("關閉房間");
					
					Integer waitingId= Integer.valueOf(req.getParameter("waiNo"));//---拿到房間編號
					Integer waitinguUserId= Integer.valueOf(req.getParameter("waiUserno"));//---拿到使用者編號
					//免拿預約時間，設定過期時間
					Integer waitingMaxpeople= Integer.valueOf(req.getParameter("waiMax"));//---拿到人數上限
					String waitingGame= req.getParameter("waiGame");//---拿到遊戲類型
					WaitingService waiSvc = new WaitingService();
					
					System.out.println(waitingId);
					System.out.println(waitinguUserId);
					System.out.println(waitingMaxpeople);
					System.out.println(waitingGame);
					Calendar calendar = Calendar.getInstance();
			        calendar.set(2024, Calendar.MAY, 5, 0, 0, 0);

			        // 从Calendar对象获取时间戳
			        Timestamp timestamp = new Timestamp(calendar.getTimeInMillis());
					waiSvc.update(waitingId, waitinguUserId,timestamp, waitingMaxpeople, waitingGame);
					
					successMsgs1.add("完成刪除"+waitingId+"號列隊");
					req.setAttribute("successMsgs1", successMsgs1);
					req.setAttribute("userID", 3);//放入當前使用者編號
					
					req.setAttribute("sin", "C");
					
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
					}
				//踢除房內使用者
				if ("delect_roomPeople".equals(action)) {
					List<String> errorMsgs2 = new LinkedList<String>();
					List<String> successMsgs2 = new LinkedList<String>();
					
					
					
					Integer waitId=Integer.valueOf(req.getParameter("waitId"));//為房間編號---------
					Integer userno=Integer.valueOf(req.getParameter("userno"));//為使用者----------
					Integer waipno=Integer.valueOf(req.getParameter("waitpId"));//為PK----------
					
					System.out.println(waitId);
					System.out.println(userno);
					System.out.println("房間ID-----------"+waipno);
					System.out.println("以上為剔除");
					if(userno==3/*這邊要抓使用者*/) {
						errorMsgs2.add("不可以剔除開房者");
						
						req.setAttribute("waiVO",waitId);
						req.setAttribute("check","Yes");
						req.setAttribute("errorMsgs2", errorMsgs2);
						RequestDispatcher successView = req.getRequestDispatcher("lee/waitingPerson/WaitingPersonAll.jsp"); 
						successView.forward(req, res);
						return;
						
					}
					
					WaitingPersonVO waipVO=new WaitingPersonVO();
					waipVO.setWaitingPersonWaitingID(waitId);
					waipVO.setWaitingPersonUserID(userno);
					
					WaitingPersonService waipSvc=new WaitingPersonService();
					waipSvc.delectRoomPerson(waipno);
					
				
					successMsgs2.add("刪除"+userno+"號玩家成功");
					req.setAttribute("waiVO", waitId);
					req.setAttribute("check", "Yes");
					req.setAttribute("successMsgs2",successMsgs2);
					
					RequestDispatcher successView = req.getRequestDispatcher("lee/waitingPerson/WaitingPersonAll.jsp"); 
					successView.forward(req, res);
				
				}
				
				//以下為隊伍內成員離開
				if ("leave_waitingPerson".equals(action)) { // 來自listAllEmp.jsp的請求
					System.out.println("離開隊伍");
					
					
						/***************************1.接收請求參數****************************************/
						Integer waino = Integer.valueOf(req.getParameter("waino"));//--拿對房間編號
									
						
						WaitingPersonService waipSvc=new WaitingPersonService();
						//要做尋找---wiatingPerson表格:waitingID=? WaitingUserID=?拿到PK 丟進去
						Integer PK/*拿到Person的PK*/=waipSvc.serchPK(waino,3);//這邊要放進使用者編號;
						
						if(PK!=-1) {							
							waipSvc.delectRoomPerson(PK);
						}
						
						System.out.println("已經離開此房間");
						
						req.setAttribute("situation","in");//--藉由丟狀態 讓接的jsp知道是要哪個資料 不用寫兩分jsp
						req.setAttribute("userID", 3);
						req.setAttribute("sin", "C");
						RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
						successView.forward(req, res);
						
				}

				
		}
	}

