package BD;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Vector;

import Models.Administrador;
import Models.Usuario;

public class BD_Administrador extends BD_Conector {
    
    private static Statement stat;
    private static ResultSet res;
    
    public BD_Administrador(String base) {
        super(base);
    }
    
    /* Recibe un objeto de la clase Usuario y lo da de alta.
     * Devuelve el numero de celdas afectadas en la BBDD */
    public int altaAdministrador(Administrador administrador) throws BD_Exception {
        String sql = "INSERT INTO administradores VALUES ('" + administrador.getUsuario() + "', '" + administrador.getPassword() + "', '"
                    + administrador.getNif() + "', " + administrador.getNombre() + "', " + administrador.getApellidos() + "', " 
                    + administrador.getTelefono() + administrador.getDireccion() + "')";
        
        try {
            this.abrir();
            stat = conexion.createStatement();
            int numCeldas = stat.executeUpdate(sql);
            this.cerrar();
            return numCeldas;
        } catch (SQLException e) {
            this.cerrar();
            throw new BD_Exception("[ERROR] No se puede dar de alta al administrador indicado");
        }
    }

    /* Recibe un objeto de la clase Usuario, y mediante su usuario y contraseña lo da de baja.
     * Devuelve el numero de celdas afectadas en la BBDD */
    public int bajaAdministrador(Administrador administrador) throws BD_Exception {
		String SQL = "DELETE FROM usuarios WHERE usuario = '" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
		
        try {
			this.abrir();
			stat = conexion.createStatement();
			int numCeldas = stat.executeUpdate(SQL);
			this.cerrar();
			return numCeldas;
		} catch (SQLException e) {
            this.cerrar();
			throw new BD_Exception("[ERROR] No se puede dar de baja al administrador indicado");
		}
	}

    public Administrador buscarAdministrador(Administrador administrador) throws BD_Exception {
		String SQL = "SELECT * FROM administradores WHERE usuario = '" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        Administrador administradorBuscado = null;

        try {
			this.abrir();
			stat = conexion.createStatement();
			res = stat.executeQuery(SQL);

			if (res.next())
                administradorBuscado = new Administrador(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getString(7));
			this.cerrar();
			return administradorBuscado;
		} catch (SQLException e) {
            this.cerrar();
			throw new BD_Exception("[ERROR] No se puede buscar el administrador");
		}
	}

    public Vector<Administrador> mostrarAdministradores() throws BD_Exception {
		String SQL = "SELECT * FROM administradores";
		Vector<Administrador> administradores = new Vector<Administrador>();
		
        try {
			this.abrir();
			stat = conexion.createStatement();
			res = stat.executeQuery(SQL);

			while (res.next())
				administradores.add(new Administrador(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getString(7)));
			this.cerrar();
			return administradores;
		} catch (SQLException e) {
            this.cerrar();
			throw new BD_Exception("[ERROR] No se puede realizar el listado de administradores");
		}
	}

    public int modificarUsuarios(Administrador administrador) throws BD_Exception {
        Scanner sc = new Scanner(System.in);
        String SQL = "";
        HashMap<String, Integer> datos = new HashMap<String, Integer>();

        datos.put("usuario", 1);
        datos.put("password", 2);
        datos.put("nif", 3);
        datos.put("nombre", 4);
        datos.put("apellidos", 5);
        datos.put("telefono", 6);
        datos.put("direccion", 7);

        System.out.println(datos);
        System.out.println("Introduce una opcion: ");
        int opcionModificar = sc.nextInt();
        
        /* Opciones para modificar datos del usuario */
        // usuario
		if (opcionModificar == 1) {
            System.out.print("Introduce nuevo nombre de administrador: ");
            String user = sc.nextLine();
            SQL = "UPDATE administradores SET usuario = '" + user + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
        // password
        if (opcionModificar == 2) {
            System.out.print("Introduce nueva password: ");
            String pass = sc.nextLine();
            SQL = "UPDATE administradores SET password = '" + pass + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
	     // nif
        if (opcionModificar == 3) {
            System.out.print("Introduce nuevo nif: ");
            String nif = sc.nextLine();
            SQL = "UPDATE administradores SET nif = '" + nif + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
        // nombre
        if (opcionModificar == 4) {
            System.out.print("Introduce nuevo nombre: ");
            String nombre = sc.nextLine();
            SQL = "UPDATE administradores SET nombre = '" + nombre + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
        // apellidos
        if (opcionModificar == 5) {
            System.out.print("Introduce nuevos apellidos: ");
            String apellidos = sc.nextLine();
            SQL = "UPDATE administradores SET apellidos = '" + apellidos + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
        // telefono
        if (opcionModificar == 6) {
            System.out.print("Introduce nuevo telefono: ");
            String telefono = sc.nextLine();
            SQL = "UPDATE administradores SET usuario = '" + telefono + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
	    // direccion
        if (opcionModificar == 7) {
            System.out.print("Introduce nueva direccion: ");
            String direccion = sc.nextLine();
            SQL = "UPDATE administradores SET usuario = '" + direccion + "' WHERE usuario='" + administrador.getUsuario() + "' AND password = '" + administrador.getPassword() + "'";
        }
        
        try {
            this.abrir();
            stat = conexion.createStatement();
            int numCeldas = stat.executeUpdate(SQL);
            this.cerrar();
            return numCeldas;
        } catch (SQLException e) {
            this.cerrar();
            throw new BD_Exception("[ERROR] No se puede modificar el administrador indicado");
        }
	}
}