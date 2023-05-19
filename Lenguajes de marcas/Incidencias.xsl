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
    <center>
    <h1>Incidencias</h1>
    <table>
        <tr>
            <th>Codigo</th>
            <th>Descripcion</th>
            <th>Fecha Inicio</th>
            <th>Fecha Solucion</th>
            <th>Administrador</th>
            <th>Usuarios</th>
        </tr>
        <xsl:for-each select="ResOdi/Incidencias/Incidencia">
            <tr>
                <td><xsl:value-of select="Codigo"/></td>
                <td><xsl:value-of select="Descripcion"/></td>
                <td><xsl:value-of select="Fecha_Inicio"/></td>
                <td><xsl:value-of select="Fecha_Solucion"/></td>
                <td><xsl:value-of select="Usuario_Admin"/></td>
                <td><xsl:value-of select="Usuario_Usu"/></td>
            </tr>
        </xsl:for-each>
    </table>
    </center>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

