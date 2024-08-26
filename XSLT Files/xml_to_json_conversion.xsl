<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to text to generate JSON format -->
    <xsl:output method="text" indent="yes" />
    <xsl:strip-space elements="*"/>

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        {
            "Activities": [
                <!-- Iterate over each Activity element -->
                <xsl:for-each select="CarePlatform/Activities/Activity">
                    {
                        <!-- Convert ActivityID to JSON format -->
                        "ActivityID": "<xsl:value-of select='ActivityID'/>",
                        <!-- Convert ActivityName to JSON format -->
                        "ActivityName": "<xsl:value-of select='ActivityName'/>",
                        <!-- Convert Description to JSON format -->
                        "Description": "<xsl:value-of select='Description'/>",
                        "Participants": [
                            <!-- Iterate over each Person element within Participants -->
                            <xsl:for-each select="Participants/Person">
                                {
                                    <!-- Convert ID, FirstName, LastName, and Email to JSON format -->
                                    "ID": "<xsl:value-of select='ID'/>",
                                    "FirstName": "<xsl:value-of select='FirstName'/>",
                                    "LastName": "<xsl:value-of select='LastName'/>",
                                    "Email": "<xsl:value-of select='Email'/>"
                                }<xsl:if test="position() != last()">,</xsl:if>
                            </xsl:for-each>
                        ]
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
            ]
        }
    </xsl:template>
</xsl:stylesheet>
