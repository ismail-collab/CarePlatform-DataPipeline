<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Parameter to hold the target month for filtering -->
    <xsl:param name="targetMonth" select="'2024-08'"/>

    <!-- Define a key to group services by provider name -->
    <xsl:key name="services-by-provider" match="Service" use="Provider/Name"/>

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Service Utilization Report for <xsl:value-of select="$targetMonth"/></h2>
                <!-- Begin HTML table -->
                <table border="1">
                    <tr>
                        <th>Provider</th>
                        <th>Number of Services</th>
                    </tr>
                    <!-- Iterate over services matching the target month and group by provider -->
                    <xsl:for-each select="CarePlatform/Services/Service[starts-with(Schedule/StartDate, $targetMonth)]">
                        <xsl:variable name="provider" select="Provider/Name"/>
                        <xsl:if test="generate-id() = generate-id(key('services-by-provider', $provider)[1])">
                            <tr>
                                <!-- Display the provider's name -->
                                <td><xsl:value-of select="$provider"/></td>
                                <!-- Count and display the number of services for the provider -->
                                <td><xsl:value-of select="count(key('services-by-provider', $provider)[starts-with(Schedule/StartDate, $targetMonth)])"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
