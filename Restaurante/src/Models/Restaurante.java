package Models;

public class Restaurante {
    
    private Usuario usuarios;
    private Administrador administradores;
    private Alergeno alergenos;
    private Plato platos;
    private TipoPlato tipos;
    private Promocion promociones;
    private Incidencia incidencias;
    
    public Restaurante(Usuario usuarios, Administrador administradores, Alergeno alergenos, Plato platos,
            TipoPlato tipos, Promocion promociones, Incidencia incidencias) {
        this.usuarios = usuarios;
        this.administradores = administradores;
        this.alergenos = alergenos;
        this.platos = platos;
        this.tipos = tipos;
        this.promociones = promociones;
        this.incidencias = incidencias;
    }

    @Override
    public String toString() {
        return "Restaurante [usuarios=" + usuarios + ", administradores=" + administradores + ", alergenos=" + alergenos
                + ", platos=" + platos + ", tipos=" + tipos + ", promociones=" + promociones + ", incidencias="
                + incidencias + "]";
    }

}
