<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

	<html>
		<head>
			<style>
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
                        width: 48%;
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
				.min {
    			background-color: #B6F7F3;
				}
				.max {
    			background-color: #FFF87F;
}
		.borde {
                	padding: 6px;
                        border: 3px solid #0044ff;
                        background-color: white;
                        border-radius: 4px;
                }
			</style>
   </head>
   <body>
   	<div class="borde">
			<h1>RESERVAS</h1>
			<table>
				<tr>
    			 <th>Usuario</th>
				 <th>Fecha y hora</th>
				 <th>Mesa</th>
				 <th>Número de comensales</th>
    			</tr>
    			<xsl:for-each select="ResOdi/Reservas/Reserva">
			      <tr>  
					<td><xsl:value-of select="Usuario_Usu"/></td>
				    <td><xsl:value-of select="Fecha_hora"/></td>
			          <xsl:choose>
			          <xsl:when test="Num_Comensales &gt;= 7">
			              <td class="max">
			                  <xsl:value-of select="Mesa"/>
			              </td>
			          </xsl:when>
			          <xsl:otherwise>
						<td class="min">
						  <xsl:value-of select="Mesa"/>
						</td>				
					</xsl:otherwise>
		          </xsl:choose>
		          <td><xsl:value-of select="Num_Comensales"/></td>
          </tr>
    </xsl:for-each>
			</table>
			</div>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>

