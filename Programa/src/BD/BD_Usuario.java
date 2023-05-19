package BD;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Vector;

import Models.Usuario;

public class BD_Usuario extends BD_Conector {
    
    private static Statement stat;
    private static ResultSet res;

    public BD_Usuario(String base) {
        super(base);
    }

    /* Recibe un objeto de la clase Usuario y lo da de alta.
     * Devuelve el numero de celdas afectadas en la BBDD */
    public int altaUsuario(Usuario usuario) throws BD_Exception {
        String sql = "INSERT INTO usuarios VALUES ('" + usuario.getUsuario() + "', '" + usuario.getContraseña() + "', '"
                    + usuario.getNombre() + "', " + usuario.getApellidos() + "', " + usuario.getDireccion() + "', " 
                    + usuario.getTelefono() + "', " + "')";
        
        try {
            this.abrir();
            stat = conexion.createStatement();
            int numCeldas = stat.executeUpdate(sql);
            this.cerrar();
            return numCeldas;
        } catch (SQLException e) {
            this.cerrar();
            throw new BD_Exception("[ERROR] No se puede dar de alta al usuario indicado");
        }
    }

    /* Recibe un objeto de la clase Usuario, y mediante su usuario y contraseña lo da de baja.
     * Devuelve el numero de celdas afectadas en la BBDD */
    public int bajaUsuario(Usuario usuario) throws BD_Exception {
		String SQL = "DELETE FROM usuarios WHERE usuario = '" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
		
        try {
			this.abrir();
			stat = conexion.createStatement();
			int numCeldas = stat.executeUpdate(SQL);
			this.cerrar();
			return numCeldas;
		} catch (SQLException e) {
            this.cerrar();
			throw new BD_Exception("[ERROR] No se puede dar de baja al usuario indicado");
		}
	}

    public Usuario buscarUsuario(Usuario usuario) throws BD_Exception {
		String SQL = "SELECT * FROM Usuarios WHERE Usuario = '" + usuario.getUsuario() + "' AND Password = '" + usuario.getContraseña() + "'";
        Usuario usuarioBuscado = null;

        try {
			this.abrir();
			stat = conexion.createStatement();
			res = stat.executeQuery(SQL);

			if (res.next())
                usuarioBuscado = new Usuario(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6));
			this.cerrar();
			return usuarioBuscado;
		} catch (SQLException e) {
            this.cerrar();
			throw new BD_Exception("[ERROR] No se puede realizar el listado de usuarios");
		}
	}

    public Vector<Usuario> mostrarUsuarios() throws BD_Exception {
		String SQL = "SELECT * FROM usuarios";
		Vector<Usuario> usuarios = new Vector<Usuario>();
		
        try {
			this.abrir();
			stat = conexion.createStatement();
			res = stat.executeQuery(SQL);

			while (res.next())
				usuarios.add(new Usuario(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6)));
			this.cerrar();
			return usuarios;
		} catch (SQLException e) {
            this.cerrar();
			throw new BD_Exception("[ERROR] No se puede realizar el listado de usuarios");
		}
	}

    public int modificarUsuarios(Usuario usuario) throws BD_Exception {
        Scanner sc = new Scanner(System.in);
        String SQL = "";
        HashMap<String, Integer> datos = new HashMap<String, Integer>();

        datos.put("usuario", 1);
        datos.put("contraseña", 2);
        datos.put("nombre", 3);
        datos.put("apellidos", 4);
        datos.put("direccion", 5);
        datos.put("telefono", 6);

        System.out.println(datos);
        System.out.println("Introduce una opcion: ");
        int opcionModificar = sc.nextInt();
        
        /* Opciones para modificar datos del usuario */
        // usuario
		if (opcionModificar == 1) {
            System.out.print("Introduce nuevo nombre de usuario: ");
            String user = sc.nextLine();
            SQL = "UPDATE usuarios SET usuario = '" + user + "' WHERE usuario='" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
        }
        // contraseña
        if (opcionModificar == 2) {
            System.out.print("Introduce nueva contraseña: ");
            String pass = sc.nextLine();
            SQL = "UPDATE usuarios SET contraseña = '" + pass + "' WHERE usuario='" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
        }
        // nombre
        if (opcionModificar == 3) {
            System.out.print("Introduce nuevo nombre: ");
            String nombre = sc.nextLine();
            SQL = "UPDATE usuarios SET nombre = '" + nombre + "' WHERE usuario='" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
        }
        // apellidos
        if (opcionModificar == 4) {
            System.out.print("Introduce nuevos apellidos: ");
            String apellidos = sc.nextLine();
            SQL = "UPDATE usuarios SET apellidos = '" + apellidos + "' WHERE usuario='" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
        }
        // direccion
        if (opcionModificar == 5) {
            System.out.print("Introduce nueva direccion: ");
            String direccion = sc.nextLine();
            SQL = "UPDATE usuarios SET usuario = '" + direccion + "' WHERE usuario='" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
        }
        // telefono
        if (opcionModificar == 6) {
            System.out.print("Introduce nuevo telefono: ");
            String telefono = sc.nextLine();
            SQL = "UPDATE usuarios SET usuario = '" + telefono + "' WHERE usuario='" + usuario.getUsuario() + "' AND password = '" + usuario.getContraseña() + "'";
        }

        try {
            this.abrir();
            stat = conexion.createStatement();
            int numCeldas = stat.executeUpdate(SQL);
            this.cerrar();
            return numCeldas;
        } catch (SQLException e) {
            this.cerrar();
            throw new BD_Exception("[ERROR] No se puede modificar el usuario indicado");
        }
	}
}
