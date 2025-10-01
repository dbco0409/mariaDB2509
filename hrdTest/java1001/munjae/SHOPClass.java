package munjae;

public class SHOPClass {

    public SHOPClass() {
        runQueries();
    }

    private void runQueries() {
    	DBConnection db = new DBConnection();
        db.executeQuery(
            "select CustName, Phone, JoinDate from ShopMember where Grade = 'A'",
            "고객등급이 A등급인 회원의 이름, 전화번호, 가입일자를 조회",
            rs -> System.out.printf(" - %s : %s / %s %n", rs.getString("CustName"), rs.getString("Phone"), rs.getString("JoinDate"))
        );

        db.executeQuery(
            "select CustName from ShopMember where JoinDate >= 2020",
            "가입일자가 2020년 이후인 회원을 조회",
            rs -> System.out.println(" - " + rs.getString("CustName"))
        );

        db.executeQuery(
            "SELECT s.CustNo, m.CustName, SUM(s.Price) AS TotalAmount FROM ShopMember AS m INNER JOIN Sale AS s ON m.CustNo = s.CustNo GROUP BY s.CustNo, m.CustName",
            "회원별 총 구매금액을 구하시오. (출력: 회원번호, 회원성명, 총금액)",
            rs -> System.out.printf(" - %d. %s - %d원%n", rs.getInt("CustNo"), rs.getString("CustName"), rs.getInt("TotalAmount"))
        );

        db.executeQuery(
            "SELECT m.CustNo, m.CustName, SUM(s.Price) AS TotalAmount FROM ShopMember AS m INNER JOIN Sale AS s ON m.CustNo = s.CustNo GROUP BY m.CustNo, m.CustName ORDER BY TotalAmount DESC LIMIT 1;",
            "가장 구매금액이 높은 회원의 이름과 금액을 조회",
            rs -> System.out.printf("- %d. %s : (%d원)%n", rs.getInt("CustNo"), rs.getString("CustName"), rs.getInt("TotalAmount"))
        );
    }

}
