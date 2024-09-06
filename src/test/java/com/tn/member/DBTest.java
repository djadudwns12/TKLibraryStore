package com.tn.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
@RunWith(SpringJUnit4ClassRunner.class) // test 패키지에서 Spring 컨테이너로 접근할수 있도록 함
@WebAppConfiguration
@ContextConfiguration // root-context.xml의 파일의 위치를 제공
(
		// locations = {"file : src/main/webapp/WEB-INF/spring/**/root-context.xml"}
		locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" }

)
public class DBTest {

//	해당 변수를 실행 시 dbconnection이 되도록 한다.
	@Test
	public void getConnection() {
		
//			conn 객체에 접근하지 않는 경우 아래의 코드를 실행한다.
			
			System.out.println("asdasdasdasd");
			
			try {
//				데이터베이스에 접근하는 드라이브를 실행
				Class.forName("org.mariadb.jdbc.Driver");
				System.out.println("드라이버 로딩성공!");
				
				String url = "jdbc:mariadb://mbcac2024.cafe24.com:3306/mbcac2024";
				String user = "mbcac2024";
				String password = "academymbc2024**";
// 드라이브메니저의 내장메소드를 이용해 우리가 사용할 dbms정보를 넘겨주고 있다.
				Connection conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch(SQLException sqle) {
				System.out.println("실패");
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	
}
