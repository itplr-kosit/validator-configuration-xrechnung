<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    version="2.0">
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Convert dynamic <xsl:attribute name="id"> to static id attribute -->
    <xsl:template match="svrl:failed-assert[xsl:attribute[@name='id']] | svrl:successful-report[xsl:attribute[@name='id']]">
        <xsl:copy><xsl:attribute name="id">
                <xsl:value-of select="xsl:attribute[@name='id']"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()[not(self::xsl:attribute[@name='id'])]"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
