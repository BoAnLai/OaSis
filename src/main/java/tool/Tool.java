package tool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Tool {

	public static final String DRIVER="com.mysql.cj.jdbc.Driver";
	public static final String URL="jdbc:mysql://localhost:3306/OasisProject?serverTimezone=Asia/Taipei";
	public static final String USERID="root";
	public static final String PASSWORD="123456";
	
	
	public static void closeResources(Connection con,PreparedStatement pstmt,ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
