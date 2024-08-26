from lxml import etree

# Sample XML Data (typically, you would load this from a file)
xml_data = """
<CarePlatform>
    <Services>
        <Service>
            <ServiceID>00000001</ServiceID>
            <ServiceName>Home Care</ServiceName>
            <Description>Personal assistance and home care services.</Description>
            <Provider>
                <ProviderID>00000001</ProviderID>
                <Name>Caregivers Inc.</Name>
                <Contact>
                    <Phone>+1112223333</Phone>
                    <Email>contact@caregivers.com</Email>
                    <Address>
                        <Street>789 Elm St</Street>
                        <City>Metropolis</City>
                        <State>Regionburg</State>
                        <PostalCode>54321</PostalCode>
                        <Country>Landville</Country>
                    </Address>
                </Contact>
            </Provider>
            <Schedule>
                <StartDate>2024-08-01</StartDate>
                <EndDate>2024-12-31</EndDate>
                <StartTime>08:00:00</StartTime>
                <EndTime>18:00:00</EndTime>
            </Schedule>
        </Service>
        <Service>
            <ServiceID>00000002</ServiceID>
            <ServiceName>Medical Transport</ServiceName>
            <Description>Transportation services for medical appointments.</Description>
            <Provider>
                <ProviderID>00000002</ProviderID>
                <Name>HealthTrans Co.</Name>
                <Contact>
                    <Phone>+4445556666</Phone>
                    <Email>support@healthtrans.com</Email>
                    <Address>
                        <Street>101 Pine St</Street>
                        <City>Capitol City</City>
                        <State>Stateville</State>
                        <PostalCode>13579</PostalCode>
                        <Country>Countryland</Country>
                    </Address>
                </Contact>
            </Provider>
            <Schedule>
                <StartDate>2024-08-10</StartDate>
                <EndDate>2024-12-31</EndDate>
                <StartTime>07:00:00</StartTime>
                <EndTime>20:00:00</EndTime>
            </Schedule>
        </Service>
    </Services>
</CarePlatform>
"""

# Parse the XML data
root = etree.fromstring(xml_data)

# Define the target date
target_date = "2024-08-10"

# Find services scheduled on the target date
services = root.xpath(f"//Service[Schedule/StartDate = '{target_date}']")

# Print out the results
print(f"Services scheduled on {target_date}:\n")

for service in services:
    service_name = service.find("ServiceName").text
    provider_name = service.find("Provider/Name").text
    start_time = service.find("Schedule/StartTime").text
    end_time = service.find("Schedule/EndTime").text
    
    print(f"Service Name: {service_name}")
    print(f"Provider: {provider_name}")
    print(f"Start Time: {start_time}")
    print(f"End Time: {end_time}\n")
