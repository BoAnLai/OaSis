package com.jiahong.comment.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class CommentJDBCDAO implements CommentDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/oasis?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO comment (comment_product_id, comment_text, comment_img, comment_timestamp, comment_rate_stars) VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE comment set comment_text = ?, comment_img = ?, comment_rate_stars = ?, comment_timestamp = ? where comment_id = ?";
	private static final String DELETE_Comt_STMT = "DELETE FROM comment where comment_id = ?";

	private static final String GET_ONE_STMT = "SELECT comment_id, comment_product_id, comment_text, comment_img, comment_timestamp, comment_rate_stars  FROM comment where comment_id = ?";
	private static final String GET_ALL_STMT = "SELECT comment_id, comment_product_id, comment_text, comment_img, comment_timestamp, comment_rate_stars  FROM comment";
	private static final String GET_Comts_ByProductId_STMT = "SELECT comment_id, comment_product_id, comment_text, comment_timestamp, comment_rate_stars  FROM comment";

	@Override
	public void insert(CommentVO commentVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, commentVO.getCommentProductId());
			pstmt.setString(2, commentVO.getCommentText());
			pstmt.setString(3, commentVO.getCommentImg());
			pstmt.setTimestamp(4, Timestamp.from(Instant.now()));
			pstmt.setString(5, commentVO.getCommentRateStars());

			pstmt.executeUpdate("set auto_increment_offset=10;");
			pstmt.executeUpdate("set auto_increment_increment=10;");
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(CommentVO commentVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, commentVO.getCommentText());
			pstmt.setString(2, commentVO.getCommentImg());
			pstmt.setString(3, commentVO.getCommentRateStars());
			pstmt.setTimestamp(4, Timestamp.from(Instant.now()));
			pstmt.setInt(5, commentVO.getCommentId());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer comment_id) {
		int updateCount_EMPs = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			// 1���]�w�� pstm.executeUpdate()���e
			con.setAutoCommit(false);

			// �R������
			pstmt = con.prepareStatement(DELETE_Comt_STMT);
			pstmt.setInt(1, comment_id);
			pstmt.executeUpdate();

			// 2���]�w�� pstm.executeUpdate()����
			con.commit();
			con.setAutoCommit(true);
			System.out.println("�R�������s��" + comment_id + "��,�@�����u" + updateCount_EMPs + "�H�P�ɳQ�R��");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3���]�w���exception�o�ͮɤ�catch�϶���
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public CommentVO findByPrimaryKey(Integer comment_id) {

		CommentVO commentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, comment_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// commentVO �]�٬� Domain objects
				commentVO = new CommentVO();
				commentVO.setCommentId(rs.getInt("comment_id"));
				commentVO.setCommentProductId(rs.getInt("comment_product_id"));
				commentVO.setCommentText(rs.getString("comment_text"));
				commentVO.setCommentImg(rs.getString("comment_img"));
				commentVO.setCommentTimestamp(rs.getTimestamp("comment_timestamp"));
				commentVO.setCommentRateStars(rs.getString("comment_rate_stars"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return commentVO;
	}

	@Override
	public List<CommentVO> getAll() {
		List<CommentVO> list = new ArrayList<CommentVO>();
		CommentVO commentVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				commentVO = new CommentVO();
				commentVO.setCommentId(rs.getInt("comment_id"));
				commentVO.setCommentProductId(rs.getInt("comment_product_id"));
				commentVO.setCommentText(rs.getString("comment_text"));
				commentVO.setCommentImg(rs.getString("comment_img"));
				commentVO.setCommentTimestamp(rs.getTimestamp("comment_timestamp"));
				commentVO.setCommentRateStars(rs.getString("comment_rate_stars"));
				list.add(commentVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public Set<CommentVO> getCommentByCommentProductId(Integer commentProductId) {
		Set<CommentVO> comments = new HashSet<>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_Comts_ByProductId_STMT);
			pstmt.setInt(1, commentProductId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setCommentId(rs.getInt("comment_id"));
				comment.setCommentProductId(rs.getInt("comment_product_id"));
				comment.setCommentText(rs.getString("comment_text"));
				comment.setCommentImg(rs.getString("comment_img"));
				comment.setCommentTimestamp(rs.getTimestamp("comment_timestamp"));
				comment.setCommentRateStars(rs.getString("comment_rate_stars"));
				// Set other properties as needed
				comments.add(comment);
			}
		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException("Error in retrieving comments by product ID: " + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return comments;
	}

	public static void main(String[] args) {

		CommentJDBCDAO dao = new CommentJDBCDAO();

		// �s�W
		CommentVO comment1 = new CommentVO();
		comment1.setCommentProductId(123);
		comment1.setCommentText("123");
		comment1.setCommentImg("123");
		comment1.setCommentTimestamp(Timestamp.from(Instant.now()));
		comment1.setCommentRateStars("123");
		dao.insert(comment1);

		// �ק�
		CommentVO comment2 = new CommentVO();
		comment2.setCommentProductId(456);
		comment2.setCommentText("456");
		comment2.setCommentImg("456");
		comment2.setCommentTimestamp(Timestamp.from(Instant.now()));
		comment2.setCommentRateStars("456");
		dao.update(comment2);

		// �R��
//		dao.delete(30);

		// �d��
		CommentVO commentVO3 = dao.findByPrimaryKey(10);
		System.out.print(commentVO3.getCommentId() + ",");
		System.out.print(commentVO3.getCommentProductId() + ",");
		System.out.println(commentVO3.getCommentRateStars());
		System.out.println("---------------------");

	}
}
