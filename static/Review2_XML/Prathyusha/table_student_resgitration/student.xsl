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
    <h1>Students Registered:</h1>
    <table>
         <tr>
           <th>id</th>
           <th>Name</th>
           <th>Rollnumber</th>
           <th>Gmail</th>
           <th>Password</th>
         </tr>
            <xsl:for-each select="student/row">
            <tr> 
              <td><xsl:value-of select="id"/></td> 
              <td><xsl:value-of select="name"/></td> 
              <td><xsl:value-of select="rollnumber"/></td> 
              <td><xsl:value-of select="gmail"/></td> 
              <td><xsl:value-of select="password"/></td> 
            </tr> 
          </xsl:for-each>        

         
    </table>
    <div>
     <h1>List of Students:</h1>
      <xsl:for-each select="student/row">
            <ul>
              <li><xsl:value-of select="name"/></li>
            </ul>            
      </xsl:for-each>       
    </div>
    
</body>
</html>

</xsl:template>
</xsl:stylesheet>
