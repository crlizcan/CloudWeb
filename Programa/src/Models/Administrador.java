package Models;

public class Administrador {
    private String usuario, password, nif, nombre, apellidos, telefono, direccion;

    public Administrador(String usuario, String password, String nif, String nombre, String apellidos,
            String telefono, String direccion) {
        this.usuario = usuario;
        this.password = password;
        this.nif = nif;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.direccion = direccion;
    }
    
    public Administrador(String usuario, String password) {
		super();
		this.usuario = usuario;
		this.password = password;
	}

	public String getUsuario() {
        return usuario;
    }


    public String getPassword() {
        return password;
    }


    public String getNif() {
        return nif;
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

    public String getDireccion() {
        return direccion;
    }
    
	@Override
	public String toString() {
		return "Administrador [usuario=" + usuario + ", password=" + password + ", nif=" + nif + ", nombre="
				+ nombre + ", apellidos=" + apellidos + ", telefono=" + telefono + ", direccion=" + direccion + "]";
	}

}
