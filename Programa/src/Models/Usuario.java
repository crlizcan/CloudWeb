package Models;

public class Usuario {
    
    private String usuario, contraseña, nombre, apellidos, direccion, telefono;

    public Usuario(String usuario, String contraseña, String nombre, String apell, String direc, String tlfo) {
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
    }
    
    public Usuario(String usuario, String contraseña) {
		this.usuario = usuario;
		this.contraseña = contraseña;
	}

	public String getUsuario() {
        return usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    @Override
    public String toString() {
        return "Usuario [usuario=" + usuario + ", contraseña=" + contraseña + ", nombre=" + nombre + ", apellidos="
                + apellidos + ", direccion=" + direccion + ", telefono=" + telefono + "]";
    }
 
}
