<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Service Providers Contact Information</h2>
                <!-- Begin HTML table -->
                <table border="1">
                    <tr>
                        <th>Provider Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                    </tr>
                    <!-- Iterate over each Provider element within Services -->
                    <xsl:for-each select="CarePlatform/Services/Service/Provider">
                        <tr>
                            <!-- Display the provider's name -->
                            <td><xsl:value-of select="Name"/></td>
                            <!-- Display the provider's phone number -->
                            <td><xsl:value-of select="Contact/Phone"/></td>
                            <!-- Display the provider's email address -->
                            <td><xsl:value-of select="Contact/Email"/></td>
                            <!-- Display the provider's address -->
                            <td>
                                <xsl:value-of select="Contact/Address/Street"/> <br/>
                                <xsl:value-of select="Contact/Address/City"/>, 
                                <xsl:value-of select="Contact/Address/State"/> 
                                <xsl:value-of select="Contact/Address/PostalCode"/><br/>
                                <xsl:value-of select="Contact/Address/Country"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
