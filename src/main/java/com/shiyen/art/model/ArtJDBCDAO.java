package com.shiyen.art.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ArtJDBCDAO implements ArtDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO art (ART_TITLE,ART_CONTENT,ART_TIMESTAMP,ART_REPLY,ART_FAVOR,ART_VIEW) VALUES ( ?, ?, ?, ?, ?,?)";
	private static final String GET_ALL_STMT = "SELECT ART_ID,ART_TITLE,ART_CONTENT,ART_TIMESTAMP,ART_REPLY,ART_FAVOR,ART_VIEW FROM art order by ART_ID";
	private static final String GET_ONE_STMT = "SELECT ART_ID,ART_TITLE,ART_CONTENT,ART_TIMESTAMP,ART_REPLY,ART_FAVOR,ART_VIEW FROM art where ART_ID = ?";
	private static final String DELETE = "DELETE FROM art where ART_ID = ?";
	private static final String UPDATE = "UPDATE art set ART_TITLE = ?,ART_CONTENT = ? ,ART_TIMESTAMP = ?,ART_Reply=?,ART_Favor=?,ART_VIEW = ?  where ART_ID = ? ";

	@Override
	public void insert(ArtVO artVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			String[] col = {"ART_ID"};
			pstmt = con.prepareStatement(INSERT_STMT,col);

			

			pstmt.setString(1, artVO.getArtTitle());
			pstmt.setString(2, artVO.getArtContent());
			pstmt.setTimestamp(3, artVO.getArtTimestamp());
			pstmt.setInt(4, artVO.getArtReply());
			pstmt.setInt(5, artVO.getArtFavor());
			pstmt.setInt(6, artVO.getArtView());

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
	public void update(ArtVO artVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			
			pstmt.setString(1, artVO.getArtTitle());
			pstmt.setString(2, artVO.getArtContent());
			pstmt.setTimestamp(3, artVO.getArtTimestamp());
			pstmt.setInt(4, artVO.getArtReply());
			pstmt.setInt(5, artVO.getArtFavor());
			pstmt.setInt(6, artVO.getArtView());
			pstmt.setInt(7, artVO.getArtId());

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
	public void delete(Integer artId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, artId);

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
	public ArtVO findByPrimaryKey(Integer artId) {
		ArtVO artVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, artId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				artVO = new ArtVO();
				artVO.setArtId(rs.getInt("art_Id"));
				artVO.setArtTitle(rs.getString("art_Title"));
				artVO.setArtContent(rs.getString("art_Content"));
				artVO.setArtTimestamp(rs.getTimestamp("art_Timestamp"));
				artVO.setArtReply(rs.getInt("art_Reply"));
				artVO.setArtFavor(rs.getInt("art_Favor"));
				artVO.setArtView(rs.getInt("art_View"));
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
		return artVO;
	}

	@Override
	public List<ArtVO> getAll() {
		List<ArtVO> list = new ArrayList<ArtVO>();
		ArtVO artVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				artVO = new ArtVO();
				artVO.setArtId(rs.getInt("art_Id"));
				artVO.setArtTitle(rs.getString("art_Title"));
				artVO.setArtContent(rs.getString("art_Content"));
				artVO.setArtTimestamp(rs.getTimestamp("art_Timestamp"));
				artVO.setArtReply(rs.getInt("art_Reply"));
				artVO.setArtFavor(rs.getInt("art_Favor"));
				artVO.setArtView(rs.getInt("art_View"));
				list.add(artVO); // Store the row in the list
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
		return list;
	}

	public static void main(String[] args) {

		ArtJDBCDAO dao = new ArtJDBCDAO();
//		Timestamp current = new Timestamp(System.currentTimeMillis());
//		// 新增
//		ArtVO artVO1 = new ArtVO();
//		
//		
//		
//		artVO1.setArtTitle("生命的超越者 - 杰倫達爾默");
//		artVO1.setArtContent("大家好，我是來自");
//		artVO1.setArtTimestamp(current);
//		artVO1.setArtReply(2);
//		artVO1.setArtFavor(1);
//		artVO1.setArtView(12);
//		dao.insert(artVO1);
//
		// 修改
//		ArtVO artVO2 = new ArtVO();
//		artVO2.setArtId(1);
//		artVO2.setArtTitle("生命的超越者 - 杰倫達爾默");
//		artVO2.setArtContent("大家好，我是來自");
//		artVO2.setArtTimestamp(current);
//		artVO2.setArtReply(null);
//		artVO2.setArtFavor(1);
//		artVO2.setArtView(12);
//		dao.insert(artVO2);
//
//		// 刪除
//		dao.delete(1);

//		 查詢
		ArtVO artVO3 = dao.findByPrimaryKey(2);
		System.out.print(artVO3.getArtId() + ",");
		System.out.print(artVO3.getArtTitle() + ",");
		System.out.print(artVO3.getArtContent() + ",");
		System.out.print(artVO3.getArtTimestamp() + ",");
		System.out.print(artVO3.getArtReply() + ",");
		System.out.print(artVO3.getArtFavor()+ ",");
		System.out.print(artVO3.getArtView()+ ",");
		System.out.println("---------------------");
//		// 查詢
//		List<ArtVO> list = dao.getAll();
//		for (ArtVO aArt : list) {
//			System.out.print(aArt.getArtId() + ",");
//			System.out.print(aArt.getArtTitle() + ",");
//			System.out.print(aArt.getArtContent() + ",");
//			System.out.print(aArt.getArtTimestamp() + ",");
//			System.out.print(aArt.getArtReply() + ",");
//			System.out.print(aArt.getArtFavor() + ",");
//			System.out.print(aArt.getArtView() + ",");
//			System.out.println();
		}
	}
//}
