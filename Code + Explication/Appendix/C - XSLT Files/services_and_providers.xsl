<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to HTML for browser compatibility -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>List of Services and Providers</h2>
                <!-- Begin HTML table -->
                <table border="1">
                    <tr>
                        <th>Service Name</th>
                        <th>Description</th>
                        <th>Provider Name</th>
                        <th>Contact Email</th>
                    </tr>
                    <!-- Iterate over each Service element -->
                    <xsl:for-each select="CarePlatform/Services/Service">
                        <tr>
                            <!-- Extract and display the service name -->
                            <td><xsl:value-of select="ServiceName"/></td>
                            <!-- Extract and display the service description -->
                            <td><xsl:value-of select="Description"/></td>
                            <!-- Extract and display the provider's name -->
                            <td><xsl:value-of select="Provider/Name"/></td>
                            <!-- Extract and display the provider's contact email -->
                            <td><xsl:value-of select="Provider/Contact/Email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
