package munjae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmpClass {
	public EmpClass() {
        runQueries();
    }

    private void runQueries() {
    	DBConnection db = new DBConnection();
        db.executeQuery(
            "select EmpNo, EmpName, Salary from Employee where Dept = '개발부'",
            "부서가 개발부인 사원의 사번, 이름, 급여를 조회",
            rs -> System.out.printf(" - %d. %s : %d원 %n", rs.getInt("EmpNo"), rs.getString("EmpName"), rs.getInt("Salary"))
        );

        db.executeQuery(
            "select EmpName, Dept from Employee where Salary >= 3000000",
            "급여가 3000000원 이상인 사원의 이름과 부서를 조회.",
            rs -> System.out.printf(" - %s : %s %n", rs.getString("EmpName"), rs.getString("Dept"))
        );

    }

}
