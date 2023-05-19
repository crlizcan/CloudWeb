<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    @import url('https://fonts.cdnfonts.com/css/century-gothic');
                    body { 
                        font-family:Century Gothic;
                        font-size:16px;
                    }
                    
                    table {
                    	margin: auto;
                    }
                    
                    h1 {
                    	margin: auto;
                        margin-bottom: 1%;
                    	text-align: center;
                        color: #0044ff;
                        background-color: white;
                        width: 28%;
                        border: 2px solid #0044ff;
                        border-radius: 4px;
                    }
     	
                    th {
                        background-color: #205bff;
                        border-radius: 4px;
                    }

                    tr { 
                        text-align: center;
                        height: 40px;
                        width: 200px;
                        border: 2px solid black;
                        border-radius: 4px;
                        margin-top: 10px;
                    }

                    td {
                    	background-color: white;
                        text-align: center;
                        border: 1px solid #0044ff;
                    }

					.tablaAdmin {
                    	padding: 6px;
                    	border: 3px solid #0044ff;
                        background-color: white;
                        border-radius: 4px;
                    }
                    
                    .owner td {
                    	color: black;
                        background-color: #cfcfcf;
                    }
                    
                    .owner .password {
                    	background-color: black;
                    }
                    
                    .password {
                    	background-color: black;
                    }
                    
                    .password:hover {
                    	background-color: white;
                        transition:  0.2s;
                        
                    }
                </style>
            </head>

            <body>

                <div class="tablaAdmin">
                    <h1> ADMINISTRADORES </h1>

                    <table>

                        <tr class="fila1">
                            <th>USUARIO</th>
                            <th>CONTRASEÑA</th>
                            <th>NIF</th>
                            <th>NOMBRE</th>
                            <th>APELLIDOS</th>
                            <th>TELÉFONO</th>
                            <th>DIRECCIÓN</th>
                        </tr>

                        <xsl:for-each select="ResOdi/Administradores/Cuenta">
                            <xsl:sort select="Usuario" data-type="text"/>
                            <xsl:choose>
                                <xsl:when test="NIF='82176339F' or NIF='77496879N'">

                                    <tr class="owner">
                                        <td><xsl:value-of select="Usuario"/></td>
                                        <td class="password"><xsl:value-of select="Password"/></td>
                                        <td><xsl:value-of select="NIF"/></td>
                                        <td><xsl:value-of select="Nombre"/></td>
                                        <td><xsl:value-of select="Apellidos"/></td>
                                        <td><xsl:value-of select="Telefono"/></td>
                                        <td><xsl:value-of select="Direccion"/></td>
                                    </tr>
                                    
                                </xsl:when>
                                <xsl:otherwise>

                                    <tr class="normal">
                                        <td><xsl:value-of select="Usuario"/></td>
                                        <td class="password"><xsl:value-of select="Password"/></td>
                                        <td><xsl:value-of select="NIF"/></td>
                                        <td><xsl:value-of select="Nombre"/></td>
                                        <td><xsl:value-of select="Apellidos"/></td>
                                        <td><xsl:value-of select="Telefono"/></td>
                                        <td><xsl:value-of select="Direccion"/></td>
                                    </tr>

                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each> 

                    </table>

                </div>

            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>