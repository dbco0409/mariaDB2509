package munjae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GolfClass {
	public GolfClass() {
        runQueries();
    }

    private void runQueries() {
    	DBConnection db = new DBConnection();
    	db.executeQuery(
            "select MName, Phone, JoinDate from GolfMember where Grade = 'A'",
            "A등급 회원의 이름, 전화번호, 가입일자를 조회",
            rs -> System.out.printf(" - %s : %s / %s %n", rs.getString("MName"), rs.getString("Phone"), rs.getString("JoinDate"))
        );

    	db.executeQuery(
            "select * from Lesson where Fee >= 250000",
            "강습비가 250000 이상인 강습 내역을 조회.",
            rs -> System.out.printf(" - %s : %d원 %n", rs.getString("Coach"), rs.getInt("Fee"))
        );

    	db.executeQuery(
            "SELECT m.MName, SUM(u.Cost) AS TotalCost FROM GolfMember AS m INNER JOIN `Usage` AS u ON m.MNo = u.MNo GROUP BY m.MNo, m.MName",
            "회원별 총 이용요금을 집계. (회원명, 총요금)",
            rs -> System.out.printf(" - %s - %d원%n", rs.getString("MName"), rs.getInt("TotalCost"))
        );

    	db.executeQuery(
            "SELECT m.Grade, COUNT(DISTINCT m.MNo) AS MemberCount, AVG(l.Fee) AS AvgLessonFee, SUM(u.Cost) AS TotalUsageCost FROM GolfMember AS m LEFT JOIN Lesson AS l ON m.MNo = l.MNo LEFT JOIN `Usage` AS u ON m.MNo = u.MNo GROUP BY m.Grade",
            "등급별 통계 (등급 : 회원수, 평균 강습비, 총 이용요금)을 조회",
            rs -> System.out.printf("- %s등급 : %d명, %d원, %d원 %n", rs.getString("Grade"), rs.getInt("MemberCount"), rs.getInt("AvgLessonFee"), rs.getInt("TotalUsageCost"))
        );
    }


}
