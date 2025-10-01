package munjae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookClass {
	public BookClass() {
        runQueries();
    }

    private void runQueries() {
    	DBConnection db = new DBConnection();
    	db.executeQuery(
            "SELECT Title FROM book WHERE PubYear >= 2020",
            "2020년 이후 출판된 도서",
            rs -> System.out.println(" - " + rs.getString("Title"))
        );

        db.executeQuery(
            "SELECT b.Title FROM book AS b " +
            "INNER JOIN Rental AS r ON b.BookID = r.BookID " +
            "INNER JOIN Members AS m ON r.MemberID = m.MemberID " +
            "WHERE m.Name = '홍길동'",
            "홍길동 회원이 대출한 도서 목록",
            rs -> System.out.println(" - " + rs.getString("Title"))
        );

        db.executeQuery(
            "SELECT b.Title FROM book AS b " +
            "INNER JOIN Rental AS r ON b.BookID = r.BookID " +
            "WHERE r.RentDate IS NOT NULL AND r.ReturnDate IS NULL",
            "반납하지 않은 도서",
            rs -> System.out.println(" - " + rs.getString("Title"))
        );

        db.executeQuery(
            "SELECT b.Title, COUNT(r.RentalID) AS RentCount " +
            "FROM Book AS b LEFT JOIN Rental AS r ON b.BookID = r.BookID " +
            "GROUP BY b.Title",
            "도서별 대출 횟수",
            rs -> System.out.printf(" - %s : %d회%n", rs.getString("Title"), rs.getInt("RentCount"))
        );

        db.executeQuery(
            "SELECT Title, Price FROM book ORDER BY Price DESC LIMIT 1",
            "가장 비싼 도서",
            rs -> System.out.printf(" - %s (%,d원)%n", rs.getString("Title"), rs.getInt("Price"))
        );
    }

    

}
