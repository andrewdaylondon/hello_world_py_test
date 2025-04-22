<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dctm="http://www.documentum.com"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes" doctype-public="-//Croner//DTD Smart Gold 0401//EN" doctype-system="smart.dtd"/>
    
    <xsl:template match="/">
        <xsl:variable name="pass-one" as="element(smart)">
            <xsl:apply-templates mode="Generate-Smart-XML"/>    
        </xsl:variable>
        <xsl:variable name="darwin-smart-xml" as="element(smart)">
            <xsl:apply-templates select="$pass-one" mode="Smart-2-Darwin"/>    
        </xsl:variable>
        <xsl:copy-of select="$darwin-smart-xml"/>
    </xsl:template>
    
    <xsl:template match="smart" mode="Generate-Smart-XML">
        <smart id="{@id}" mini-product="{@mini-product}" 
            dctm:obj_status="{@dctm:obj_status}" dctm:obj_id="{@dctm:obj_id}"
            dctm:version_label="{@dctm:version_label}"><xsl:apply-templates mode="#current"/></smart>
    </xsl:template>
    
    <xsl:template match="metadata" mode="Generate-Smart-XML">
        <metadata><xsl:apply-templates mode="#current"/></metadata>
    </xsl:template>
    
    <xsl:template match="metadata/title" mode="Generate-Smart-XML">
        <title><xsl:apply-templates mode="#current"/></title>
    </xsl:template>
    
    <xsl:template match="metadata/productcode" mode="Generate-Smart-XML">
        <productcode code="{@code}"/>
    </xsl:template>
    
    <xsl:template match="metadata/producttype" mode="Generate-Smart-XML">
        <producttype type="{@type}"/>
    </xsl:template>
    
    <xsl:template match="metadata/issuedate" mode="Generate-Smart-XML">
        <issuedate day="{@day}" month="{@month}" year="{@year}"/>
    </xsl:template>
    
    <xsl:template match="section" mode="Generate-Smart-XML">
        <section id="{@id}" dctm:obj_status="{@dctm:obj_status}" dctm:obj_id="{@dctm:obj_id}"
            dctm:version_label="{@dctm:version_label}"><xsl:apply-templates mode="#current"/></section>
    </xsl:template>
    
    <xsl:template match="title" mode="Generate-Smart-XML">
        <title><xsl:apply-templates mode="#current"/></title>
    </xsl:template>
    
    <xsl:template match="gold-topic" mode="Generate-Smart-XML">
        <generic-commentary-topic id="{@id}" ><xsl:apply-templates mode="#current"/></generic-commentary-topic>
    </xsl:template>
    
    <xsl:template match="quickfacts" mode="Generate-Smart-XML">
        <level id="{@id}"><xsl:apply-templates mode="#current"/></level>
    </xsl:template>
    
    <xsl:template match="indepth" mode="Generate-Smart-XML">
        <level id="{@id}"><xsl:apply-templates mode="#current"/></level>
    </xsl:template>
    
    <xsl:template match="p" mode="Generate-Smart-XML">
        <p><xsl:apply-templates mode="#current"/></p>
    </xsl:template>
    
    <xsl:template match="ul" mode="Generate-Smart-XML">
        <ul><xsl:apply-templates mode="#current"/></ul>
    </xsl:template>
    
    <xsl:template match="li" mode="Generate-Smart-XML">
        <li><xsl:apply-templates mode="#current"/></li>
    </xsl:template>
    
    <xsl:template match="xref" mode="Generate-Smart-XML">
        <xref missing-destination-action="{@missing-destination-action}"><xsl:apply-templates mode="#current"/></xref>
    </xsl:template>
    
    <xsl:template match="xref-hottext" mode="Generate-Smart-XML">
        <xref-hottext refid="{@refid}"><xsl:apply-templates mode="#current"/></xref-hottext>
    </xsl:template>
    
    <xsl:template match="b">
        <b><xsl:apply-templates mode="#current"/></b>
    </xsl:template>
    
    <xsl:template match="i" mode="Generate-Smart-XML">
        <i><xsl:apply-templates mode="#current"/></i>
    </xsl:template>
    
    <xsl:template match="summary" mode="Generate-Smart-XML">
        <summary id="{@id}"><xsl:apply-templates mode="#current"/></summary>
    </xsl:template>
    
    <xsl:template match="inpractice" mode="Generate-Smart-XML">
        <inpractice id="{@id}"><xsl:apply-templates mode="#current"/></inpractice>
    </xsl:template>
    
    <xsl:template match="level" mode="Generate-Smart-XML">
        <level id="{@id}"><xsl:apply-templates mode="#current"/></level>
    </xsl:template>
    
    <xsl:template match="table" mode="Generate-Smart-XML">
        <table id="{@id}"><xsl:apply-templates mode="#current"/></table>
    </xsl:template>
    
    <xsl:template match="tgroup" mode="Generate-Smart-XML">
        <tgroup cols="{@cols}"><xsl:apply-templates mode="#current"/></tgroup>
    </xsl:template>
    
    <xsl:template match="colspec" mode="Generate-Smart-XML">
        <xsl:variable name="colwidth" select="if (@colwidth) then @colwidth else '100*'" as="xs:string"/>
        <colspec colname="{@colname}" colwidth="{@colwidth}"/>
    </xsl:template>
    
    <xsl:template match="tbody" mode="Generate-Smart-XML">
        <tbody><xsl:apply-templates mode="#current"/></tbody>
    </xsl:template>
    
    <xsl:template match="row" mode="Generate-Smart-XML">
        <row><xsl:apply-templates mode="#current"/></row>
    </xsl:template>
    
    <xsl:template match="entry" mode="Generate-Smart-XML">
        <xsl:variable name="colname" select="if (@colname) then @colname else 1" as="xs:integer"/>
        <xsl:variable name="morerows" select="if (@morerows) then @morerows else 0" as="xs:integer"/>
        <xsl:variable name="nameend" select="if (@nameend) then @nameend else 1" as="xs:integer"/>
        <xsl:variable name="namest" select="if (@namest) then @namest else 1" as="xs:integer"/>
        <entry colname="{$colname}" morerows="{$morerows}" nameend="{$nameend}" namest="{$namest}"><xsl:apply-templates mode="#current"/></entry>
        
    </xsl:template>
    
    
    <!-- ========================================================================================== -->	
    <!-- Any unmatched elements -->	
    <!-- ========================================================================================== -->	
    <xsl:template match="*" mode="GenerateSmartXML">
        <unmatched-answerconnect-element element-name="{name(.)}">
            <font color="red">
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="name(.)"/>
                <xsl:text>&gt;</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>&lt;/</xsl:text>
                <xsl:value-of select="name(.)"/>
                <xsl:text>&gt;</xsl:text>
            </font>
        </unmatched-answerconnect-element>
    </xsl:template>
</xsl:stylesheet>
