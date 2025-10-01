package munjae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ArtistClass {
	public ArtistClass() {
        runQueries();
    }

    private void runQueries() {
    	DBConnection db = new DBConnection();
    	db.executeQuery(
            "select ArtistName, Agency from Artist where Genre = 'K-POP'",
            "장르가 'K-POP'인 아티스트의 이름과 소속사를 조회",
            rs -> System.out.printf(" - %s : %s %n", rs.getString("ArtistName"), rs.getString("Agency"))
        );

        db.executeQuery(
            "select AlbumTitle, Sales from Album where Sales >= 1000000",
            "판매량이 1,000,000이상인 앨범의 제목과 판매량을 조회",
            rs -> System.out.printf(" - %s : %d건 %n", rs.getString("AlbumTitle"), rs.getInt("Sales"))
        );

        db.executeQuery(
            "SELECT a.ArtistName, SUM(b.Sales) as saleCount FROM Artist AS a INNER JOIN Album AS b ON a.ArtistNo = b.ArtistNo GROUP BY a.ArtistName",
            "아티스트별 총 판매량을 구하시오.(출력: 아티스트명, 총 판매량)",
            rs -> System.out.printf(" - %s - %d건%n", rs.getString("ArtistName"), rs.getInt("saleCount"))
        );

        db.executeQuery(
            "SELECT a.Agency, COUNT(DISTINCT a.ArtistNo) AS ArtistCount, SUM(b.Sales) AS TotalSales FROM Artist AS a INNER JOIN Album AS b ON a.ArtistNo = b.ArtistNo GROUP BY a.Agency",
            "소속사별 매출현황",
            rs -> System.out.printf("- %s : %d명, %d원 %n", rs.getString("Agency"), rs.getInt("ArtistCount"), rs.getInt("TotalSales"))
        );
    }

}
