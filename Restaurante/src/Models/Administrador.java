package Models;

public class Administrador {
    private String usuario, contraseña, dni, nombre, apellidos, telefono;

    public Administrador(String usuario, String contraseña, String dni, String nombre, String apellidos,
            String telefono) {
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
    }
    
    public String getUsuario() {
        return usuario;
    }


    public String getContraseña() {
        return contraseña;
    }


    public String getDni() {
        return dni;
    }


    public String getNombre() {
        return nombre;
    }


    public String getApellidos() {
        return apellidos;
    }


    public String getTelefono() {
        return telefono;
    }

    @Override
    public String toString() {
        return "Administrador [usuario=" + usuario + ", contraseña=" + contraseña + ", dni=" + dni + ", nombre="
                + nombre + ", apellidos=" + apellidos + ", telefono=" + telefono + "]";
    }
    
}
