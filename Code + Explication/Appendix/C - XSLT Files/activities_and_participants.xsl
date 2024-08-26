<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Activities and Participants</h2>
                <!-- Iterate over each Activity element -->
                <xsl:for-each select="CarePlatform/Activities/Activity">
                    <h3><xsl:value-of select="ActivityName"/></h3>
                    <p><xsl:value-of select="Description"/></p>
                    <h4>Participants:</h4>
                    <ul>
                        <!-- Iterate over each Person element within Participants -->
                        <xsl:for-each select="Participants/Person">
                            <!-- Display each participant's full name and email -->
                            <li>
                                <xsl:value-of select="concat(FirstName, ' ', LastName, ' (', Email, ')')"/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
