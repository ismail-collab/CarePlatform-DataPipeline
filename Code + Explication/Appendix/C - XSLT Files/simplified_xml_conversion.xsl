<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output method set to XML -->
    <xsl:output method="xml" indent="yes" />

    <!-- Root template matches the entire XML document -->
    <xsl:template match="/">
        <SimplifiedServices>
            <!-- Iterate over each Service element -->
            <xsl:for-each select="CarePlatform/Services/Service">
                <Service>
                    <!-- Extract and include the ServiceID -->
                    <ServiceID>
                        <xsl:value-of select="ServiceID"/>
                    </ServiceID>
                    <!-- Extract and include the ServiceName -->
                    <ServiceName>
                        <xsl:value-of select="ServiceName"/>
                    </ServiceName>
                    <!-- Extract and include the ProviderName -->
                    <ProviderName>
                        <xsl:value-of select="Provider/Name"/>
                    </ProviderName>
                </Service>
            </xsl:for-each>
        </SimplifiedServices>
    </xsl:template>
</xsl:stylesheet>
