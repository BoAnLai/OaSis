package com.comment.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiahong.comment.model.CommentService;
import com.jiahong.comment.model.CommentVO;

public class CommentServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
			Integer str = Integer.valueOf(req.getParameter("commentId"));
			if (str == null) {
				errorMsgs.add("�п�J�����s��");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/comment/select_page.jsp");
				failureView.forward(req, res);
				return;// �{�����_
			}

			Integer commentId = null;
			try {
				commentId = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("�����s���榡�����T");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/comment/select_page.jsp");
				failureView.forward(req, res);
				return;// �{�����_
			}

			/*************************** 2.�}�l�d�߸�� *****************************************/
			CommentService commentSvc = new CommentService();
			CommentVO commentVO = commentSvc.getOneComment(commentId);
			if (commentVO == null) {
				errorMsgs.add("�d�L���");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/comment/select_page.jsp");
				failureView.forward(req, res);
				return;// �{�����_
			}

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
			req.setAttribute("commentVO", commentVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/comment/listOneComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer commentId = Integer.valueOf(req.getParameter("commentId"));

			/*************************** 2.�}�l�d�߸�� ****************************************/
			CommentService commentSvc = new CommentService();
			CommentVO commentVO = commentSvc.getOneComment(commentId);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			req.setAttribute("commentVO", commentVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/comment/update_comment_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // �Ӧ�update_comment_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
			Integer commentId = Integer.valueOf(req.getParameter("commentId").trim());

			Integer commentProductId = Integer.valueOf(req.getParameter("commentProductId"));
			if (commentProductId == null) {
				errorMsgs.add("���~�s��: �ФŪť�");
			}

			CommentVO commentVO = new CommentVO();
			commentVO.setCommentId(commentId);
			commentVO.setCommentProductId(commentProductId);
			commentVO.setCommentText(req.getParameter("commentText"));
			commentVO.setCommentImg(req.getParameter("commentImg"));
			commentVO.setCommentTimestamp(Timestamp.from(Instant.now()));
			commentVO.setCommentRateStars(req.getParameter("commentRateStars"));

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("commentVO", commentVO); // �t����J�榡���~��empVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("/comment/update_comment_input.jsp");
				failureView.forward(req, res);
				return; // �{�����_
			}

			/*************************** 2.�}�l�ק��� *****************************************/
			CommentService commentSvc = new CommentService();
			commentSvc.update(commentVO);

			/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
			req.setAttribute("commentVO", commentVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
			String url = "/comment/listOneComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneComment.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // �Ӧ�addComment.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
			Integer commentProductId = Integer.valueOf(req.getParameter("commentProductId"));
			if (commentProductId == null) {
				errorMsgs.add("���~�s��: �ФŪť�");
			}

			CommentVO commentVO = new CommentVO();
			commentVO.setCommentProductId(commentProductId);
			commentVO.setCommentText(req.getParameter("commentText"));
			commentVO.setCommentImg(req.getParameter("commentImg"));
			commentVO.setCommentTimestamp(Timestamp.from(Instant.now()));
			commentVO.setCommentRateStars(req.getParameter("commentRateStars"));

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("commentVO", commentVO); // �t����J�榡���~��commetVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("/comment/addComment.jsp");
				failureView.forward(req, res);
				return; // �{�����_
			}

			/*************************** 2.�}�l�ק��� *****************************************/
			CommentService commentSvc = new CommentService();
			commentSvc.insert(commentVO);

			/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
			String url = "/comment/listAllComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllComment.jsp
			successView.forward(req, res);
		}
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� ***************************************/
			Integer commentId = Integer.valueOf(req.getParameter("commentId"));

			/*************************** 2.�}�l�R����� ***************************************/
			CommentService commentSvc = new CommentService();
			commentSvc.delete(commentId);

			/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
			String url = "/comment/listAllComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
			successView.forward(req, res);
		}
	}
}
