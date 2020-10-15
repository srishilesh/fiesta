<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
                <!--
                <link rel="stylesheet" href="../css/tablecss.css" />
                <link rel="stylesheet" href="../css/style.css" />
                -->
                <link rel="stylesheet" href="tablecss.css" />
                <link rel="stylesheet" href="style.css" />
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia" />
            </head>
            <body>
                <center>
                    <h2>Student Personal profile</h2>
                </center>
                <table class="table_props" id="table-title">
                    <tr id="table-heading">

                        <th>Stu_ID</th>
                        <th>DOB</th>
                        <th>Curr_Year</th>
                        <th>Department</th>
                        <th>About</th>
                        <th>Phone Number</th>
                        <th>School</th>
                        <th>Student_address</th>
                        <th>Socialmedia_1</th>
                        <th>Socialmedia_2</th>
                        <th>Socialmedia_3</th>
                        
                    </tr>
                    <xsl:for-each select="root/profile-personal">
                        <tr>
                            <td>
                                <xsl:value-of select="student_id" />
                            </td>
                            <td>
                                <xsl:value-of select="student_dob" />
                            </td>
                            <td>
                                <xsl:value-of select="student_year_of_study" />
                            </td>
                            
                            <td>
                                <xsl:value-of select="student_dept" />
                            </td>
                            <td>
                                <xsl:value-of select="student_about_myself" />
                            </td>
                            <td>
                                <xsl:value-of select="student_phone" />
                            </td>
                            <td>
                                <xsl:value-of select="student_school" />
                            </td>
                            <td>
                                <xsl:value-of select="student_address" />
                            </td>
                            <td>
                                <xsl:value-of select="student_socialmedia/student_socialmedia_1" />
                            </td>
                            <td>
                                <xsl:value-of select="student_socialmedia/student_socialmedia_2" />
                            </td>
                            <td>
                                <xsl:value-of select="student_socialmedia/student_socialmedia_3" />
                            </td>
                            
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>