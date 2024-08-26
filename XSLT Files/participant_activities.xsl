<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Parameter to hold the participant ID for filtering -->
    <xsl:param name="participantID" select="'00000001'"/>

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Upcoming Activities for Participant ID: <xsl:value-of select="$participantID"/></h2>
                <!-- Iterate over Activity elements that include the specified participant -->
                <xsl:for-each select="CarePlatform/Activities/Activity[Participants/Person[ID = $participantID]]">
                    <h3><xsl:value-of select="ActivityName"/></h3>
                    <p><xsl:value-of select="Description"/></p>
                    <p><strong>Scheduled:</strong> 
                        <xsl:value-of select="concat(Schedule/StartDate, ' ', Schedule/StartTime)"/> to 
                        <xsl:value-of select="concat(Schedule/EndDate, ' ', Schedule/EndTime)"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
