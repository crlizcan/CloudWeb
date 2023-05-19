<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body {
                    font-family: Century Gothic;
                    font-size: 22px;
                    background-color: white;
                    color: black;
                    }
                    
                    h1 {
                    text-align: center;
                    color: #0044ff;
                    background-color: white;
                    width: 28%;
                    border: 2px solid #0044ff;
                    border-radius: 4px;
                    margin: 0 auto;
                    margin-bottom: 1%;
                    margin-top: 1%;
                    }
                    
                    table {
                    margin: 0 auto;
                    width: 90%;
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
                    border: 1px solid #547ae2;
                    }
                    
                    img {
                    margin: 0 auto;
                    display: block;
                    width: 80px;
                    height: 100px;
                    }
                    
                    .color {
                    background-color: #ffffff;
                    color: black;
                    font-weight: bold;
                    }
                    
                    .color:hover {
                    background-color: #1a45bd;
                    color: #E5E4E2;
                    }
                    
                    th {
                    background-color: #205bff;
                    border-radius: 4px;
                    }
                    
                    .borde {
                    border: 3px solid #0044ff;
                    border-radius: 4px;
                    }
                </style>  
            </head>
            <body>
                <h1>Alérgenos</h1>
                <table>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Imagen</th>
                    </tr>
                    <xsl:for-each select="ResOdi/Alergenos/Alergeno">
                        <xsl:sort select="Codigo" order="ascending"/>
                        <tr>
                            <td class="color"><xsl:value-of select="Codigo"/></td>
                            <td><xsl:value-of select="Nombre"/></td>
                            <td><img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="Imagen"/>
                                    </xsl:attribute>
                                </img></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>