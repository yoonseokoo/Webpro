package com.project.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.project.dto.ProductDto;

public class ProductDao {
	private ProductDao() {
	}
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static ProductDao instance = new ProductDao();

	public static ProductDao getInstance() {
		return instance;
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		Context ctx = null;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	// Admin
	public boolean addProduct(String pId, String pName, String pGroup, int pPrice, int pDiscount, String pImage,
			int pStock, String pDescription) {
		boolean result = false;
		String sql = "INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE, PDISCOUNT, PIMAGE, PSTOCK,PDESCRIPTION)  "
				+ "    VALUES (PRODUCT_SEQ.NEXTVAL, ? , ? , ? , ? , ? , ? , ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pName);
			pstmt.setString(2, pGroup);
			pstmt.setInt(3, pPrice);
			pstmt.setInt(4, pDiscount);
			pstmt.setString(5, pImage);
			pstmt.setInt(6, pStock);
			pstmt.setString(7, pDescription);
			result = pstmt.executeUpdate() == 1;
		} catch (SQLException e) {
			System.out.println("addProduct 오류:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	public ArrayList<ProductDto> listProduct(String pGroup, int startRow, int endRow) {
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* " + 
				"                                    FROM (SELECT P.*, PGROUPNAME " + 
				"                                                       FROM PRODUCT P, PRODUCT_GROUP G " + 
				"                                                        WHERE P.PGROUP = G.PGROUP " + 
				"                                                        AND P.PGROUP=? " + 
				"                                                        ORDER BY PPRICE, P.PGROUP, PRDATE DESC) " + 
				"                                                                    A) " + 
				"            WHERE (RN BETWEEN ? AND ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pGroup);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String pId = rs.getString("pId");
				String pName = rs.getString("pName");
				int pPrice = rs.getInt("pPrice");
				int pDiscount = rs.getInt("pDiscount");
				String pImage = rs.getString("pImage");
				int pStock = rs.getInt("pStock");
				String pDescription = rs.getString("pDescription");
				int pCumSales = rs.getInt("pCumSales");
				int pReviewCnt = rs.getInt("pReviewCnt");
				double pRating = rs.getDouble("pRating");
				Date pRdate = rs.getDate("pRdate");
				products.add(new ProductDto(pId, pName, pGroup, pPrice, pDiscount, pImage, pStock, pDescription,
						pCumSales, pReviewCnt, pRating, pRdate));
			}
		} catch (SQLException e) {
			System.out.println("listProductErrorMsg :" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		}

		return products;
	}

	
	
	
	public ArrayList<ProductDto> listProductAll(int startRow, int endRow) {
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* " + 
				"                        FROM (SELECT *" + 
				"                                 FROM PRODUCT " +  
				"                                 ORDER BY PPRICE, PRDATE DESC) A)" + 
				"            WHERE (RN BETWEEN ? AND ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String pId = rs.getString("pId");
				String pName = rs.getString("pName");
				String pGroup = rs.getString("pGroup");
				int pPrice = rs.getInt("pPrice");
				int pDiscount = rs.getInt("pDiscount");
				String pImage = rs.getString("pImage");
				int pStock = rs.getInt("pStock");
				String pDescription = rs.getString("pDescription");
				int pCumSales = rs.getInt("pCumSales");
				int pReviewCnt = rs.getInt("pReviewCnt");
				double pRating = rs.getDouble("pRating");
				Date pRdate = rs.getDate("pRdate");
				products.add(new ProductDto(pId, pName, pGroup, pPrice, pDiscount, pImage, pStock, pDescription, pCumSales, pReviewCnt, pRating, pRdate));
			}
		} catch (SQLException e) {
			System.out.println("listProductErrorMsg :" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		}

		return products;
	}

	
	
