<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo de Objetos</title>
            <style>
                body { font-family: Arial, sans-serif; background: #ececec; display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; padding: 20px; }
                .tarjeta { background: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 300px; overflow: hidden; display: flex; flex-direction: column; align-items: center; padding: 20px; text-align: center; }
                .tarjeta h2 { margin: 10px 0; font-size: 1.2rem; color: #333; }
                .etiqueta { background: #3498db; color: white; padding: 5px 10px; border-radius: 15px; font-size: 0.8rem; margin-bottom: 10px; }
                .estado { color: #27ae60; font-weight: bold; margin-bottom: 15px;}
                .qr-container img { width: 150px; height: 150px; border: 2px solid #ecf0f1; padding: 5px; border-radius: 8px;}
                .prop { font-size: 0.9rem; color: #7f8c8d; margin-top: 15px; border-top: 1px solid #eee; padding-top: 10px; width: 100%;}
            </style>
        </head>
        <body>
            <xsl:for-each select="inventario/item">
                <div class="tarjeta">
                    <span class="etiqueta"><xsl:value-of select="categoria"/></span>
                    <h2><xsl:value-of select="nombre"/></h2>
                    <span class="estado"><xsl:value-of select="estado"/></span>
                    
                    <div class="qr-container">
                        <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&amp;data=http://nvanis.github.io/mercadillo/item_{id}&amp;format=svg" alt="QR del producto {id}" />
                    </div>

                    <div class="prop">
                        Vendido por: <strong><xsl:value-of select="propietario"/></strong> (ID: <xsl:value-of select="id"/>)
                    </div>
                </div>
            </xsl:for-each>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
