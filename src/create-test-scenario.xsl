<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    exclude-result-prefixes=""
    xmlns="http://www.xoev.de/de/validator/framework/1/scenarios"
    
    xpath-default-namespace="http://www.xoev.de/de/validator/framework/1/scenarios"
    version="2.0">
    
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/scenarios/scenario[namespace/@prefix='invoice']/createReport">
        <xsl:copy >
            <xsl:apply-templates select="@*|node()"/>
            <!--  adding content for testing-->
            
            <xsl:comment>For testing only!</xsl:comment>
            
            <xsl:element name="customLevel">
                <xsl:attribute name="level">warning</xsl:attribute>
                <xsl:text>BR-09</xsl:text>
            </xsl:element>
            
        </xsl:copy>
        
    </xsl:template>
    
</xsl:stylesheet>