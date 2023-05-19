package App;

import java.util.Locale;
import java.util.Scanner;

import BD.BD_Exception;
import BD.BD_Usuario;
import BD.BD_Administrador;
import Models.Administrador;
import Models.Usuario;

public class App {
	public static void main(String[] args) throws Exception {
		/* Input */
		Scanner sc = new Scanner(System.in).useLocale(Locale.ENGLISH);
		/* Menu */
		int opcion;
		/* Datos de un Usuario */
		BD_Usuario BD_Usuario = new BD_Usuario("Restaurante");
		BD_Administrador BD_Administrador = new BD_Administrador("Restaurante");
		Usuario usuario=null;
		Administrador administrador=null;
		String user, pass, nombre, apell, direcc, telef;
		int tipoUser;

		/* Iniciar sesión o registrarse */
		System.out.println("[PANTALLA DE INICIO]");
		do {
			usuario=autentificacionUsu(sc, BD_Usuario);
			if(usuario==null) {
			administrador=autentificacionAdmin(sc, BD_Administrador);
			}
		} while (usuario==null && administrador==null);
		
		

	}
//Si elige inicio de sesión pido el usuario y contraseña. Tengo que comprobar si es usuario o admin.
	public static Usuario autentificacionUsu(Scanner sc, BD_Usuario BD_Usuario) throws BD_Exception {
		int opcion;
		Usuario usuario, usuarioBuscado;
		String user;
		String pass;
		String nombre;
		String apell;
		String direcc;
		String telef;
		System.out.println("[AUTENTIFICACIÓN]");
		System.out.println("1 - Iniciar sesión\n2 - Registrarse");
		do {
			opcion = sc.nextInt();
		} while (opcion < 1 && opcion > 2);
		sc.nextLine();
		if(opcion==1) {
			System.out.println("Introduce usuario:");
			user = sc.nextLine();
			System.out.println("Introduce contraseña:");
			pass = sc.nextLine();
			
			usuario = new Usuario(user, pass);
			
			usuarioBuscado=BD_Usuario.buscarUsuario(usuario);
			if (usuarioBuscado != null)
				System.out.println("{¡BIENVENIDO!}");
			else if (usuarioBuscado == null)
				System.out.println("{DATOS DE ACCESO INCORRECTOS}");
			return usuarioBuscado;
		}
		else {
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
				System.out.println("{USUARIO AÑADIDO CON EXITO}");
			else if (BD_Usuario.altaUsuario(usuario) == 0)
				System.out.println("{NO SE HA AÑADIDO NINGÚN USUARIO}");
			return usuario;
		}
	}
	
	public static Administrador autentificacionAdmin(Scanner sc, BD_Administrador BD_Administrador) throws BD_Exception {
		int opcion;
		Administrador adminBuscado=null, admin;
		String user;
		String pass;
		String nombre;
		String apell;
		String direcc;
		String telef;
		System.out.println("[AUTENTIFICACIÓN]");
		System.out.println("1 - Iniciar sesión\n2 - Registrarse");
		do {
			opcion = sc.nextInt();
		} while (opcion < 1 && opcion > 2);
		sc.nextLine();
		if(opcion==1) {
			System.out.println("Introduce usuario:");
			user = sc.nextLine();
			System.out.println("Introduce contraseña:");
			pass = sc.nextLine();
			
			admin = new Administrador(user, pass);
			adminBuscado=BD_Administrador.buscarAdministrador(admin);

			if (adminBuscado != null)
				System.out.println("{¡BIENVENIDO!}");
			else if (adminBuscado == null)
				System.out.println("{DATOS DE ACCESO INCORRECTOS}");
		}
		return adminBuscado;
	}
}
