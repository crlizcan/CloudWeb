<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    @font-face{
                    font-family: Baloo;
                    src: url('Baloo.ttf');
                    }
                    body {
                    font-family:Century Gothic;
                    font-size:16px;
                    }
                    
                    h1 {
                    margin: auto;
                    text-align: center;
                    color: #0044ff;
                    background-color: white;
                    width: 28%;
                    border: 2px solid #0044ff;
                    border-radius: 4px;
                    }
                    
                    table{
                    margin: auto;
                    width: 750px;
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
                    
                    .bebida{
                    background-color: #cfcfcf;
                    }
                    
                    .plato{
                    background-color: #white;
                    
                    }
                </style>
            </head>
            <body>
                <h1> PLATOS </h1>
                <table>
                    <tr class="nombre">
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Codigo del tipo</th>
                        <th>Precio</th>
                    </tr>
                    <xsl:for-each select="ResOdi/Platos/Plato">
                        <xsl:sort select="Precio"/>
                        <xsl:if test="starts-with(Codigo,'BB')">
                            <tr>
                                <td class="bebida"><xsl:value-of select="Codigo"/></td>
                                <td class="bebida"><xsl:value-of select="Nombre"/></td>
                                <td class="bebida"><xsl:value-of select="Codigo_tipo"/></td>
                                <td class="bebida"><xsl:value-of select="Precio"/> € </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="starts-with(Codigo,'PT')">
                            <tr>
                                <td class="plato"><xsl:value-of select="Codigo"/></td>
                                <td class="plato"><xsl:value-of select="Nombre"/></td>
                                <td class="plato"><xsl:value-of select="Codigo_tipo"/></td>
                                <td class="plato"><xsl:value-of select="Precio"/> € </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
