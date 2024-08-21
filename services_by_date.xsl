<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Parameter to accept a target date for filtering services -->
    <xsl:param name="targetDate" select="'2024-08-10'"/>

    <!-- Template to match the root element and apply transformation -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Services Scheduled on <xsl:value-of select="$targetDate"/></h2>
                <table border="1">
                    <tr>
                        <th>Service Name</th>
                        <th>Provider</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                    </tr>
                    <!-- For each Service with a matching StartDate, generate a row -->
                    <xsl:for-each select="CarePlatform/Services/Service[Schedule/StartDate = $targetDate]">
                        <tr>
                            <td><xsl:value-of select="ServiceName"/></td>
                            <td><xsl:value-of select="Provider/Name"/></td>
                            <td><xsl:value-of select="Schedule/StartTime"/></td>
                            <td><xsl:value-of select="Schedule/EndTime"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>