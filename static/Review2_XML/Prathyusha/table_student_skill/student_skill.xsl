<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <style>
      body{
        color: white;
    }
    table, th, td{
        border: 1px solid white;
    }
    </style>
    
</head>
<body>
    <h1>Students and their skills:</h1>
    <table>
         <tr>
           <th>id</th>
           <th>Primary Skill</th>
           <th>Primary Skill Rating</th>           
         </tr>
            <xsl:for-each select="skillset/student">
            <tr> 
              <td><xsl:value-of select="student_id"/></td> 
              <td><xsl:value-of select="primary_skill"/></td> 
              <td><xsl:value-of select="ps_rating"/></td> 
            </tr> 
          </xsl:for-each>             
    </table>

    <div>
       <h1>Best performers:</h1>
       <xsl:for-each select="skillset/student">
        <xsl:choose>
           <xsl:when test="ps_rating &gt; 3">
             <ul>
              <li><xsl:value-of select="student_id"/></li>
            </ul>              
         </xsl:when>       
      <xsl:choose>            
     </xsl:for-each> 
    </div>

    <!-- <div>
     <h1>Best perfromers in Badminton:</h1>
      <xsl:for-each select="skillset/student">
            <xsl:if test="primary_skill="Badminton"">
            <ul>
              <li><xsl:value-of select="student_id"/></li>
            </ul>
            </xsl:if>
      </xsl:for-each>       
    </div> -->



</body>
</html>

</xsl:template>
</xsl:stylesheet>