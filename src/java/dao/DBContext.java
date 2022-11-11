/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Vinh Cao
 */
public class DBContext {
     private static DBContext instance;
    private Connection connection;

    private DBContext() {
        Properties properties = new Properties();
        try {
            properties.load(DBContext.class.getResourceAsStream("dbConfig.properties"));

            String driver = properties.getProperty("driver");
            String url = properties.getProperty("url");
            String userName = properties.getProperty("userName");
            String password = properties.getProperty("password");

            Class.forName(driver);

            connection = DriverManager.getConnection(url, userName, password);

        } catch (ClassNotFoundException | SQLException | IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * Get the connection from the instance
     *
     * @return {@link Connection}
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * Create new instance which connects with the database.
     *
     * @return DBUtils
     * @throws SQLException if connection false.
     */
    public static DBContext getInstance() throws SQLException {
        if (instance == null || instance.getConnection().isClosed()) {
            instance = new DBContext();
        }
        return instance;
    }
    protected void closeConnection(ResultSet rs, PreparedStatement ps, Connection cnn) throws Exception {
        try {
            if (rs != null) {
                if (!rs.isClosed()) {
                    rs.close();
                }
            }
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                if (ps != null) {
                    if (!ps.isClosed()) {
                        ps.close();
                    }
                }
            } catch (Exception e) {
                throw e;
            } finally {
                if (cnn != null) {
                    if (!cnn.isClosed()) {
                        cnn.close();
                    }
                }
            }
        }
    }
    public String getImagePath() throws Exception {
        return "images/";
    }
}
