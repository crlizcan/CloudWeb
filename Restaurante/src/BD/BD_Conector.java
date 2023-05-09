package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BD_Conector {
    
    private String base, usuario, contraseña, url;
    protected Connection conexion;

    /* Constructor con la informacion necesaria para conectar a la BBDD */
    public BD_Conector(String base) {
    	this.base = base;
        this.usuario = "root";
        this.contraseña = "a1234567";
        this.url = "jdbc:mysql://localhost/" + base;
    }

    /* Abrir una conexion con la BBDD */
    public void abrir() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        try {
            conexion = DriverManager.getConnection(url, usuario, contraseña);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    /* Cerrar una conexion con la BBDD */
    public void cerrar() {
        try {
            conexion.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
