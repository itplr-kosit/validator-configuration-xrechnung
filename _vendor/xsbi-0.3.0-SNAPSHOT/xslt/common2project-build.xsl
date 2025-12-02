<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math" version="3.0">


  <xsl:mode on-no-match="shallow-copy" />
  <xsl:output method="xml" encoding="UTF-8" indent="true" />

  <xsl:template match="/project/@name">
    <xsl:attribute name="{name()}" select="'new-project-name'" />

  </xsl:template>

  <!-- Removing abu-common specific property -->
  <xsl:template match="/project/property[@name = 'abu-common.build.file']" />

</xsl:stylesheet>
