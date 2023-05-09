package App;

import java.util.Locale;
import java.util.Scanner;

import BD.BD_Usuario;
import Models.Usuario;

public class App {
    public static void main(String[] args) throws Exception {
        /* Input */
        Scanner sc = new Scanner(System.in).useLocale(Locale.ENGLISH);
        /* Menu */
        int opcion;
        /* Datos de un Usuario */
        BD_Usuario BD_Usuario = new BD_Usuario("Restaurante");
        Usuario usuario;
        String user, pass, nombre, apell, direcc, telef;
        int tipoUser;

        /* Menu Principal */
        System.out.println("[GESTION DE LA BASE DE DATOS]");
        System.out.println("1 - Administradores\n2 - Usuarios\n3 - Reservas\n4 - Pedidos\n5 - Incidencias\n6 - Platos\n7 - Tipos de platos\n8 - Alergenos\n9 - Promociones");
        System.out.print(" -> ");
        opcion = sc.nextInt();

        switch (opcion) {
            /* Opcion 1 - Añadir Usuario (Puede ser normal o administrador) */
            case 1:
                System.out.println("[GESTION DE USUARIO]");
                System.out.println("1 - Alta\n2 - Baja\n3 - Modificar\n4 - Listar\n5 - Buscar");
                System.out.print(" -> ");
                opcion = sc.nextInt();

                if (opcion == 1) {
                    System.out.println("Introduce usuario:");
                    user = sc.nextLine();
                    System.out.println("Introduce contraseña:");
                    pass = sc.nextLine();
                    System.out.print("Introduce nombre: ");
                    nombre = sc.nextLine();
                    System.out.print("Introduce apellidos: ");
                    apell = sc.nextLine();
                    System.out.print("Introduce telefono: ");
                    telef = sc.nextLine();
                    System.out.print("Introduce direccion: ");
                    direcc = sc.nextLine();
      
                    usuario = new Usuario(user, pass, nombre, apell, direcc, telef);

                    if (BD_Usuario.altaUsuario(usuario) == 1)
                        System.out.println("{ALUMNO AÑADIDO CON EXITO}");
                    else if (BD_Usuario.altaUsuario(usuario) == 0)
                        System.out.println("{NO SE HA AÑADIDO NINGÚN ALUMNO}");
                }
                break;

            case 2:
                break;

            case 3:
                break;

            default:
                break;
        }
    }
}
