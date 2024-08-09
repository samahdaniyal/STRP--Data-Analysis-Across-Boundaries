import pandas as pd
import pyodbc

server = "DESKTOP-0P7E96H"
database = "Muslim Countries' Data"  # Name of the database
use_windows_authentication = True  # Set to True to use Windows Authentication

connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};Trusted_Connection=yes;'
connection = pyodbc.connect(connection_string)
cursor = connection.cursor()

# # Insert dimensions
# dimensions = ["Climate and Environment", "Agriculture"]
# for dimension in dimensions:
#     cursor.execute("INSERT INTO Dimensions (DimensionName) VALUES (?)", dimension)
# connection.commit()

# Function to get DimensionID by DimensionName
def get_dimension_id(dimension_name):
    cursor.execute("SELECT DimensionID FROM Dimensions WHERE DimensionName = ?", dimension_name)
    result = cursor.fetchone()
    print(f"DimensionID for {dimension_name}: {result[0] if result else 'Not found'}")  # Debug output
    return result[0] if result else None

# # Insert indicators with DimensionID
indicators = {
#     "GDP growth (annual %)": "Economic", //
#     "Income share held by lowest 20%": "Economic", //
#     "Income share held by lowest 10%": "Economic", //
#     "Income share held by highest 10%": "Economic", //
#     "Income share held by highest 20%": "Economic", //
#     "GDP (current US$)": "Economic", //
#     "GDP per capita, PPP (current international $)": "Economic", //
#     "GDP per capita (current US$)": "Economic", // 
#     "CPIA gender equality rating (1=low to 6=high)": "Development", //
#     "Access to electricity (% of population)": "Development", //
#     "Life expectancy at birth, total (years)": "Health", //
#     "Infant Mortality rate (per 1,000 live births)": "Health", //
#     "People using at least basic sanitation services (% of population)" : "Health", //
#     "People using at least basic drinking water services (% of population)" : "Health", //
#     "Current health expenditure (% of GDP)" : "Health", //
#     "Current health expenditure per capita (current US$)" : "Health", //
#     "Current health expenditure per capita, PPP (current international $)" : "Health", //
#     "Starting a business (Score)" : "Business Environment", //
#     "Starting a business (Cost) - Men (% of income per capita) - Score" : "Business Environment", //
#     "Starting a business (Cost) - Men (% of income per capita)" : "Business Environment", //
#     "Starting a business (Cost) - Women (% of income per capita) - Score" : "Business Environment", //
#     "Starting a business (Cost) - Women (% of income per capita)" : "Business Environment", //
#     "Starting a business, Minimum capital (% of income per capita)" : "Business Environment", //
#     "Starting a business, Procedures required - Men (number) - Score" : "Business Environment", //
#     "Starting a business, Procedures required - Women (number) - Score" : "Business Environment", //
#     "Starting a business, Time - Men (days) - Score" : "Business Environment", //
#     "Starting a business, Time - Women (days) - Score" : "Business Environment", //
#     "Population, total" : "Demographic", //
#     "Households [number]" : "Demographic", //
#     "Labor force, female (% of total labor force)" : "Demographic", //
#     "Employees, % of Total Employment" : "Demographic", //
#     "Growth Rate of Population, Annual" : "Demographic", //
#     "Population Density, per km2" : "Demographic", //
#     "Mortality Rate, Adult, Both Sexes" : "Health",
#     "Articles Published" : "Technology and Innvoavtion",
#     "Proportion of Individuals Using the Internet, Both Sexes" : "Technology and Innvoavtion",
#     "Internet Access at Home, Estimated Proportion of Households" : "Technology and Innvoavtion",
#     "Internet Bandwidth, International" : "Technology and Innvoavtion",
#     "Computers Ownership, Estimated Proportion of Households" : "Technology and Innvoavtion",
#     "Technical cooperation grants (BoP, current US$)" : "Technology and Innvoavtion",
#     "Scientific and technical journal articles" : "Technology and Innvoavtion",
#     "Air Quality Index" : "Climate and Environment",
#     "CH4 Emissions (kilotonnes) - AFOLU" : "Climate and Environment",
#     "CO2 Emissions (kilotonnes) - AFOLU" : "Climate and Environment",
#     "N2O Emissions (kilotonnes) - AFOLU" : "Climate and Environment",
#     "Green House Gas growth (annual %)" : "Climate and Environment",
#     "Greenhouse Gas Emissions" : "Climate and Environment",
#     "Agricultural Area (in Thousands)" : "Agriculture",
    # "Agricultural Area, % of Land Area" : "Agriculture",
    # "Agricultural Products, Exports (in Thousands)" : "Agriculture",
    # "Agricultural Products, Imports (in Thousands)" : "Agriculture",
    # "Agricultural Raw Materials, Exports" : "Agriculture",
    # "Agricultural Raw Materials, Imports": "Agriculture",
    # "Agriculture Share of Government Expenditure" : "Agriculture",
    # "All Food Items, Exports" : "Agriculture",
    # "All Food Items, Imports" : "Agriculture",
    # "Barley, Production" : "Agriculture",
    # "Cereals, Production" : "Agriculture",
    # "Cotton, Production (in Thousands) (480 lb. Bales)" : "Agriculture",
    # "Maize, Production" : "Agriculture",
    # "Meat, Production" : "Agriculture",
    # "Millet, Production" : "Agriculture",
    # "Primary Fruits, Production" : "Agriculture",
    # "Primary Vegetables, Production" : "Agriculture",
    # "Rice, Production" : "Agriculture",
    # "Sorghum, Production" : "Agriculture",
    # "Wheat, Production" : "Agriculture"
}

for indicator, dimension in indicators.items():
    dimension_id = get_dimension_id(dimension)
    cursor.execute("INSERT INTO Indicators (IndicatorName, DimensionID) VALUES (?, ?)", indicator, dimension_id)
connection.commit()

# Load the CSV file
file_path = r'Wheat, Production.csv'
df = pd.read_csv(file_path)

# Function to get CountryID by CountryName
def get_country_id(country_name):
    cursor.execute("SELECT CountryCode FROM Countries WHERE CountryName = ?", country_name)
    result = cursor.fetchone()
    print(f"CountryID for {country_name}: {result[0] if result else 'Not found'}")  # Debug output
    return result[0] if result else None

# Function to get IndicatorID by IndicatorName
def get_indicator_id(indicator_name):
    cursor.execute("SELECT IndicatorID FROM Indicators WHERE IndicatorName = ?", indicator_name)
    result = cursor.fetchone()
    print(f"IndicatorID for {indicator_name}: {result[0] if result else 'Not found'}")  # Debug output
    return result[0] if result else None

# Define the indicator name
indicator_name = 'Wheat, Production'
indicator_id = get_indicator_id(indicator_name)

# Check the correct columns for years
years = [str(year) for year in range(2000, 2024) if str(year) in df.columns]

# Iterate over the rows in the dataframe and insert data into the database
for index, row in df.iterrows():
    country_name = row['Country Name']
    country_code = row['Country Code']
    country_id = get_country_id(country_name)
    
    if not country_id:
        continue  # Skip if the country is not found in the database

    for year in years:
        value = row[year]
        if pd.isna(value):
            continue  # Skip NaN values
        year_value = int(year)  # Extract year from column name
        print(f"Inserting data for {country_name}, Year: {year_value}, Value: {value}")  # Debug output
        cursor.execute('''
            INSERT INTO Data (CountryCode, IndicatorID, Year, Value)
            VALUES (?, ?, ?, ?)
        ''', country_id, indicator_id, year_value, value)

connection.commit()
cursor.close()
connection.close()
