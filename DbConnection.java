package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {

	/*
	 * Constants
	 */
	
	private static final String SCHEMA = "projects";
	private static final String USER = "projects";
	private static final String PASSWORD = "projects";
	private static final String HOST = "localhost";
	private static final int PORT = 3306;
	
	/*
	 * Methods
	 */
	public static Connection getConnection() {
		String url = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&userSSL=false", HOST, PORT, SCHEMA, USER, PASSWORD);
		try {
			DriverManager.getConnection(url);
			System.out.println("Connection successful!");
		} catch (SQLException e) {
			System.out.println("Connection unsuccessful.");
			throw new DbException();
		}
		
		return null;
	}
	
}