	public int productCnt(String pGroup) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCT WHERE PGROUP=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pGroup);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		}
		return result;
	}
	
	
	public int productTotCnt() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCT";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		}
		return result;
	}
	/*
	 * public ArrayList<ProductDto> getProductListSort(int startRow, int endRow,
	 * String sortingCriteria, String searchPname) { String sql = ""; if
	 * (sortingCriteria.equals("lowprice")) { sql =
	 * "SELECT * FROM (SELECT ROWNUM RN, A.* " +
	 * "                   FROM (SELECT P.*, PGROUPNAME " +
	 * "                            FROM PRODUCT P, PRODUCT_GROUP G " +
	 * "                            WHERE PNAME LIKE '%'||?||'%' " +
	 * "                            AND P.PGROUP = G.PGROUP" +
	 * "                            ORDER BY PPRICE, PREVIEWCNT DESC) " +
	 * "                         A)" + " WHERE RN BETWEEN ? AND ?"; }else
	 * if(sortingCriteria.equals("pregist")) { sql =
	 * "SELECT * FROM (SELECT ROWNUM RN, A.*" +
	 * "                  FROM (SELECT P.*, PGROUPNAME " +
	 * "                           FROM PRODUCT P, PRODUCT_GROUP G " +
	 * "                           WHERE PNAME LIKE '%'||?||'%'" +
	 * "                           AND P.PGROUP = G.PGROUP " +
	 * "                           ORDER BY PRDATE DESC, PREVIEWCNT DESC) " +
	 * "                        A)" + " WHERE RN BETWEEN ? AND ?"; } else if
	 * (sortingCriteria.equals("pRdate")) { sql =
	 * "    SELECT * FROM (SELECT ROWNUM RN, A.* " +
	 * "                   FROM (SELECT P.*, PGROUPNAME " +
	 * "                            FROM PRODUCT P, PRODUCT_GROUP G " +
	 * "                            WHERE PNAME LIKE '%'||?||'%' " +
	 * "                            AND P.PGROUP = G.PGROUP " +
	 * "                             ORDER BY PREVIEWCNT DESC) " +
	 * "                  		A)" + " WHERE RN BETWEEN ? AND ?";
	 * 
	 * } else if (sortingCriteria.equals("highprice")) { sql =
	 * "   SELECT * FROM (SELECT ROWNUM RN, A.* " +
	 * "             		FROM (SELECT P.*, PGROUPNAME " +
	 * "                      		FROM PRODUCT P, PRODUCT_GROUP G " +
	 * "                      		WHERE PNAME LIKE '%'||?||'%' " +
	 * "                      		AND P.PGROUP = G.PGROUP " +
	 * "                      		ORDER BY PPRICE DESC, PREVIEWCNT ASC) " +
	 * "                       A)" + " WHERE RN BETWEEN ? AND ?"; } return
	 * listProductSQL(startRow, endRow, sql, searchPname); }
	 */

	

	public int getTotalNumberProductSearch(String searchPname) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCT WHERE PNAME LIKE '%'||?||'%'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchPname);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		}
		return result;
	}

	// 상품 상세정보
	public ProductDto productDetail(String pId) {
		ProductDto product = null;
		String sql = " SELECT P.*,PGROUPNAME  FROM PRODUCT P, PRODUCT_GROUP G "
				+ "         WHERE P.PGROUP = G.PGROUP AND PID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String pName = rs.getString("pName");
				String pGroup = rs.getString("pGroup");
				int pPrice = rs.getInt("pPrice");
				int pDiscount = rs.getInt("pDiscount");
				String pImage = rs.getString("pImage");
				int pStock = rs.getInt("pStock");
				String pDescription = rs.getString("pDescription");
				int pCumSales = rs.getInt("pCumSales");
				int pReviewCnt = rs.getInt("pReviewCnt");
				double pRating = rs.getDouble("pRating");
				Date pRdate = rs.getDate("pRdate");
				product = new ProductDto(pId, pName, pGroup, pPrice, pDiscount, pImage, pStock, pDescription, pCumSales,
						pReviewCnt, pRating, pRdate);
			}
		} catch (SQLException e) {
			System.out.println("dd" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return product;
	}

	public boolean modifyProduct(String pname, String pGroup, int pPrice, String pImage, int pStock, String pDescription,
			int pDiscount, String pId) {
		boolean result = false;
		// 정보 수정시 날짜는 최신, 누적판매량은 0으로 초기화
		String sql = "   UPDATE PRODUCT   SET PNAME= ?,   PGROUP= ?, "
				+ "                PPRICE= ? ,   PIMAGE= ? ,   PSTOCK= ? , "
				+ "                PDESCRIPTION= ?,    PDISCOUNT= ?    WHERE PID=?";
		// 1.PNAME 2.PPRICE 3.PIMAGE 4.PSTOCK 5.PDESCRIPTION 6.PDISCOUNT 7.PCODE
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2, pGroup);
			pstmt.setInt(3, pPrice);
			pstmt.setString(4, pImage);
			pstmt.setInt(5, pStock);
			pstmt.setString(6, pDescription);
			pstmt.setInt(7, pDiscount);
			pstmt.setString(8, pId);
			result = pstmt.executeUpdate() == 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	/* public int productStockMinus(String pId, String cartQuantity) {
		int result = FAIL;
		String sql = "UPDATE PRODUCT SET PSTOCK=PSTOCK - ? WHERE PID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartQuantity);
			pstmt.setString(2, pId);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS?"stock updated ":"stock update failed" );
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	} 

	public boolean productStockPlus(String pId, int pcnt) {
		boolean result = false;
		String sql = "UPDATE PRODUCT SET PSTOCK=PSTOCK + ? WHERE PID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcnt);
			pstmt.setString(2, pId);
			result = pstmt.executeUpdate() == 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	} */

	public boolean deleteProduct(String pId) {
		boolean result = false;
		String sql = "DELETE FROM PRODUCT WHERE PID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pId);
			result = pstmt.executeUpdate() == 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}


	
	public ArrayList<ProductDto> listProds(String schName){
		ArrayList<ProductDto> prods = new ArrayList<ProductDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT PID, PNAME, PGROUP, PPRICE, PDISCOUNT, PIMAGE, PSTOCK, PDESCRIPTION, PRDATE FROM PRODUCT  " + 
				"    WHERE PNAME LIKE '%'||UPPER(?)||'%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String pId = rs.getString("pId");
				String pName = rs.getString("pName");
				String pGroup = rs.getString("pGroup");
				int pPrice = rs.getInt("pPrice");
				int pDiscount = rs.getInt("pDiscount");
				String pImage = rs.getString("pImage");
				int pStock = rs.getInt("pStock");
				String pDescription = rs.getString("pDescription");
				Date pRdate = rs.getDate("pRdate");
				
				prods.add(new ProductDto(pId, pName, pGroup, pPrice, pDiscount, pImage, pStock, pDescription, pRdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)    rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return prods;
	}


	/*public boolean pReviewCntPlus(String pId) {
		boolean result = false;
		String sql = "UPDATE PRODUCT SET PREVIEWCNT = PREVIEWCNT+1 WHERE PID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pId);
			result = pstmt.executeUpdate() == 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	} */

}
