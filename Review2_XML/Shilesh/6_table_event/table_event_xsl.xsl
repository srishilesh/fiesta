<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
                <link rel="stylesheet" href="../css/tablecss.css" />
                <link rel="stylesheet" href="../css/style.css" />
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia" />
            </head>
            <body>
                <center>
                    <h2>Table Events</h2>
                </center>
                <table class="table_props" id="table-title">
                    <tr id="table-heading">
                        <th>Event_ID</th>
                        <th>Event Name</th>
                        <th>Event Description</th>
                        <th>Event Tags</th>
                        <th>Participation type</th>
                        <th>Start date and time</th>
                        <th>End date and time</th>
                        <th>Venue</th>
                        <th>Max no. of participants</th>
                        <th>Registration link</th>
                        <th>Organizer college</th>
                        <th>Organizer college - campus</th>
                        <th>Organizer name</th>
                        <th>Organizer email</th>
                        <th>Organizer phone</th>
                        <th>Organizer details</th>
                        <th>Poster</th>
                    </tr>
                    <xsl:for-each select="root/event">
                        <tr>
                            <td>
                                <xsl:value-of select="event_id" />
                            </td>
                            <td>
                                <xsl:value-of select="event_name" />
                            </td>
                            <td>
                                <xsl:value-of select="event_desc" />
                            </td>
                            <td>
                                <xsl:for-each select="event_tags">
                                    <xsl:call-template name="getTagField">
                                        <xsl:with-param name="tag" select="current()"></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:value-of select="event_type_participation" />
                            </td>
                            <td>
                                <xsl:value-of select="event_timing/event_start_datetime" />
                            </td>
                            <td>
                                <xsl:value-of select="event_timing/event_end_datetime" />
                            </td>
                            <td>
                                <xsl:value-of select="event_venue" />
                            </td>
                            <td>
                                <xsl:value-of select="event_max_participants" />
                            </td>
                            <td>
                                <xsl:value-of select="event_registration_link" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_intracollege/event_organizer_college" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_intracollege/event_organizer_campus" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_name" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_email" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_phone" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_details" />
                            </td>
                            <td>
                                <xsl:value-of select="event_organizer/event_organizer_poster" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="getTagField">
        <xsl:param name="tag" />
        <xsl:variable name="tagIds">
            <xsl:for-each select="//tag">
                <xsl:value-of select="@displayName"></xsl:value-of>
            </xsl:for-each>
        </xsl:variable>
        <xsl:element name="tags">
            <xsl:value-of select="normalize-space(concat($tag,','))" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>