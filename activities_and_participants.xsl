Appendices
Appendix A Complete XML Schema.
Below is the complete XML Schema (XSD) that was developed for the project. This schema defines the structure of the XML documents used in the collaborative platform for social and medical care for disabled and elderly individuals.
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           elementFormDefault="qualified"
           attributeFormDefault="unqualified">

    <!-- Definition of simple types -->
    <xs:simpleType name="IDType">
        <xs:restriction base="xs:string">
            <xs:pattern value="\d{8}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="DateType">
        <xs:restriction base="xs:date"/>
    </xs:simpleType>

    <xs:simpleType name="TimeType">
        <xs:restriction base="xs:time"/>
    </xs:simpleType>

    <xs:simpleType name="EmailType">
        <xs:restriction base="xs:string">
            <xs:pattern value="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"/>
        </xs:restriction>
    </xs:simpleType>

    <!-- Definition of complex types -->
    <xs:complexType name="PersonType">
        <xs:sequence>
            <xs:element name="ID" type="IDType"/>
            <xs:element name="FirstName" type="xs:string"/>
            <xs:element name="LastName" type="xs:string"/>
            <xs:element name="DOB" type="DateType"/>
            <xs:element name="Email" type="EmailType" minOccurs="0"/>
            <xs:element name="Phone" type="xs:string" minOccurs="0"/>
            <xs:element name="Address" type="AddressType"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="AddressType">
        <xs:sequence>
            <xs:element name="Street" type="xs:string"/>
            <xs:element name="City" type="xs:string"/>
            <xs:element name="State" type="xs:string"/>
            <xs:element name="PostalCode" type="xs:string"/>
            <xs:element name="Country" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ServiceType">
        <xs:sequence>
            <xs:element name="ServiceID" type="IDType"/>
            <xs:element name="ServiceName" type="xs:string"/>
            <xs:element name="Description" type="xs:string"/>
            <xs:element name="Provider" type="ProviderType"/>
            <xs:element name="Schedule" type="ScheduleType"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ProviderType">
        <xs:sequence>
            <xs:element name="ProviderID" type="IDType"/>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Contact" type="ContactType"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ContactType">
        <xs:sequence>
            <xs:element name="Phone" type="xs:string"/>
            <xs:element name="Email" type="EmailType"/>
            <xs:element name="Address" type="AddressType"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ScheduleType">
        <xs:sequence>
            <xs:element name="StartDate" type="DateType"/>
            <xs:element name="EndDate" type="DateType"/>
            <xs:element name="StartTime" type="TimeType"/>
            <xs:element name="EndTime" type="TimeType"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ActivityType">
        <xs:sequence>
            <xs:element name="ActivityID" type="IDType"/>
            <xs:element name="ActivityName" type="xs:string"/>
            <xs:element name="Description" type="xs:string"/>
            <xs:element name="Participants" type="ParticipantsType"/>
            <xs:element name="Schedule" type="ScheduleType"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ParticipantsType">
        <xs:sequence>
            <xs:element name="Person" type="PersonType" maxOccurs="unbounded"/>
        </xs:sequence>
    </xs:complexType>

    <!-- Root element -->
    <xs:element name="CarePlatform">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="Persons" type="PersonsType"/>
                <xs:element name="Services" type="ServicesType"/>
                <xs:element name="Activities" type="ActivitiesType"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>

    <!-- Aggregation of complex types -->
    <xs:complexType name="PersonsType">
        <xs:sequence>
            <xs:element name="Person" type="PersonType" maxOccurs="unbounded"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ServicesType">
        <xs:sequence>
            <xs:element name="Service" type="ServiceType" maxOccurs="unbounded"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ActivitiesType">
        <xs:sequence>
            <xs:element name="Activity" type="ActivityType" maxOccurs="unbounded"/>
        </xs:sequence>
    </xs:complexType>

</xs:schema>

