package xyz.itwill.dao;

import xyz.itwill.dto.ProductDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends JdbcDAO {
    private static ProductDAO _dao;

    private ProductDAO() {
        // TODO Auto-generated constructor stub
    }

    static {
        _dao = new ProductDAO();
    }

    public static ProductDAO getDAO() {
        return _dao;
    }

    // 상품정보(ProductDTO 객체)를 전달받아 PRODUCT 테이블의 행으로 삽입하고 삽입행의 갯수(int)를 반환하는 메소드
    public int insertProduct(ProductDTO product) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            String sql = "insert into product (PROD_NO, PROD_TYPE, PROD_NAME, PROD_PRICE, PROD_AMOUNT,"
            		+ " PROD_IMAGE1, PROD_IMAGE2, PROD_IMAGE3, PROD_IMAGE4, PROD_INFO, PROD_IN_DATE) " +
                         "values (PRODUCT_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, product.getProdType());
            pstmt.setString(2, product.getProdName());
            pstmt.setInt(3, product.getProdPrice());
            pstmt.setInt(4, product.getProdAmount());
            pstmt.setString(5, product.getProdImage1());
            pstmt.setString(6, product.getProdImage2());
            pstmt.setString(7, product.getProdImage3());
            pstmt.setString(8, product.getProdImage4());
            pstmt.setString(9, product.getProdInfo());

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]insertProduct() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // 상품번호(int)를 전달받아 PRODUCT 테이블에 저장된 하나의 행을 검색하여 검색된 상품정보(ProductDTO)를 반환하는 메소드
    public ProductDTO selectProductByNo(int prodNo) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductDTO product = null;
        try {
            con = getConnection();

            String sql = "select PROD_NO, PROD_TYPE, PROD_NAME, PROD_PRICE, PROD_AMOUNT, PROD_IMAGE1, "
            		+ "PROD_IMAGE2, PROD_IMAGE3, PROD_IMAGE4, PROD_INFO, PROD_IN_DATE from product where PROD_NO = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, prodNo);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new ProductDTO();
                product.setProdNo(rs.getInt("PROD_NO"));
                product.setProdType(rs.getInt("PROD_TYPE"));
                product.setProdName(rs.getString("PROD_NAME"));
                product.setProdPrice(rs.getInt("PROD_PRICE"));
                product.setProdAmount(rs.getInt("PROD_AMOUNT"));
                product.setProdImage1(rs.getString("PROD_IMAGE1"));
                product.setProdImage2(rs.getString("PROD_IMAGE2"));
                product.setProdImage3(rs.getString("PROD_IMAGE3"));
                product.setProdImage4(rs.getString("PROD_IMAGE4"));
                product.setProdInfo(rs.getString("PROD_INFO"));
                product.setProdInDate(rs.getString("PROD_IN_DATE"));
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectProductByNo() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return product;
    }

    // prod_type이 1인 모든 상품정보를 검색하여 리스트로 반환하는 메소드
    public List<ProductDTO> selectProductListByType1() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        try {
            con = getConnection();

            String sql = "select * from product where PROD_TYPE = 1";
            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProdNo(rs.getInt("PROD_NO"));
                product.setProdType(rs.getInt("PROD_TYPE"));
                product.setProdName(rs.getString("PROD_NAME"));
                product.setProdPrice(rs.getInt("PROD_PRICE"));
                product.setProdAmount(rs.getInt("PROD_AMOUNT"));
                product.setProdImage1(rs.getString("PROD_IMAGE1"));
                product.setProdImage2(rs.getString("PROD_IMAGE2"));
                product.setProdImage3(rs.getString("PROD_IMAGE3"));
                product.setProdImage4(rs.getString("PROD_IMAGE4"));
                product.setProdInfo(rs.getString("PROD_INFO"));
                product.setProdInDate(rs.getString("PROD_IN_DATE"));

                productList.add(product);
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectProductListByType1() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return productList;
    }

    // prod_type이 2인 모든 상품정보를 검색하여 리스트로 반환하는 메소드
    public List<ProductDTO> selectProductListByType2() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        try {
            con = getConnection();

            String sql = "select * from product where PROD_TYPE = 2";
            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProdNo(rs.getInt("PROD_NO"));
                product.setProdType(rs.getInt("PROD_TYPE"));
                product.setProdName(rs.getString("PROD_NAME"));
                product.setProdPrice(rs.getInt("PROD_PRICE"));
                product.setProdAmount(rs.getInt("PROD_AMOUNT"));
                product.setProdImage1(rs.getString("PROD_IMAGE1"));
                product.setProdImage2(rs.getString("PROD_IMAGE2"));
                product.setProdImage3(rs.getString("PROD_IMAGE3"));
                product.setProdImage4(rs.getString("PROD_IMAGE4"));
                product.setProdInfo(rs.getString("PROD_INFO"));
                product.setProdInDate(rs.getString("PROD_IN_DATE"));

                productList.add(product);
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectProductListByType2() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return productList;
    }

    // prod_type이 3인 모든 상품정보를 검색하여 리스트로 반환하는 메소드
    public List<ProductDTO> selectProductListByType3() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        try {
            con = getConnection();

            String sql = "select * from product where PROD_TYPE = 3";
            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProdNo(rs.getInt("PROD_NO"));
                product.setProdType(rs.getInt("PROD_TYPE"));
                product.setProdName(rs.getString("PROD_NAME"));
                product.setProdPrice(rs.getInt("PROD_PRICE"));
                product.setProdAmount(rs.getInt("PROD_AMOUNT"));
                product.setProdImage1(rs.getString("PROD_IMAGE1"));
                product.setProdImage2(rs.getString("PROD_IMAGE2"));
                product.setProdImage3(rs.getString("PROD_IMAGE3"));
                product.setProdImage4(rs.getString("PROD_IMAGE4"));
                product.setProdInfo(rs.getString("PROD_INFO"));
                product.setProdInDate(rs.getString("PROD_IN_DATE"));

                productList.add(product);
            }
        } catch (SQLException e) {
            System.out.println("[에러]selectProductListByType3() 메서드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return productList;
    }
}
